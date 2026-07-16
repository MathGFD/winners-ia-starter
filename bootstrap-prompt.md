# 🚀 O ONE-SHOT (cola isso no Claude Code)

Abre o Claude Code numa pasta vazia e cola este prompt. Ele instala meu setup inteiro:
binários, skills e o segundo cérebro no Obsidian.

---

```
Clone o repositório e rode o instalador (ele faz tudo — não precisa fazer os passos na mão):

    git clone https://github.com/MathGFD/winners-ia-starter
    bash winners-ia-starter/setup.sh --yes --vault ~/segundo-cerebro

O setup.sh instala as skills em ~/.claude/skills/ e monta o vault Obsidian (estrutura PARA:
0-Inbox, 1-Projetos, 2-Areas, 3-Recursos, 4-Arquivo, _Sistema/Wiki-LLM/raw e wiki) em
~/segundo-cerebro, já com CLAUDE.md, Home.md e ONBOARDING.md.

Me acompanhe pela saída do script e, no final, me diga em 3 linhas:
1) o que foi instalado,
2) o que ficou PENDENTE (o script lista os binários pendentes; some as chaves de API e modelos pesados),
3) qual o primeiro comando que eu devo testar.

Regras: os binários do Mac (whisper/yt-dlp/ffmpeg) são pesados e usam Homebrew — o script os
deixa como PENDENTE de propósito. Me mostre o comando `brew install ...` que ele imprimir e
pergunte antes de rodar. Não invente chaves de API — se uma skill precisar, diga qual e onde eu coloco.
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
