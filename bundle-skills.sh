#!/usr/bin/env bash
# bundle-skills.sh — SÓ O MATHEUS RODA ISSO (uma vez, antes de publicar o repo).
# Junta as skills-presente das duas pastas da máquina dele para dentro de ./skills/,
# pra o aluno receber tudo empacotado. Exclui modelos pesados e dados privados.
set -euo pipefail

REPO_DIR="$(cd "$(dirname "${BASH_SOURCE[0]}")" && pwd)"
GLOBAL="$HOME/.claude/skills"
VAULT="/Users/matheusdickel/CENTRAL DE CONTROLE - OBSIDIAN/CENTRAL DE CONTROLE/.claude/skills"
DST="$REPO_DIR/skills"
mkdir -p "$DST"

# Skills que vão no pacote grátis (as 11 curadas). NÃO incluir: dinheiro, call, coach-jj,
# brand, deals, vault-diario/tldr/reuniao (operação pessoal).
# gerador-de-clipes* ficam FORA (pesadas + personalizadas pro Matheus) — demo ao vivo na aula.
GLOBAL_SKILLS=( frontend-design )
# hook fica FORA (calibrada pro Matheus + lê arquivos de voz privados) — demo ao vivo.
VAULT_SKILLS=( code second-brain second-brain-ingest second-brain-query vault-setup \
               transcribe avoid-ai-writing nanobanana gerar-site meu-contexto )

copy_skill(){ # $1 = origem, $2 = nome
  local src="$1/$2"
  if [[ ! -d "$src" ]]; then echo "  ?? não achei: $src"; return; fi
  # exclui pesos/venv/binários e qualquer coisa privada
  rsync -a --delete \
    --exclude '*.bin' --exclude '*.gguf' --exclude '.venv/' --exclude 'models/' \
    --exclude 'bin/' --exclude '*.mp4' --exclude '*.wav' --exclude '.git/' \
    "$src/" "$DST/$2/"
  echo "  + $2"
}

echo "Empacotando skills em $DST ..."
for s in "${GLOBAL_SKILLS[@]}"; do copy_skill "$GLOBAL" "$s"; done
for s in "${VAULT_SKILLS[@]}";  do copy_skill "$VAULT"  "$s"; done

# --- sanitização: genericiza exemplos de marca que sobraram nas skills copiadas ---
echo "Sanitizando exemplos de marca..."
find "$DST" -name "*.md" -type f -exec sed -i '' \
  -e 's#2-Areas/Winners-Operacoes/#2-Areas/Operacoes/#g' \
  -e 's/Winners-Operacoes/Operacoes/g' {} +

echo ""
echo "Feito. Revise ./skills/ (confirme que NÃO vazou chave/dado privado) e faça o commit."
echo "Dica: 'grep -ri \"api_key\\|sk-\\|AKIA\\|Bearer\" skills/' pra caçar segredo antes de publicar."
