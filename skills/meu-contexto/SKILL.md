---
name: meu-contexto
description: Cria ou atualiza o CLAUDE.md pessoal a partir de um dossiê que a pessoa cola (extraído da IA que ela já usava) ou de respostas a um questionário curto. Dá ao Claude o contexto-base de quem é a pessoa — nome, negócio, voz, projetos, dores — pra ele parar de responder genérico. Use quando alguém disser "/meu-contexto", "monta meu contexto", "cola aqui o que a outra IA sabe de mim", "cria meu CLAUDE.md", ou colar um dossiê pessoal querendo virar contexto permanente.
---

# /meu-contexto — Contexto-base do usuário

Transforma o que a pessoa sabe (ou o que a IA antiga dela sabe) num `CLAUDE.md` que dá contexto permanente. É o "por que o MEU Claude é diferente" na prática: contexto denso = respostas 10x melhores.

## Três caminhos de entrada

### A) Migração da IA antiga (preferido — zero fricção)
A pessoa já usa ChatGPT/Gemini/Claude? Ela cola ESTE prompt lá primeiro:

> Você tem histórico de conversas comigo. Quero migrar meu contexto pra uma nova ferramenta de IA. Gere um DOSSIÊ COMPLETO sobre mim, denso e específico, pra outra IA me entender na hora. Em tópicos: 1) Quem sou (nome, idade/cidade, o que faço, momento de vida). 2) Meu trabalho/negócio (o que vendo, pra quem, como ganho, metas). 3) Como falo e gosto de ser respondido (tom, o que me irrita, o que valorizo). 4) Projetos e prioridades atuais. 5) Pessoas que eu cito. 6) Dores, obstáculos, decisões em aberto. 7) Ferramentas/preferências técnicas. 8) Padrões recorrentes que você aprendeu de mim. Seja factual, cite exemplos reais das conversas, marque como "não sei" o que não souber. Markdown limpo, pronto pra colar.

Depois cola o resultado aqui e roda `/meu-contexto`.

### B) Questionário (fallback — não usa IA ou a IA não tem memória)
Faça estas perguntas, uma de cada vez, e espere a resposta:
1. Quem é você? (nome, idade, cidade, o que faz)
2. Como ganha dinheiro hoje — ou como pretende? O que vende e pra quem?
3. Qual sua meta pros próximos 90 dias?
4. Como quer que eu fale com você? (direto? técnico? informal? sem hype? me dá exemplo do que te irrita)
5. Quais 1-3 projetos estão te consumindo agora?
6. Qual sua maior dor/obstáculo atual?
7. Que ferramentas você usa no dia a dia?
8. Tem algo que eu PRECISO saber pra não errar com você?

### C) Já tem o dossiê pronto
A pessoa cola direto → pula pra síntese.

## Síntese (o que fazer com a entrada)
1. Lê o dossiê/respostas.
2. Escreve/atualiza o `CLAUDE.md` na raiz do vault com estas seções:
   - **Quem sou** · **Meu trabalho/negócio** · **Como falo / como quero ser atendido**
   - **Projetos e prioridades atuais** · **Pessoas** · **Dores e decisões em aberto** · **Ferramentas**
3. Calibra na voz da PRÓPRIA pessoa (não na sua). Se ela é informal, escreve informal.
4. Se um `CLAUDE.md` já existir, **mescla** (nunca apaga o que ela já tinha — atualiza).
5. Mostra o resultado e pergunta: "algo errado ou faltando?"

## Regras
- Nunca inventa dado. O que não souber, deixa como `<preencher>`.
- Factual e específico > genérico. "Vende mentoria de tráfego local pra dentistas" vale mais que "empreendedor digital".
- Não faz julgamento nem coaching — só organiza o contexto.
- É a base viva: sugere rodar de novo quando a vida da pessoa mudar.
