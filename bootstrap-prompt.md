# 🚀 O ONE-SHOT (cola isso no Claude Code)

Abre o Claude Code numa pasta vazia e cola este prompt. Ele instala meu setup inteiro:
binários, skills e o segundo cérebro no Obsidian.

---

```
Clone o repositório https://github.com/MathGFD/winners-ia-starter e depois:

1. Rode o setup.sh dele (bash winners-ia-starter/setup.sh) e me acompanhe pelo passo a passo,
   confirmando cada instalação.
2. Instale as skills da pasta skills/ em ~/.claude/skills/.
3. Monte um vault Obsidian com a estrutura PARA (0-Inbox, 1-Projetos, 2-Areas, 3-Recursos,
   4-Arquivo, _Sistema/Wiki-LLM/raw e wiki) copiando o CLAUDE.md e o Home.md do vault-template/.
4. No final, me diga em 3 linhas o que foi instalado, o que ficou pendente (chaves de API,
   modelos pesados) e qual o primeiro comando que eu devo testar.

Antes de instalar qualquer coisa via Homebrew, me avise e peça confirmação. Não invente
chaves de API — se uma skill precisar, me diga qual e onde eu coloco.
```

---

## Se preferir manual (sem colar prompt)
```bash
git clone https://github.com/MathGFD/winners-ia-starter
bash winners-ia-starter/setup.sh
```

## Depois de instalar — dá contexto pro teu Claude (5 min)
Abre o `ONBOARDING.md` no teu vault. Se você já usa alguma IA, ele te dá um prompt pra
colar lá que faz a IA cuspir um dossiê sobre você — daí `/meu-contexto` transforma isso
no teu `CLAUDE.md`. Contexto denso = Claude 10x melhor.

## O que você recebe
- **Binários** (Mac): whisper (transcrição local), yt-dlp (download), ffmpeg
- **11 skills**: `/code`, `/second-brain`, `/second-brain-ingest`, `/second-brain-query`,
  `/vault-setup`, `/meu-contexto`, `/transcribe`, `/avoid-ai-writing`,
  `/gerar-site`, `/nanobanana`, `/frontend-design`
- **Segundo cérebro** montado no Obsidian (PARA + sistema LLM-Wiki), igual ao meu — mas vazio, pra você preencher

> Travou? Chama no @matheus_dickel.
