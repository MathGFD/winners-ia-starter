# 👋 Comece aqui — dá contexto pro teu Claude

O segredo de um Claude que responde bem não é prompt mágico. É **contexto**.
Um Claude que sabe quem você é responde 10x melhor. Vamos dar isso pra ele em 5 minutos.

Escolhe UM dos caminhos:

---

## ⚡ Caminho A — Você já usa alguma IA (ChatGPT, Gemini, Claude)?

Então ela já sabe MUITO sobre você. Vamos migrar isso.

**Passo 1.** Abre a IA que você já usava e cola este prompt:

```
Você tem histórico de conversas comigo. Quero migrar meu contexto pra uma nova
ferramenta de IA. Gere um DOSSIÊ COMPLETO sobre mim, denso e específico, pra outra
IA me entender na hora. Em tópicos:
1) Quem sou (nome, idade/cidade, o que faço, momento de vida)
2) Meu trabalho/negócio (o que vendo, pra quem, como ganho, metas)
3) Como falo e gosto de ser respondido (tom, o que me irrita, o que valorizo)
4) Projetos e prioridades atuais
5) Pessoas que eu cito
6) Dores, obstáculos e decisões em aberto
7) Ferramentas/preferências técnicas
8) Padrões recorrentes que você aprendeu de mim
Seja factual, cite exemplos reais das nossas conversas, e marque como "não sei"
o que não souber. Formate em markdown limpo, pronto pra colar.
```

**Passo 2.** Copia a resposta.

**Passo 3.** Abre o Claude Code nesta pasta, cola a resposta e digita `/meu-contexto`.
Pronto — ele escreve teu `CLAUDE.md` sozinho.

---

## ✍️ Caminho B — Não usa IA (ou ela não tem memória)?

Abre o Claude Code nesta pasta e digita `/meu-contexto`. Ele te faz 8 perguntas
rápidas e monta teu `CLAUDE.md` a partir das respostas.

---

## O que acontece depois

Teu `CLAUDE.md` passa a ser lido no começo de toda sessão. O Claude para de responder
genérico e passa a responder **pra você** — teu negócio, tua voz, tuas prioridades.

Daí é só usar: joga ideias no `0-Inbox/`, roda `/code` pra organizar, `/gerar-site`
pra fazer uma página, `/transcribe` pra virar vídeo em texto.

> Travou? Chama o @matheus_dickel.
