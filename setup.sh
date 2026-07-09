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
if [[ "$INSTALL_BINS" == true ]]; then
  if ! command -v brew >/dev/null 2>&1; then
    warn "Homebrew não instalado."
    if ask "Instalar o Homebrew agora? (abre o instalador oficial)"; then
      /bin/bash -c "$(curl -fsSL https://raw.githubusercontent.com/Homebrew/install/HEAD/install.sh)"
    else
      warn "Pulei o Homebrew. Sem ele os binários não instalam."
    fi
  fi
  if command -v brew >/dev/null 2>&1; then
    for b in ffmpeg yt-dlp whisper-cpp; do
      if brew list "$b" >/dev/null 2>&1; then
        say "$b já instalado"
      elif ask "Instalar $b?"; then
        brew install "$b"
      fi
    done
  fi
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
if ask "Montar o segundo cérebro (vault PARA) agora?"; then
  read -r -p "Caminho do vault [~/segundo-cerebro]: " VPATH
  VPATH="${VPATH:-$HOME/segundo-cerebro}"
  VPATH="${VPATH/#\~/$HOME}"
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
say "Setup concluído."
echo ""
echo "PRÓXIMOS PASSOS:"
echo "  1. Abre o Claude Code na pasta do teu vault"
echo "  2. Abre o ONBOARDING.md e segue — cola o que tua IA antiga sabe de ti, roda /meu-contexto"
echo "  3. Depois testa: /vault-setup, /code, /gerar-site"
echo "  4. Skills com chave de API (nanobanana etc.) pedem a chave na 1ª vez — a chave é SUA, não vem no pacote."
echo ""
echo "Travou em algo? Chama o Matheus no @matheus_dickel."
