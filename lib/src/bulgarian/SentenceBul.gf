--# -coding=cp1251
concrete SentenceBul of Sentence = CatBul ** open Prelude, ResBul in {
  flags coding=cp1251 ;


  flags optimize=all_subs ;

  lin
    PredVP np vp = mkClause (np.s ! (case vp.vtype of {
                                       VNormal    => RSubj ;
                                       VMedial  _ => RSubj ;
                                       VPhrasal c => RObj c})) np.a np.p vp ;

    PredSCVP sc vp = mkClause sc.s {gn=GSg Masc; p=P3} Pos vp ;

    ImpVP vp = {
      s = \\p,gn => 
        let agr    = {gn = gn ; p = P2} ;
            verb   = vp.s ! Perf ! VImperative (numGenNum gn) ;
            compl  = vp.compl ! agr ;
            clitic = case vp.vtype of {
	               VNormal    => [] ;
	               VMedial c  => reflClitics ! c ;
	               VPhrasal c => personalClitics ! c ! agr.gn ! agr.p
	             } ;
        in case p of {Pos => vp.ad.s ++ verb ++ clitic ;
                      Neg => "��" ++ vp.ad.s ++ clitic ++ verb} ++ compl ;
    } ;

    SlashVP np slash =  {
      s = \\agr => (mkClause (np.s ! RSubj) np.a np.p {s      = slash.s ;
                                                       ad     = slash.ad ;
                                                       compl  = \\_ => slash.compl1 ! np.a ++ slash.compl2 ! agr ;
                                                       vtype  = slash.vtype ;
                                                       p      = Pos}).s ;
      c2 = slash.c2
    } ;

    AdvSlash slash adv = {
      s  = \\agr,t,a,b,o => slash.s ! agr ! t ! a ! b ! o ++ adv.s ;
      c2 = slash.c2
    } ;

    SlashPrep cl prep = {s = \\_ => cl.s; c2 = prep} ;
    
    SlashVS np vs slash = {
      s = \\agr => (mkClause (np.s ! RSubj) np.a np.p
                             (insertObj (\\_ => "��" ++ slash.s ! agr) Pos (predV vs))).s ;
      c2 = slash.c2
    } ;

    EmbedS  s  = {s = comma ++ "��" ++ s.s} ;
    EmbedQS qs = {s = qs.s ! QIndir} ;
    EmbedVP vp = {s = daComplex Simul Pos vp ! Perf ! {gn=GSg Masc; p=P1}} ;

    UseCl t p cl = {
      s = t.s ++ p.s ++ cl.s ! t.t ! t.a ! p.p ! Main
    } ;
    UseQCl t p cl = {
      s = \\q => t.s ++ p.s ++ cl.s ! t.t ! t.a ! p.p ! q
    } ;
    UseRCl t p cl = {
      s    = \\agr => t.s ++ p.s ++ cl.s ! t.t ! t.a ! p.p ! agr ;
      role = cl.role
    } ;
    UseSlash t p cl = {
      s = \\agr => t.s ++ p.s ++ cl.s ! agr ! t.t ! t.a ! p.p ! Main ;
      c2 = cl.c2
    } ;

    ExtAdvS a s = {s = a.s ++ comma ++ s.s} ;
    AdvS a s = {s = a.s ++ s.s} ;

    SSubjS a s b = {s = a.s ++ comma ++ s.s ++ b.s} ;

    RelS s r = {s = s.s ++ comma ++ r.s ! {gn=gennum ANeut Sg; p=P3}} ;
}
