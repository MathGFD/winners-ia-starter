---
name: code
description: >
  Framework central do segundo cérebro para NOTAS PESSOAIS — método CODE
  (Capturar, Organizar, Destilar, Expressar) + PARA do Tiago Forte, adaptado
  ao vault do Matheus. Use quando ele quiser: guardar uma ideia/insight/
  highlight/citação/devaneio que "repercutiu", capturar algo rápido, organizar
  o inbox por acionabilidade (PARA), destilar uma nota com Sumarização
  Progressiva, ou linkar/montar pacotes intermediários a partir das notas.
  É DIFERENTE de second-brain-ingest (esse é pra FONTES BRUTAS do _Sistema/Wiki-LLM/raw/).
allowed-tools: Bash Read Write Edit Glob Grep
user-invocable: true
---

# CODE — Capturar · Organizar · Destilar · Expressar

Framework central do segundo cérebro do Matheus para o ciclo de **nota pessoal**.
Baseado em *Criando um Segundo Cérebro* (Tiago Forte): método CODE + sistema PARA.

> Convive com o resto: `second-brain-ingest` digere **fontes brutas** (`_Sistema/Wiki-LLM/raw/` → `_Sistema/Wiki-LLM/wiki/`).
> Esta skill cuida das **notas pessoais** (ideias, insights, highlights, devaneios)
> e do fluxo PARA. As duas alimentam a mesma wiki via `[[wikilinks]]`.

## Princípios inegociáveis

1. **Guarde o que repercute.** O critério-mãe da captura não é analítico — é o
   estalo de intuição (prazer, curiosidade, surpresa, "calou fundo"). Se não
   repercute, não captura.
2. **Organizar por acionabilidade, não por assunto.** A pergunta é sempre
   "em qual projeto/área isso é mais útil?", nunca "que tópico é esse?".
3. **Destilar pro eu-futuro.** Toda vez que tocar numa nota, deixá-la mais
   *descobrível* (título melhor, negrito, realce, resumo). Menos é mais.
4. **Nunca excluir — só somar ou melhorar.** Concluído/morto vai pra Arquivo,
   nunca pro lixo. (REGRA DE OURO do vault.)
5. **Voz anti-hype.** Calibrar títulos e resumos na voz do Matheus: direto,
   técnico, "tu/bah/mano", numbers-first, zero coachismo. Ver `CLAUDE.md`.
6. **Separar captura de organização.** Capturar é instantâneo e sem decisão.
   Organizar/destilar é outro momento (ex.: Revisão Semanal). Não misturar.

## Detecção de modo

Olhe o que o Matheus pediu e rode só a(s) etapa(s) certa(s):

- Trouxe um trecho/ideia/link pra guardar, ou disse "captura/guarda isso" → **CAPTURAR**.
- Disse "organiza o inbox", "processa minhas notas", "revisão semanal" → **ORGANIZAR** (+ destilar/expressar em lote).
- Apontou uma nota específica pra refinar ("destila essa", "resume isso") → **DESTILAR**.
- Vai montar algo ("rascunho de X", "junta o que tenho sobre Y") → **EXPRESSAR**.

Quando em dúvida, **capturar é o default seguro** (vai pro `0-Inbox/`, não move nada).

---

## C — CAPTURAR (guarde o que repercute)

Objetivo: fricção zero. Salvar o trecho que repercutiu e seguir a vida.

1. **Pegue só a essência**, não o todo. Regra prática: ≤10% da fonte. Não salvar
   capítulo/artigo inteiro — só os trechos que repercutem. Linkar a fonte original.
2. **Classifique o gatilho** (um dos 4 critérios, o que mais pesou):
   `inspira` · `util` · `pessoal` · `surpreende`.
3. **Tipo de captura:** highlight · citacao · insight · devaneio · memoria ·
   reflexao · historia · ideia · aprendizado.
4. **Salve em `0-Inbox/`** como `0-Inbox/AAAA-MM-DD-slug-curto.md` (kebab-case),
   com frontmatter mínimo. NÃO organizar agora, NÃO mover pra PARA.

Template:

    ---
    tipo: nota
    code-stage: capturado
    captura: insight        # inspira | util | pessoal | surpreende
    formato: highlight      # citacao | devaneio | ideia | ...
    origem: <link ou fonte, se houver>
    criado: AAAA-MM-DD
    tags: []
    ---

    # <Título descobrível, na voz do Matheus>

    <o trecho / a ideia, cru>

    ---
    *Conexões:* [[0-Inbox/_MOC|Inbox]] · [[Home]]

Depois de salvar, **uma linha** de confirmação. Não tente organizar nem destilar
a menos que ele peça.

---

## O — ORGANIZAR (guarde para ter acionabilidade · PARA)

Roda no inbox em lote (Revisão Semanal) ou numa nota específica.
**O Matheus pediu pastas PARA dedicadas, mas só agir sob comando dele.**

### PARA (as pastas já existem — ver [[_Sistema/MAPA|MAPA]])

    1-Projetos/    no que ele trabalha AGORA (tem fim + resultado definido)
    2-Areas/       responsabilidades contínuas, sem data final (padrão a manter)
    3-Recursos/    temas/referências que pode querer no futuro
    4-Arquivo/     concluído/inativo das três acima — nunca deletado

> Cada pasta tem um `_MOC.md` (hub navegável). Ao rotear uma nota, atualizar
> também o `_MOC.md` da área de destino.

### Roteamento (cascata de acionabilidade)

Para cada nota, descer a lista e parar no primeiro "sim":

1. É útil pra algum **projeto** ativo? → `1-Projetos/<projeto>/`
2. Senão, pertence a alguma **área** de responsabilidade? → `2-Areas/<area>/`
3. Senão, é um **recurso** (tema de interesse/referência)? → `3-Recursos/<tema>/`
4. Senão → `4-Arquivo/`

Objetivo: pôr a nota onde ela vai aparecer **o quanto antes** que for útil.
Atualizar `code-stage: organizado` e adicionar `para: projeto|area|recurso|arquivo`
no frontmatter. Mover (nunca duplicar sem motivo). Atualizar o `_index.md` da pasta.

---

## D — DESTILAR (encontre a essência · Sumarização Progressiva)

Só destilar quando for **usar** a nota (ou na revisão) — não destilar tudo de cara.
Quatro camadas, cada uma ≤10-20% da anterior:

- **Camada 1** — trechos crus capturados (já existem).
- **Camada 2** — `**negrito**` nos pontos principais.
- **Camada 3** — `==realce==` (Obsidian) nas 1-2 frases que resumem a fonte.
- **Camada 4** — `## Resumo executivo` em tópicos, nas palavras dele — **só**
  quando a nota for revisitada várias vezes (sinal de que é central).

Regras:
- Confiar na intuição pra destacar; não analisar demais.
- Não exagerar nos destaques (erro nº1 dos novatos).
- Teste: bater o olho em 30s e entender a essência. Se não, ajustar as camadas.
- Atualizar `code-stage: destilado` + melhorar o título.

---

## E — EXPRESSAR (compartilhe / monte · Pacotes Intermediários)

Transformar notas em output e conectá-las à base.

1. **Linkar:** adicionar `[[wikilinks]]` pra toda entidade/conceito/nota
   relacionada que já tenha página (em `_Sistema/Wiki-LLM/wiki/entities/`, `_Sistema/Wiki-LLM/wiki/concepts/`,
   nas áreas PARA, ou outra nota). Conectar é o que dá valor.
2. **Pacotes Intermediários (PIs):** identificar blocos reutilizáveis (um
   resumo, um argumento, um template, um diagrama, um trecho de roteiro).
   Marcar `pi: true` no frontmatter pra reaproveitar depois.
3. **Montar output** quando ele pedir, com as técnicas de execução:
   - **Arquipélago de Ideias** — começar o rascunho colando as notas/citações
     relevantes (as "ilhas"), depois sequenciar. Nunca página em branco.
   - **Ponte de Hemingway** — ao parar, anotar próximos passos / status atual
     pra retomar sem atrito.
   - **Redução de Escopo** — cortar o não-essencial pro Arquivo (não pro lixo)
     e entregar a menor versão útil pra receber feedback.
4. Atualizar `code-stage: expresso`, o `_MOC.md` da área e o `log.md`.

---

## Hábitos (manutenção)

- **Revisão Semanal:** esvaziar `0-Inbox/` → titular, classificar PARA, mover.
  Rápido, em lote, sem destilar fundo. Mirar inbox no zero.
- **Hábitos de Percepção:** ao passar por uma nota, deixá-la melhor do que
  achou (título, link, mover pra pasta mais útil) — pequenos ajustes no fluxo.

## Frontmatter — campos CODE (somam ao padrão do vault)

    code-stage: capturado | organizado | destilado | expresso
    captura:    inspira | util | pessoal | surpreende
    para:       projeto | area | recurso | arquivo
    pi:         true        # se for Pacote Intermediário reutilizável

## Convenções

- Arquivo em **kebab-case**, título interno em **Title Case**.
- `[[wikilinks]]` sempre pelo **título**, nunca pelo caminho.
- Toda página com frontmatter padrão (ver `CLAUDE.md`).
- **Nunca deletar.** Concluído/morto → `4-Arquivo/`.
- Mover nota = `git mv` quando der (preserva histórico). Migração em massa só sob comando do Matheus.
- Calibrar título/resumo na **voz anti-hype** dele.
- Append no `log.md` mestre a cada operação que mexe na estrutura:
  `## [AAAA-MM-DD] code | <título>`.

## O que vem depois

- Capturou → na Revisão Semanal, **organizar** o inbox.
- Organizou → quando for usar, **destilar** e **expressar** (linkar + montar).
- Fonte bruta nova (artigo, transcrição, repo)? Não é aqui — usar
  `/second-brain-ingest`.
- Pergunta contra a base? `/second-brain-query`.
