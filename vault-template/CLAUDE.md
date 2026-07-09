# CLAUDE.md — Segundo Cérebro (template)

> Regras de operação deste vault. O Claude lê isto no início de cada sessão.
> Este é um template limpo do sistema do Matheus Dickel — você preenche com a SUA vida.

## Quem sou (preencha)
- Nome / marca:
- O que faço:
- Como quero ser atendido: (direto? técnico? informal? sem hype?)

## Framework central — CODE + PARA

O cérebro roda no método **CODE** (Tiago Forte): **C**apturar · **O**rganizar · **D**estilar · **E**xpressar. Operado pela skill `/code`.

- **Capturar** — guarda só o que *repercute* (≤10% da fonte). Cai sempre no `0-Inbox/` primeiro.
- **Organizar (PARA)** — roteia por *acionabilidade*, não por assunto:
  - `1-Projetos/` — trabalho com fim + resultado (tem prazo)
  - `2-Areas/` — responsabilidade contínua (sem fim)
  - `3-Recursos/` — referência futura (livros, frameworks, estudo)
  - `4-Arquivo/` — concluído/inativo (nunca deletado, só movido)
  - `0-Inbox/` — captura sem decisão
- **Destilar** — Sumarização Progressiva: trecho cru → **negrito** → ==realce== → resumo. Só destila quando for usar.
- **Expressar** — linka com `[[wikilinks]]` e monta o output.

## Sistema LLM-Wiki
- `_Sistema/Wiki-LLM/raw/` — fontes brutas **imutáveis** (a IA lê, nunca edita nem deleta).
- `_Sistema/Wiki-LLM/wiki/` — workspace da IA (páginas geradas e interligadas).
- **Regra de ouro: nunca excluir. Só melhorar ou adicionar.** Concluído vai pra `4-Arquivo/`.

## Skills disponíveis (do pacote)
- `/vault-setup` — configura este vault do zero
- `/code` — capturar/organizar/destilar notas pessoais
- `/second-brain` · `/second-brain-ingest` · `/second-brain-query` — criar base, ingerir fontes, perguntar
- `/transcribe` — vídeo/áudio → texto (local)
- `/hook` — ganchos de conteúdo
- `/avoid-ai-writing` — tirar cara de IA
- `/gerar-site` — landing/site vendável
- `/nanobanana` — imagem/slide
- `/gerador-de-clipes-mentoria` — call longa → reels

## Frontmatter padrão (toda página)
```yaml
---
tipo: <area-ou-tipo>
area: <pasta>
tags: [tag1, tag2]
atualizado: AAAA-MM-DD
---
```
