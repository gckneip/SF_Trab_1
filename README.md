# Trabalho 1 — Semântica Formal (Compiladores)

**Autor:** Gustavo Cunha Kneip  
**Disciplina:** Compilers — UFPel  
**Linguagem:** Haskell  

Implementação de semântica operacional de passo largo (big-step operational semantics) para uma pequena linguagem imperativa.

## Estrutura do Projeto

```
├── Memory.hs     — Tipo Memoria (lista de associação) e funções de lookup/update
├── EBigStep.hs   — Expressões aritméticas (E) e sua avaliação big-step
├── BBigStep.hs   — Expressões booleanas (B) e sua avaliação big-step
├── CBigStep.hs   — Comandos (C) e sua avaliação big-step (parcial)
├── definicao.hs  — Versão monolítica original (parcial, mantida como referência)
├── Main.hs       — Ponto de entrada (apenas placeholder)
└── sobs.pdf      — Enunciado do trabalho
```

## Implementado

- [x] Tipo `Memoria` e operações (`procuraVar`, `mudaVar`)
- [x] Expressões aritméticas: `Num`, `Var`, `Soma`, `Sub`, `Mult`, `Div`
- [x] Expressões booleanas: `TRUE`, `FALSE`, `Not`, `And`, `Or`, `Leq`, `Igual`
- [x] Comandos: `Skip`

## Não Implementado (a fazer)

### 1. Comandos básicos em `CBigStep.hs`

- [ ] **`Atrib`** — `x := e` — avaliar expressão e atualizar memória
- [ ] **`Seq`** — `c1; c2` — executar c1, depois c2
- [ ] **`If`** — `if b then c1 else c2` — avaliar condição e executar branch correspondente
- [ ] **`While`** — `while b do c` — repetir enquanto condição for verdadeira

### 2. Comandos adicionais em `CBigStep.hs`

- [ ] **`TenTimes`** — executar comando 10 vezes
- [ ] **`Repeat`** — `repeat c until b` — executar c, depois testar b; repetir se falso
- [ ] **`Loop`** — `loop e1 to e2 do c` — executar c (e2 - e1) vezes
- [ ] **`DuplaATrib`** — `v1, v2 := e1, e2` — atribuir duas variáveis simultaneamente
- [ ] **`AtribCond`** — `v := if b then e1 else e2` — atribuição condicional
- [ ] **`Swap`** — `swap x y` — trocar valores de duas variáveis

### 3. Exemplos de programas em `Main.hs`

- [ ] Criar programas de teste para `Loop`, `DuplaATrib`, `Repeat`, `Swap`, `AtribCond`
- [ ] Descomentar e rodar os exemplos existentes

## Como Rodar

Com `ghci`:

```bash
ghci Main.hs
```

Ou com `runghc`:

```bash
runghc Main.hs
```
