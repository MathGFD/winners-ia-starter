---
name: gerar-site
description: Gera sites e landing pages vendáveis de alta conversão em UM arquivo HTML self-contained (CSS+JS inline, zero dependência), com design premium anti-cara-de-IA. Use quando alguém disser "gera um site", "monta uma landing", "cria uma página de vendas", "/gerar-site", ou colar um briefing de negócio querendo virar site. Suporta landing única, multi-seção e site de várias páginas. Calibrado pra não sair com cara de template genérico (dark, uma cor de destaque, tipografia forte, muito respiro).
---

# /gerar-site — Fábrica de sites vendáveis

Gera sites de alta conversão prontos pra abrir no navegador. Um arquivo HTML, sem build, sem dependência externa. O foco é **converter** e **não parecer feito por IA**.

## Quando usar
- "gera um site / landing / página de vendas pra [negócio]"
- Briefing de cliente → site pronto
- Precisa de uma peça vendável na hora (agência, freela, oferta própria)

## Modos
1. **landing** (padrão) — uma página de conversão completa
2. **multipage** — site institucional (home, sobre, serviços, contato) em arquivos separados
3. **from-url** — usa uma referência (`/gerar-site inspirado em [url]`) e recria melhor

## Fluxo
1. Se faltar o essencial (o que vende, pra quem, transformação principal), pergunta **só isso** — nada mais.
2. Gera o HTML seguindo o MOTOR abaixo.
3. Salva em `sites/[slug]/index.html` e avisa o caminho. Se pedirem, abre no navegador (`open`).
4. Não explica o código antes/depois — entrega a peça.

## MOTOR (o prompt-base — sempre aplicar)

> Você é designer e copywriter sênior. Crie uma landing page COMPLETA de alta conversão, em UM ÚNICO arquivo HTML (CSS e JS inline, zero dependência externa, self-contained).
>
> **ESTRUTURA** (nessa ordem): 1) Hero — headline na transformação (não no produto) + subheadline + 1 CTA forte. 2) Problema — 3 dores reais no jeito que o público fala. 3) Solução — em 3 passos simples. 4) Prova — 3 depoimentos realistas + números de resultado. 5) Oferta — bullets de benefício (não de recurso). 6) FAQ — 4 objeções quebradas. 7) CTA final.
>
> **DESIGN** (evite template genérico): dark, fundo quase preto `#0a0a0a`, texto claro, UMA cor de destaque só (`#10b981`) pra CTA e ênfase. Tipografia system-ui/Inter, títulos pesados 48px+ no hero, corpo linha 1.6. MUITO respiro (padding 80px+). SEM gradiente roxo, SEM emoji decorativo, SEM sombra exagerada. Responsivo mobile-first (flexbox/grid), imagens max-width 100%. Micro-interação sutil (hover, scroll suave).
>
> **COPY**: PT-BR direto, anti-hype (proibido "liberdade financeira", "mude sua vida"). Fala por "você", frases curtas, verbo no presente. Cada seção com um objetivo só.
>
> Entregue o HTML completo, pronto pra abrir. Só o código.

## Regras de qualidade (checar antes de entregar)
- Passa no cheiro anti-IA: sem gradiente roxo, sem "revolucione/transforme sua jornada", sem 5 cores.
- CTA repetido pelo menos 2x, sempre com a mesma cor de destaque.
- Mobile não quebra: testar mentalmente 375px de largura.
- Rodar `/avoid-ai-writing` na copy se soar robótico.

## Variáveis de marca (trocar quando não for a paleta padrão)
- Fundo: `#0a0a0a` · Texto: `#f8fafc` · Destaque: `#10b981` (verde) — troca 1 hex e o site inteiro muda.
- Se a pessoa tiver uma cor de marca, pergunta e usa ela como destaque único.
