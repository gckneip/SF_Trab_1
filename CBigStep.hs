module CBigStep where
import BBigStep
import EBigStep
import Memory

data C = While B C
    | If B C C
    | Seq C C
    | Atrib E E
    | Skip
    | TenTimes C   ---- Executa o comando C 10 vezes
    | Repeat C B --- Repeat C until B: executa C enquanto B é falso
    | Loop E E C      ---- Loop e1 e2 c: executa (e2 - e1) vezes o comando C 
    | DuplaATrib E E E E -- recebe 2 variáveis e 2 expressões (DuplaATrib (Var v1) (Var v2) e1 e2) e faz v1:=e1 e v2:=e2
    | AtribCond B E E E --- AtribCond b (Var v1) e1 e2: se b for verdade, então faz v1:e1, se B for falso faz v1:=e2
    | Swap E E -- swap(x,y): troca o conteúdo das variáveis x e y 
   deriving(Eq,Show)   
   
cbigStep :: (C,Memoria) -> (C,Memoria)

cbigStep (Skip,s) = (Skip,s)

cbigStep (If b c1 c2,s)
  | bbigStep (b,s) = cbigStep (c1,s)
  | otherwise      = cbigStep (c2,s)

cbigStep (Seq c1 c2,s) = cbigStep (c2,s')
  where (_, s') = cbigStep (c1,s)

cbigStep (Atrib (Var x) e,s) = (Skip, (mudaVar s x (ebigStep (e,s))  ))  
--     While B C
 -- TenTimes C   ---- Executa o comando C 10 vezes
 -- Repeat C B --- Repeat C until B: executa C enquanto B é falso
 -- Loop E E C      ---- Loop e1 e2 c: executa (e2 - e1) vezes o comando C 
 -- DuplaATrib E E E E -- recebe 2 variáveis e 2 expressões (DuplaATrib (Var v1) (Var v2) e1 e2) e faz v1:=e1 e v2:=e2
 --AtribCond B E E E --- AtribCond b (Var v1) e1 e2: se b for verdade, então faz v1:e1, se B for falso faz v1:=e2
-- Swap E E -- swap(x,y): troca o conteúdo das variáveis x e y 
