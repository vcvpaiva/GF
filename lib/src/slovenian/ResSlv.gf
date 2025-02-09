resource ResSlv = open ParamX in {

param
  Case = Nom | Gen | Dat | Acc | Loc | Instr;
  Number = Sg | Dl | Pl ;
  Gender = Masc | Fem | Neut ;
  Person = P1 | P2 | P3 ;
  Species = Indef | Def ;
  
  VForm = VInf
        | VSup
        | VPastPart Gender Number
        | VPres Number Person
        | VImper1Sg
        | VImper1Dl
        | VImper2 Number ;

  AForm = APosit  Gender Number Case
        | ACompar Gender Number Case
        | ASuperl Gender Number Case
        | APositDefNom
        | APositIndefAcc
        | APositDefAcc
        | AComparDefAcc
        | ASuperlDefAcc ;

oper
  Agr = {g : Gender; n : Number; p : Person} ;

  VP = {s : Tense => Agr => Str} ;
  
  predV : (VForm => Str) -> VP =
    \v -> { s = table {
                  Pres => \\a => v ! VPres a.n a.p ;
                  Past => \\a => "biti" ++ v ! VPastPart a.g a.n ;
                  Fut  => \\a => "biti" ++ v ! VPastPart a.g a.n ;
                  Cond => \\a => "bi" ++ v ! VPastPart a.g a.n
                }
          } ;

}
