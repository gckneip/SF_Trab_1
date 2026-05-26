module EBigStep where
import Memory
-- Árvore sintática
data E = Num Int
      |Var String
      |Soma E E
      |Sub E E
      |Mult E E
      |Div E E
   deriving(Eq,Show)

-- Definição de funções E Big Step
ebigStep :: (E,Memoria) -> Int
ebigStep (Var x,s) = procuraVar s x
ebigStep (Num n,s) = n
ebigStep (Soma e1 e2,s)  = ebigStep (e1,s) + ebigStep (e2,s)
ebigStep (Sub e1 e2,s)  = ebigStep(e1,s) - ebigStep(e2,s)
ebigStep (Mult e1 e2,s)  = ebigStep(e1,s) * ebigStep(e2,s)
ebigStep(Div e1 e2,s) = div (ebigStep(e1,s)) (ebigStep(e2,s))