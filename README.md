# Trabalho 1 — Semântica Formal (Compiladores)

**Autor:** Gustavo Cunha Kneip  
**Disciplina:** Compilers — UFPel  
**Linguagem:** Haskell  

Implementação de semântica operacional de passo largo (big-step operational semantics) para uma pequena linguagem imperativa.

## Estrutura do Projeto

```
├── Memory.hs     — Tipo Memoria e operações de lookup/update
├── EBigStep.hs   — Expressões aritméticas (E) e avaliação big-step
├── BBigStep.hs   — Expressões booleanas (B) e avaliação big-step
├── CBigStep.hs   — Comandos (C) e avaliação big-step
├── Testes.hs     — Bateria de testes para todos os módulos
├── Main.hs       — Ponto de entrada e programas exemplo
├── definicao.hs  — Versão monolítica original (mantida como referência)
├── sobs.pdf      — Enunciado do trabalho
└── README.md     — Este arquivo
```

## Descrição dos Arquivos

### Memory.hs
- **`type Memoria = [(String, Int)]`** — memória representada como lista de pares (variável, valor)
- **`exSigma :: Memoria`** — memória de exemplo: `x=10, temp=0, y=0`
- **`procuraVar :: Memoria -> String -> Int`** — busca o valor de uma variável na memória
- **`mudaVar :: Memoria -> String -> Int -> Memoria`** — retorna nova memória com o valor da variável atualizado

### EBigStep.hs
- **`data E`** — árvore sintática de expressões aritméticas: `Num`, `Var`, `Soma`, `Sub`, `Mult`, `Div`
- **`ebigStep :: (E, Memoria) -> Int`** — avalia uma expressão aritmética no estado atual

### BBigStep.hs
- **`data B`** — árvore sintática de expressões booleanas: `TRUE`, `FALSE`, `Not`, `And`, `Or`, `Leq`, `Igual`
- **`bbigStep :: (B, Memoria) -> Bool`** — avalia uma expressão booleana no estado atual

### CBigStep.hs
- **`data C`** — árvore sintática de comandos:
  - `Skip` — comando vazio
  - `Atrib E E` — atribuição (`x := e`)
  - `Seq C C` — sequência (`c1; c2`)
  - `If B C C` — condicional (`if b then c1 else c2`)
  - `While B C` — repetição enquanto condição verdadeira
  - `TenTimes C` — executa o comando 10 vezes
  - `Repeat C B` — executa até condição ser verdadeira
  - `Loop E E C` — executa (e2 - e1) vezes
  - `DuplaATrib E E E E` — atribuição simultânea de duas variáveis
  - `AtribCond B E E E` — atribuição condicional (`if b then e1 else e2`)
  - `Swap E E` — troca o conteúdo de duas variáveis
- **`cbigStep :: (C, Memoria) -> (C, Memoria)`** — avalia um comando no estado atual, devolvendo comando final (`Skip`) e memória resultante

### Testes.hs
- Testes para cada função dos módulos `Memory`, `EBigStep`, `BBigStep` e `CBigStep`
- Função `todos :: IO ()` executa a bateria completa

### Main.hs
- Ponto de entrada do programa
- Programas exemplo: `teste1`, `teste2`, `testec1`, `fatorial`, `exLoop`, `exDuplaATrib`, `exRepeat`, `exSwap`, `exAtribCond`

## Como Rodar

Com `ghci`:

```bash
ghci Main.hs
```

Para executar todos os testes:

```bash
ghci -e ':l Testes' -e 'todos'
```

Com `runghc`:

```bash
runghc Main.hs
```
