module BBigStep where
import Memory
import EBigStep
data B = TRUE
  | FALSE
  | Not B
  | And B B
  | Or  B B
  | Leq E E    -- menor ou igual
  | Igual E E  -- verifica se duas expressões aritméticas são iguais
   deriving(Eq,Show)

bbigStep :: (B,Memoria) -> Bool
bbigStep (TRUE,s)  = True
bbigStep (FALSE,s) = False
bbigStep (Not b,s) 
  | bbigStep (b,s) == True     = False
  | otherwise                  = True 
bbigStep (And b1 b2,s) = bbigStep (b1,s) == True && bbigStep (b2,s) == True
bbigStep (Or b1 b2,s ) = bbigStep (b1,s) == True || bbigStep (b2,s) == True 
bbigStep (Leq e1 e2,s) = ebigStep(e1,s) <= ebigStep(e2,s)
bbigStep (Igual e1 e2,s) = ebigStep(e1,s) == ebigStep(e2,s) 
