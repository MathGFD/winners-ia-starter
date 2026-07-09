# winners-ia-starter

O setup de IA do Matheus Dickel, empacotado. Um comando e você tem: os binários,
as skills do Claude Code e o segundo cérebro no Obsidian montado (PARA + LLM-Wiki).

## Instalar (aluno)

Abre o Claude Code numa pasta vazia e cola o one-shot de [`bootstrap-prompt.md`](bootstrap-prompt.md).

Ou manual:
```bash
git clone https://github.com/MathGFD/winners-ia-starter
bash winners-ia-starter/setup.sh
```

## O que vem

| Camada | O quê |
|---|---|
| Binários (Mac) | whisper (transcrição local), yt-dlp, ffmpeg |
| Skills (11) | `/code` `/second-brain` `/second-brain-ingest` `/second-brain-query` `/vault-setup` `/meu-contexto` `/transcribe` `/avoid-ai-writing` `/gerar-site` `/nanobanana` `/frontend-design` |
| Segundo cérebro | vault Obsidian PARA + sistema LLM-Wiki (template vazio) + ONBOARDING guiado |
| Contexto | `/meu-contexto` migra o que outra IA (ChatGPT/Gemini) já sabe de você pro teu CLAUDE.md |

## Requisitos
- **Claude Code** instalado ([claude.com/claude-code](https://claude.com/claude-code))
- **Mac** pros binários (Windows/Linux: skills e vault instalam; binários você faz manual)
- Chaves de API só onde a skill pedir (nanobanana/Gemini etc.) — **nenhuma chave vem no pacote**

## Notas
- `/gerador-de-clipes-mentoria` baixa modelos pesados (GB) só na 1ª execução.
- Nada é destrutivo: o setup nunca sobrescreve skill ou arquivo que já exista.

---
### Para o Matheus (manutenção)
Antes de publicar, rode `bash bundle-skills.sh` pra popular `skills/` a partir da sua máquina.
Depois **audite** (`grep -ri "api_key\|sk-\|Bearer\|AKIA" skills/`) pra garantir zero segredo/dado privado.
