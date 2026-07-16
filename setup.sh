#!/usr/bin/env bash
# winners-ia-starter — instalador do setup de IA do Matheus Dickel
# Roda tudo: binários (Mac), skills do Claude Code e o segundo cérebro no Obsidian.
# Seguro: pede confirmação antes de instalar, não shippa chave de API, idempotente.
set -euo pipefail

REPO_DIR="$(cd "$(dirname "${BASH_SOURCE[0]}")" && pwd)"
GREEN='\033[0;32m'; YELLOW='\033[1;33m'; RED='\033[0;31m'; NC='\033[0m'
say(){ printf "${GREEN}==>${NC} %s\n" "$1"; }
warn(){ printf "${YELLOW}!! ${NC} %s\n" "$1"; }
err(){ printf "${RED}xx ${NC} %s\n" "$1"; }
ask(){ read -r -p "$1 [s/N] " r; [[ "$r" =~ ^[sS]$ ]]; }

# ---------- flags / interatividade ----------
# Rodado por um agente (Claude Code) ou via pipe, o stdin não é um terminal:
# nenhum `read` recebe resposta e tudo era pulado em silêncio. Aqui detectamos isso
# e assumimos os defaults seguros (skills + vault). Binários pesados (brew) NUNCA
# instalam sozinhos — viram PENDENTE no resumo final.
ASSUME_YES=false
VAULT_PATH="$HOME/segundo-cerebro"
while [[ $# -gt 0 ]]; do
  case "$1" in
    --yes|-y)     ASSUME_YES=true ;;
    --vault)      shift; VAULT_PATH="${1:?--vault precisa de um caminho}" ;;
    --vault=*)    VAULT_PATH="${1#*=}" ;;
    *)            warn "flag ignorada: $1" ;;
  esac
  shift
done
[[ ! -t 0 ]] && ASSUME_YES=true          # stdin não é terminal → modo não-interativo
INTERACTIVE=true; [[ "$ASSUME_YES" == true ]] && INTERACTIVE=false
VAULT_PATH="${VAULT_PATH/#\~/$HOME}"

echo ""
say "winners-ia-starter — setup do ambiente de IA"
echo ""

# ---------- 1. Sistema operacional ----------
OS="$(uname -s)"
if [[ "$OS" != "Darwin" ]]; then
  warn "Detectei $OS (não é Mac). Os binários (whisper/yt-dlp/ffmpeg) usam Homebrew = só macOS."
  warn "As SKILLS e o VAULT instalam normal. Os binários você instala manual no seu SO."
  INSTALL_BINS=false
else
  INSTALL_BINS=true
fi

# ---------- 2. Claude Code ----------
if ! command -v claude >/dev/null 2>&1; then
  warn "Claude Code não encontrado. Instala em: https://claude.com/claude-code (precisa antes de usar as skills)."
else
  say "Claude Code detectado: $(command -v claude)"
fi

# ---------- 3. Binários (Mac) ----------
MISSING_BINS=()
if [[ "$INSTALL_BINS" == true ]]; then
  if ! command -v brew >/dev/null 2>&1; then
    if [[ "$INTERACTIVE" == true ]] && ask "Homebrew não instalado. Instalar agora? (instalador oficial)"; then
      /bin/bash -c "$(curl -fsSL https://raw.githubusercontent.com/Homebrew/install/HEAD/install.sh)"
    else
      warn "Sem Homebrew — os binários ficam pendentes."
    fi
  fi
  for b in ffmpeg yt-dlp whisper-cpp; do
    if command -v brew >/dev/null 2>&1 && brew list "$b" >/dev/null 2>&1; then
      say "$b já instalado"
    elif [[ "$INTERACTIVE" == true ]] && command -v brew >/dev/null 2>&1 && ask "Instalar $b?"; then
      brew install "$b"
    else
      MISSING_BINS+=("$b")   # não-interativo ou sem brew: não instala calado, reporta no fim
    fi
  done
fi

# ---------- 4. Skills do Claude Code ----------
SKILLS_DST="$HOME/.claude/skills"
mkdir -p "$SKILLS_DST"
if [[ -d "$REPO_DIR/skills" ]]; then
  say "Instalando skills em $SKILLS_DST"
  for s in "$REPO_DIR"/skills/*/; do
    [[ -d "$s" ]] || continue
    name="$(basename "$s")"
    if [[ -d "$SKILLS_DST/$name" ]]; then
      warn "skill '$name' já existe — pulei (apague manual pra reinstalar)"
    else
      cp -R "$s" "$SKILLS_DST/$name"
      say "  + $name"
    fi
  done
else
  err "Pasta skills/ não encontrada no repo. Rode bundle-skills.sh antes (só o Matheus faz isso)."
fi

# ---------- 5. Segundo cérebro (Obsidian / PARA) ----------
echo ""
BUILD_VAULT=false
if [[ "$INTERACTIVE" == true ]]; then
  if ask "Montar o segundo cérebro (vault PARA) agora?"; then
    read -r -p "Caminho do vault [$VAULT_PATH]: " _v
    VAULT_PATH="${_v:-$VAULT_PATH}"; VAULT_PATH="${VAULT_PATH/#\~/$HOME}"
    BUILD_VAULT=true
  fi
else
  BUILD_VAULT=true   # não-interativo: monta no default (ou no --vault passado)
fi
if [[ "$BUILD_VAULT" == true ]]; then
  VPATH="$VAULT_PATH"
  mkdir -p "$VPATH"/{0-Inbox,1-Projetos,2-Areas,3-Recursos,4-Arquivo}
  mkdir -p "$VPATH"/_Sistema/Wiki-LLM/{raw,wiki}
  # arquivos-semente (não sobrescreve o que já existe)
  [[ -f "$VPATH/CLAUDE.md" ]]     || cp "$REPO_DIR/vault-template/CLAUDE.md"     "$VPATH/CLAUDE.md"
  [[ -f "$VPATH/Home.md" ]]       || cp "$REPO_DIR/vault-template/Home.md"       "$VPATH/Home.md"
  [[ -f "$VPATH/ONBOARDING.md" ]] || cp "$REPO_DIR/vault-template/ONBOARDING.md" "$VPATH/ONBOARDING.md"
  [[ -f "$VPATH/log.md" ]]        || printf "# Log mestre\n\n" > "$VPATH/log.md"
  say "Vault montado em: $VPATH"
  warn "Abre essa pasta como vault no Obsidian (Open folder as vault)."
  warn "PRIMEIRO PASSO dentro do vault: abre o ONBOARDING.md e segue — dá contexto pro teu Claude."
fi

# ---------- 6. Fim ----------
echo ""
if [[ ${#MISSING_BINS[@]} -gt 0 ]]; then
  warn "BINÁRIOS PENDENTES (não instalo sozinho — são pesados e usam brew): ${MISSING_BINS[*]}"
  warn "  Instala quando quiser:  brew install ${MISSING_BINS[*]}"
  warn "  Sem eles /transcribe e /gerador-de-clipes-* não rodam."
  echo ""
fi
say "Setup concluído."
echo ""
echo "PRÓXIMOS PASSOS:"
echo "  1. Abre o Claude Code na pasta do teu vault"
echo "  2. Abre o ONBOARDING.md e segue — cola o que tua IA antiga sabe de ti, roda /meu-contexto"
echo "  3. Depois testa: /vault-setup, /code, /gerar-site"
echo "  4. Skills com chave de API (nanobanana etc.) pedem a chave na 1ª vez — a chave é SUA, não vem no pacote."
echo ""
echo "Travou em algo? Chama o Matheus no @matheus_dickel."
