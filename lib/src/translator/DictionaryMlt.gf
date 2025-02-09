--# -path=.:../maltese

-- Maltese translation dictionary
-- started by Aarne Ranta 2015
-- based on Maltese resource grammar by John J. Camilleri 2011 -- 2013
-- Licensed under LGPL

concrete DictionaryMlt of Dictionary = CatMlt ** open
  MorphoMlt,
  ResMlt,
  ParadigmsMlt,
  IrregMlt,
  DictMlt,
  (C = ConstructX),
  Prelude

in {

  flags
    coding=utf8 ;

  oper
    fuqP = mkPrep "fuq" ;
    ghandP = mkPrep "għand" ;
    ghalP = mkPrep "għal" ;
    minnP = mkPrep "minn" ;
    goP = mkPrep "ġo" ;
    lilP = mkPrep "lil" ;
    maP = mkPrep "ma'" ;
    taP = mkPrep "ta'" ;
    saP = mkPrep "sa" ;
    biP = mkPrep "bi" ;
    fiP = mkPrep "fi" ;

    lilV2 : V -> V2 ;
    lilV2 v = prepV2 v (mkPrep "lil") ;

    genderedN : N = overload {
      genderedN : Str -> Str -> N = \qattus,qtates ->
        let
          m : N = mkN qattus qtates masculine ;
          f : N = mkN (qattus+"a") qtates feminine ;
        in (m | f) ;
      genderedN : Str -> Str -> Str -> N = \qattus,qattusa,qtates ->
        let
          m : N = mkN qattus qtates masculine ;
          f : N = mkN qattusa qtates feminine ;
        in (m | f) ;
      } ;

    af_V = irregularV form1 (ResMlt.mkRoot "'-'-f") (ResMlt.mkVowels "a" [])
      "kont naf" "kont taf" "kien jaf" "kienet taf" "konna nafu" "kontu tafu" "kienu jafu" --- will fail for negative
      "naf" "taf" "jaf" "taf" "nafu" "tafu" "jafu"
      "kun af" "kunu afu"
      ;
    sata'_V = mkV "sata'" (ResMlt.mkRoot "s-t-għ") ;
    ried_V = mkV "ried" (ResMlt.mkRoot "r-j-d") ;
    kellu_V = irregularV form1 (ResMlt.mkRoot) (ResMlt.mkVowels)
      "kelli" "kellek" "kellu" "kellha" "kellna" "kellkom" "kellhom"
      "għandi" "għandek" "għandu" "għandha" "għandna" "għandkom" "għandhom"
      "kollok" "kollkom"
      ;


lin above_Prep = mkPrep "fuq" ;
lin add_V3 = mkV3 zied_ZJD_1_10424_V maP ;
lin after_Prep = mkPrep "wara" ;
lin airplane_N = mkN "ajruplan" "ajruplani" ;
lin alas_Interj = ss "sfortunatament" ;
lin all_Predet = ss "kollha" ;
lin almost_AdA = mkAdA "kważi" ;
lin almost_AdN = mkAdN "kważi" ;
lin already_Adv = mkAdv "diġà" ;
lin although_Subj = ss "avolja" ;
lin always_AdV = mkAdV "dejjem" ;
lin and_Conj = mkConj "u" ;
lin animal_N = mkN "annimal" "annimali" ;
lin answer_V2S = lilV2 (wiegeb_WGB_3_10033_V) ;
lin apartment_N = mkN "appartament" "appartamenti" ;
lin apple_N = mkNColl "tuffieħa" "tuffieħ" "tuffieħat" ;
lin art_N = mkNNoPlural "arti" feminine ;
lin as_CAdv = C.mkCAdv "" "daqs" ; -- "as good as gold"
lin ashes_N = mkN "rmied" "rmiet" ;
lin ask_V2Q = lilV2 (saqsa_SQSJ_1_7268_V) ;
lin at_least_AdN = mkAdN "mill-inqas" ;
lin at_most_AdN = mkAdN "l-iktar" ;
lin baby_N = mkN "tarbija" "trabi" ;
lin back_N = possN (mkN "dahar" "dhur") ;
lin bad_A = brokenA "ħażin" "hżiena" "agħar" ;
lin bank_N = mkN "bank" "bankijiet" ;
lin bark_N = mkN "qoxra" "qoxriet" ;
lin beautiful_A = brokenA "sabiħ" "sbieħ" "isbaħ" ;
lin because_Subj = ss "għax" ;
lin become_VA = sar_SJR_1_9797_V ;
lin beer_N = mkN "birra" "birer" ;
lin before_Prep = mkPrep "qabel" "qabli" "qablek" "qablu" "qabilha" "qabilna" "qabilkom" "qabilhom" ;
lin beg_V2V = mkV2V ttallab_TLB_5_9893_V ghalP minnP ;
lin behind_Prep = after_Prep ;
lin belly_N = possN (mkN "żaqq" "żquq") ;
lin between_Prep = mkPrep "bejn" ;
lin big_A = brokenA "kbir" "kbar" "ikbar" ;
lin bike_N = mkN "rota" "roti" ;
lin bird_N = mkN "għasfur" "għasafar" ; -- genderedN
lin bite_V2 = lilV2 (gidem_GDM_1_8009_V) ;
lin black_A = mkA "iswed" "sewda" "suwed" ;
lin blood_N = possN (mkNColl "demm" "dmija") ;
lin blow_V = nefah_NFH_1_8966_V ;
lin blue_A = sameA "blu" ;
lin boat_N = mkN "dgħajsa" "dgħajjes" ;
lin bone_N = mkNColl "għadma" "għadam" "għadmiet" ;
lin book_N = mkN "ktieb" "kotba" ;
lin boot_N = mkNColl "żarbuna" "żarbun" "żraben" ;
lin boss_N = mkN "mgħallem" "mgħallmin" ;
lin both7and_DConj = mkConj "kemm" "u kemm";
lin boy_N = mkN "tifel" "subien" ;
lin bread_N = mkNColl "ħobża" "ħobż" "ħobżiet" ;
lin break_V2 = dirV2 (kiser_KSR_1_8636_V) ;
lin breast_N = possN (mkN "sider" "sdur") ;
lin breathe_V = mkV "respira" ; -- ĦA N-NIFS
lin broad_A = mkA "wiesgħa" "wiesgħa" "wiesgħin" ;
lin brother_N2 = mkN2 (possN (mkN "ħu" "aħwa")) ;
lin brown_A = sameA "kannella" ;
lin burn_V = haraq_HRQ_1_8367_V ;
lin but_PConj = ss "imma" ;
lin butter_N = mkNColl "butir" "butirijiet" ;
lin buy_V2 = dirV2 (xtara_XRJ_8_10296_V) ;
lin by8agent_Prep = prep_minn ; -- mkPrep "minn" "mill-" "mit-" ;
lin by8means_Prep = mkPrep "bi" "b'" "bil-" "bit-" "bl-" ;
lin camera_N = mkN "kamera" "kameras" ;
lin can8know_VV = af_V ;
lin can_VV = sata'_V ;
lin cap_N = mkN "kappell" "kpiepel" ;
lin car_N = mkN "karozza" "karozzi" ;
lin carpet_N = mkN "tapit" "twapet" ;
lin cat_N = mkN "qattus" "qtates" ; -- genderedN
lin ceiling_N = mkN "saqaf" "soqfa" ;
lin chair_N = mkN "siġġu" "siġġijiet" ;
lin cheese_N = mkNColl "ġobna" "ġobon" "ġobniet" ;
lin child_N = mkN "tifel / tifla" "tfal" ; -- genderedN
lin church_N = mkN "knisja" "knejjes" ;
lin city_N = mkN "belt" "bliet" feminine ;
lin clean_A = brokenA "nadif" "nodfa" ;
lin clever_A = mkA "bravu" ;
lin close_V2 = dirV2 (ghalaq_GHLQ_1_10530_V) ;
lin cloud_N = mkNColl "sħaba" "sħab" "sħabiet" ;
lin coat_N = mkN "kowt" "kowtijiet" ;
lin cold_A = mkA "kiesaħ" "kiesħa" "kesħin" ;
lin come_V = gie_GJ'_1_8123_V ;
lin computer_N = mkN "kompjuter" "kompjuters" ;
lin correct_A = mkA "korrett" ;
lin count_V2 = dirV2 (ghadd_GHDD_1_10460_V) ;
lin country_N = possN (mkN "pajjiż" "pajjiżi") ;
lin cousin_N = mkN "kuġin" "kuġini" ; -- genderedN
lin cow_N = mkNColl "baqra" "baqar" "baqriet" ;
lin cut_V2 = dirV2 (qata'_QTGH_1_9305_V) ;
lin day_N = mkN "ġurnata" "ġranet" ;
lin die_V = miet_MWT_1_8923_V ;
lin dig_V = haffer_HFR_2_8236_V ;
lin dirty_A = mkA "maħmuġ" ;
lin distance_N3 = mkN3 (mkN "distanza") saP minnP ;
lin do_V2 = dirV2 (ghamel_GHML_1_10544_V) ;
lin doctor_N = mkN "tabib" "tobba" ; -- genderedN
lin dog_N = mkN "kelb" "klieb" ;
lin door_N = mkN "bieb" "bibien" ;
lin drink_V2 = dirV2 (xorob_XRB_1_10231_V) ;
lin dry_A = mkA "niexef" ;
lin dull_A = sameA "tad-dwejjaq" ;
lin during_Prep = mkPrep "waqt" ;
lin dust_N = mkNColl "traba" "trab" "trabiet" ;
lin ear_N = possN (mkNDual "widna" "widnejn" "widniet") ;
lin earth_N = mkN "art" "artijiet" feminine ;
lin easy_A2V = dirA2 (sameA "faċli") ;
lin eat_V2 = dirV2 (kiel_KJL_1_8672_V) ;
lin egg_N = mkNColl "bajda" "bajd" "bajdiet" ;
lin either7or_DConj = mkConj "jew" "inkella" ;
lin empty_A = mkA "vojt" "vojta" "vojta" ;
lin enemy_N = mkN "għadu" "għedewwa" ;
lin every_Det = mkDeterminer singular "kull" ;
lin everybody_NP = regNP "kulħadd" ;
lin everything_NP = regNP "kollox" ;
lin everywhere_Adv = mkAdv "kullimkien" ;
lin except_Prep = mkPrep "apparti" ; --- special case..
lin eye_N = possN (mkNDual "għajn" "għajnejn" "għajnejn" "għejun" feminine) ;
lin factory_N = mkN "fabbrika" "fabbriki" ;
lin fall_V = waqa'_WQGH_1_10070_V ;
lin far_Adv = mkAdv "il-bogħod" ; -- use glue?
lin fat_N = mkNColl "xaħma" "xaħam" "xaħmiet" "xaħmijiet" ;
lin father_N2 = mkN2 (possN (mkN "missier" "missirijiet")) ;
lin fear_V2 = prepV2 (beza'_BZGH_1_7541_V) minnP ;
lin fear_VS = beza'_BZGH_1_7541_V;
lin feather_N = mkNColl "rixa" "rix" "rixiet" ;
lin few_Det = mkDeterminer plural "ftit" ;
lin fight_V2 = prepV2 (ggieled_GLD_6_8074_V) maP ;
lin find_V2 = lilV2 (sab_SJB_1_9779_V) ;
lin fingernail_N = possN (mkNDual "difer" "difrejn" "dwiefer") ;
lin fire_N = mkN "nar" "nirien" ;
lin fish_N = mkNColl "ħuta" "ħut" "ħutiet" ;
lin float_V = gham_GHWM_1_10750_V ; ---
lin floor_N = mkN "art" "artijiet" feminine ;
lin flow_V = ghadda_GHDJ_2_10679_V ;
lin flower_N = mkN "fjura" "fjuri" ;
lin fly_V = tar_TJR_1_9972_V ;
lin fog_N = mkNColl "ċpar" ;
lin foot_N = possN (mkNDual "sieq" "saqajn" "saqajn" feminine) ;
lin for_Prep = mkPrep "għal" "għall-" "għall-" "għat-" "għall-" "għalija" "għalik" "għalih" "għaliha" "għalina" "għalikom" "għalihom" True ;
lin forest_N = mkN "foresta" "foresti" ;
lin forget_V2 = lilV2 (nesa_NSJ_1_9126_V) ;
lin freeze_V = ffriza_V ;
lin fridge_N = mkN "friġġ" "friġġijiet" ;
lin friend_N = possN (mkN "ħabib" "ħbieb") ; -- genderedN
lin from_Prep = mkPrep "mingħand" ;
lin fruit_N = mkNColl "frotta" "frott" "frottiet" "frottijiet" ;
lin full_A = mkA "mimli" ;
lin fun_AV = sameA "pjaċevoli" ;
lin garden_N = mkN "ġnien" "ġonna" ;
lin girl_N = mkN "tifla" "tfajliet" ;
lin give_V3 = mkV3 ta_GHTJ_1_10767_V lilP ;
lin glove_N = mkN "ingwanta" "ingwanti" ;
lin go_V = mar_MWR_1_8918_V ;
lin gold_N = mkNColl "deheb" "dehbijiet" ;
lin good_A = mkA "tajjeb" "tajba" "tajbin" ;
lin grammar_N = mkN "grammatika" "grammatiki" ;
lin grass_N = mkNColl "ħaxixa" "ħaxix" "ħxejjex" ;
lin green_A = mkA "aħdar" "ħadra" "ħodor" ;
lin guts_N = possN (mkN "musrana" "musraniet" "msaren") ;
lin hair_N = possN (mkNColl "xagħara" "xagħar" "xagħariet" "xgħur") ;
lin hand_N = possN (mkNDual "id" "idejn" "idejn" feminine) ;
lin harbour_N = mkN "port" "portijiet" ;
lin hat_N = mkN "kappell" "kpiepel" ;
lin hate_V2 = lilV2 (baghad_BGHD_1_7402_V) ;
lin have_V2 = dirV2 (kellu_V) ;
lin he_Pron = mkPron "hu" "u" singular P3 masculine ; --- also HUWA
lin head_N = possN (mkN "ras" "rjus" feminine) ;
lin hear_V2 = lilV2 (sema'_SMGH_1_9698_V) ;
lin heart_N = possN (mkN "qalb" "qlub" feminine) ;
lin heavy_A = brokenA "tqil" "tqal" "itqal" ;
lin here7from_Adv = mkAdv ["minn hawn"] ;
lin here7to_Adv = mkAdv ["s'hawn"] ;
lin here_Adv = mkAdv "hawn" ;
lin hill_N = mkN "għolja" "għoljiet" ;
lin hit_V2 = lilV2 (laqat_LQT_1_8772_V) ;
lin hold_V2 = lilV2 (zamm_ZMM_1_10392_V) ;
lin hope_VS = xtaq_XWQ_8_10313_V ;
lin horn_N = mkN "ħorn" "ħornijiet" ;
lin horse_N = mkN "żiemel" "żwiemel" ;
lin hot_A = mkA "jaħraq" "taħraq" "jaħarqu" ;
lin house_N = mkN "dar" "djar" feminine ;
lin how8many_IDet = {s = "kemm" ; n = plural} ;
lin how8much_IAdv = ss "kemm" ;
lin how_IAdv = ss "kif" ;
lin hunt_V2 = prepV2 (kaccac_KCC_2_8571_V) ghalP ;
lin husband_N = mkN "raġel" "rġiel" ;
lin i_Pron = mkPron "jien" "i" singular P1 masculine ; --- also JIENA
lin ice_N = mkN "silġ" "silġiet" ;
lin if_Subj = ss "jekk" ;
lin if_then_Conj = mkConj "jekk" ;
lin important_A = sameA "importanti" ;
lin in8front_Prep = mkPrep "quddiem" ;
lin in_Prep = mkPrep "fi" "f'" "fil-" "fit-" "fl-" ;
lin industry_N = mkN "industrija" "industriji" ;
lin iron_N = mkNColl "ħadida" "ħadid" "ħadidiet" "ħdejjed" ;
lin it_Pron = he_Pron ;
lin john_PN = mkPN "Ġanni" masculine singular ;
lin jump_V = qabez_QBZ_1_9182_V ;
lin kill_V2 = lilV2 (qatel_QTL_1_9312_V) ;
lin king_N = mkN "re" "rejjiet" ;
lin knee_N = possN (mkNDual "rkoppa" "rkopptejn" "rkoppiet") ;
lin know_V2 = lilV2 (af_''F_1_10774_V) ;
lin know_VQ = af_''F_1_10774_V ;
lin know_VS = af_''F_1_10774_V ;
lin lake_N = mkN "għadira" "għadajjar" ;
lin lamp_N = mkN "lampa" "lampi" ;
lin language_N = mkN "lingwa" "lingwi" ;
lin language_title_Utt = ss "Malti" ;
lin laugh_V = dahak_DHK_1_7688_V ;
lin leaf_N = mkNDual "werqa" "werqtejn" "werqiet" ;
lin learn_V2 = dirV2 (tghallem_GHLM_5_10527_V) ;
lin leather_N = mkN "ġilda" "ġildiet" ;
lin leave_V2 = prepV2 (telaq_TLQ_1_9903_V) minnP ;
lin left_Ord = mkOrd "xellug" ;
lin leg_N = (mkNDual "riġel" "riġlejn" "riġlejn") ;
lin less_CAdv = C.mkCAdv "inqas" "minn" ; --- inqas mill-ieħor
lin lie_V = mtedd_MDD_8_8816_V ; -- lie down
lin like_V2 = lilV2 (ghogob_GHGB_1_10485_V) ;
lin listen_V2 = lilV2 (sema'_SMGH_1_9698_V) ;
lin live_V = ghex_GHJX_1_10711_V ;
lin liver_N = mkN "fwied" "ifdwa" ;
lin long_A = brokenA "twil" "twal" "itwal" ;
lin lose_V2 = lilV2 (tilef_TLF_1_9895_V) ;
lin louse_N = mkN "qamla" "qamliet" ;
lin love_N = mkN "mħabba" "mħabbiet" ;
lin love_V2 = lilV2 (habb_HBB_1_8174_V) ;
lin man_N = mkN "raġel" "rġiel" ;
lin many_Det = mkDeterminer plural "ħafna" ;
lin married_A2 = mkA2 (mkA "miżżewweġ" "miżżewġa") lilP ;
lin meat_N = mkNColl "laħma" "laħam" "laħmiet" "laħmijiet" ;
lin milk_N = mkNColl "ħalib" "ħalibijiet" ;
lin moon_N = mkN "qamar" "oqmra" ;
lin more_CAdv = C.mkCAdv "iktar" "minn" ; --- iktar mit-tnejn
lin most_Predet = ss "il-maġġoranza ta'" ; --- tal-, tan-
lin mother_N2 = mkN2 (possN (mkN "omm" "ommijiet" feminine)) ;
lin mountain_N = mkN "muntanja" "muntanji" ;
lin mouth_N = possN (mkN "ħalq" "ħluq") ;
lin much_Det = mkDeterminer singular "ħafna" ;
lin music_N = mkN "mużika" "mużiki" ;
lin must_VV = kellu_V ;
lin name_N = possN (mkN "isem" "ismijiet") ;
lin narrow_A = mkA "dejjaq" "dejqa" "dojoq" "idjaq" ;
lin near_A = mkA "viċin" ;
lin neck_N = possN (mkN "għonq" "għenuq") ;
lin new_A = brokenA "ġdid" "ġodda" ;
lin newspaper_N = mkN "gazzetta" "gazzetti" ;
lin night_N = mkN "lejl" "ljieli" ;
lin no_Quant = let l_ebda = artDef ++ "ebda" in mkQuant l_ebda l_ebda l_ebda False ;
lin no_Utt = ss "le" ;
lin nobody_NP = regNP "ħadd" ;
lin nose_N = possN (mkN "mnieħer" "mniħrijiet") ;
lin not_Predet = ss "mhux" ;
lin nothing_NP = regNP "xejn" ;
lin now_Adv = mkAdv "issa" ;
lin number_N = mkN "numru" "numrui" ;
lin oil_N = mkN "żejt" "żjut" ;
lin old_A = brokenA "qadim" "qodma" "eqdem" ; -- xiħ
lin on_Prep = mkPrep "fuq" ;
lin only_Predet = ss "biss" ;
lin open_V2 = dirV2 (fetah_FTH_1_7932_V) ;
lin or_Conj = mkConj "jew" ;
lin otherwise_PConj = ss "inkella" ;
lin paint_V2A = dirV2 (zeba'_ZBGH_1_10339_V) ; -- dirV2 (pitter_PTR_2_9152_V) ;
lin paper_N = mkN "karta" "karti" ;
lin paris_PN = mkPN "Pariġi" feminine singular ;
lin part_Prep = possess_Prep ;
lin peace_N = mkN "paċi" "paċijiet" feminine ;
lin pen_N = mkN "pinna" "pinen" ;
lin person_N = mkNColl "persuna" "persuni" ;
lin planet_N = mkN "pjaneta" "pjaneti" ;
lin plastic_N = mkNNoPlural "plastik" ;
lin play_V = daqq_DQQ_1_7736_V ;
lin play_V2 = prepV2 (laghab_LGHB_1_8724_V) maP ;
lin please_Voc = ss "jekk jgħoġbok" ; --- JEKK JGĦOĠOBKOM
lin policeman_N = mkNNoPlural "pulizija" ;
lin possess_Prep = prep_ta ; -- mkPrep "ta'" "t'" "tal-" "tat-" "tal-" ;
lin priest_N = mkN "qassis" "qassisin" ;
lin probable_AS = mkAS (sameA "probabbli") ;
lin pull_V2 = lilV2 (gibed_GBD_1_8043_V) ;
lin push_V2 = dirV2 (mbotta_V) ; -- GĦAFAS
lin put_V2 = lilV2 (qieghed_QGHD_3_9212_V) ;
lin queen_N = mkN "reġina" "rġejjen" ;
lin question_N = mkN "mistoqsija" "mistoqsijiet" ;
lin quite_Adv = mkAdv "pjuttost" ;
lin radio_N = mkN "radju" "radjijiet" ;
lin rain_N = mkNNoPlural "xita" ;
lin rain_V0 = xita_XTW_1_10297_V ; -- TAGĦMEL IX-XITA
lin read_V2 = dirV2 (qara_QRJ_1_9350_V) ;
lin ready_A = mkA "lest" ;
lin reason_N = mkN "raġun" "raġunijiet" ;
lin red_A = mkA "aħmar" "ħamra" "ħomor" ;
lin religion_N = mkN "reliġjon" "reliġjonijiet" ;
lin restaurant_N = mkN "restorant" "restoranti" ;
lin right_Ord = mkOrd "lemin" ;
lin river_N = mkN "xmara" "xmajjar" ;
lin road_N = mkN "triq" "triqat" "toroq" feminine ;
lin rock_N = mkNColl "blata" "blat" "blatiet" ;
lin roof_N = mkN "saqaf" "soqfa" ;
lin root_N = mkN "qħerq" "qħeruq" ;
lin rope_N = mkN "ħabel" "ħbula" ;
lin rotten_A = mkA "mħassar" "mħassra" "mħassrin" ;
lin round_A = mkA "tond" ;
lin rub_V2 = dirV2 (ghorok_GHRK_1_10599_V) ;
lin rubber_N = mkN "gomma" "gomom" ;
lin rule_N = mkN "regola" "regoli" ;
lin run_V = gera_GRJ_1_8131_V ;
lin salt_N = mkN "melħ" "melħiet" ;
lin sand_N = mkNColl "ramla" "ramel" "ramliet" ;
lin say_VS = qal_QWL_1_9357_V ;
lin school_N = mkN "skola" "skejjel" ;
lin science_N = mkN "xjenza" "xjenzi" ;
lin scratch_V2 = lilV2 (barax_BRX_1_7504_V) ;
lin sea_N = mkNDual "baħar" "baħrejn" "ibħra" ;
lin see_V2 = lilV2 (ra_R'J_1_9513_V) ;
lin seed_N = mkN "żerriegħa" "żerrigħat" ;
lin seek_V2 = lilV2 (fittex_FTX_2_7952_V) ;
lin sell_V3 = mkV3 biegh_BJGH_1_7565_V lilP ;
lin send_V3 = mkV3 baghat_BGHT_1_7412_V lilP ;
lin sew_V = hat_HJT_1_8508_V ;
lin sharp_A = mkA "jaqta'" "taqta'" "jaqtgħu" ;
lin she_Pron = mkPron "hi" "ha" singular P3 feminine ; --- also HIJA
lin sheep_N = mkNColl "nagħġa" "ngħaġ" "nagħġiet" ;
lin ship_N = mkN "vapur" "vapuri" ;
lin shirt_N = mkN "qmis" "qomos" feminine ;
lin shoe_N = mkN "żarbun" "żraben" ;
lin shop_N = mkN "ħanut" "ħwienet" ;
lin short_A = brokenA "qasir" "qosra" "iqsar" ;
lin silver_N = mkN "fidda" "fided" ;
lin sing_V = kanta_KNTJ_1_7016_V ;
lin sister_N = (mkN "oħt" "aħwa" feminine) ;
lin sit_V = pogga_PGJ_2_9157_V ;
lin skin_N = mkN "ġilda" "ġildiet" ;
lin sky_N = mkN "sema" "smewwiet" masculine ;
lin sleep_V = raqad_RQD_1_9469_V ;
lin small_A = brokenA "zgħir" "zgħar" "iżgħar" ;
lin smell_V = xamm_XMM_1_10207_V ;
lin smoke_N = mkN "duħħan" "dħaħen" ;
lin smooth_A = mkA "lixx" ;
lin snake_N = mkN "serp" "sriep" ;
lin snow_N = mkNColl "borra" ;
lin so_AdA = mkAdA "allura" ;
lin sock_N = mkN "kalzetta" "kalzetti" ;
lin somePl_Det = mkDeterminer plural "xi uħud" ;
lin someSg_Det = mkDeterminer singular "xi" ;
lin somebody_NP = regNP "xi ħadd" ;
lin something_NP = regNP "xi ħaġa" ;
lin somewhere_Adv = mkAdv "x'imkien" ;
lin song_N = mkN "kanzunetta" "kanzunetti" ;
lin speak_V2 = prepV2 (kellem_KLM_2_8597_V) maP ;
lin spit_V = bezaq_BZQ_1_7549_V ;
lin split_V2 = lilV2 (qasam_QSM_1_9292_V) ;
lin squeeze_V2 = dirV2 (ghasar_GHSR_1_10625_V) ;
lin stab_V2 = lilV2 (mewwes_MWS_2_8921_V) ;
lin stand_V = qaghad_QGHD_1_9210_V ;
lin star_N = mkN "stilla" "stilel" ;
lin steel_N = mkNNoPlural "azzar" ;
lin stick_N = mkN "lasta" "lasti" ;
lin stone_N = mkNColl "ġebla" "ġebel" "ġebliet" "ġbiel" ;
lin stop_V = waqaf_WQF_1_10067_V ;
lin stove_N = mkN "kuker" "kukers" ;
lin straight_A = mkA "dritt" ;
lin student_N = mkN "student" "studenti" ;
lin stupid_A = mkA "iblah" "belha" "boloh" ;
lin suck_V2 = lilV2 (rada'_RDGH_1_9388_V) ;
lin sun_N = mkN "xemx" "xmux" feminine ;
lin swell_V = ntefah_NFH_8_8970_V ;
lin swim_V = gham_GHWM_1_10750_V ;
lin switch8off_V2 = dirV2 (tefa_TFJ_1_9960_V) ;
lin switch8on_V2 = dirV2 (xeghel_XGHL_1_10155_V) ;
lin table_N = mkN "mejda" "mwejjed" ;
lin tail_N = (mkN "denb" "dnieb") ;
lin talk_V3 = mkV3 kellem_KLM_2_8597_V maP fuqP ; -- PAĊPAĊ, PARLA
lin teach_V2 = lilV2 (ghallem_GHLM_2_10526_V) ;
lin teacher_N = mkN "għalliem" "għalliema" ; -- genderedN
lin television_N = mkN "televixin" "televixins" ;
lin that_Quant = mkQuant "dak" "dik" "dawk" True ;
lin that_Subj = ss "li" ;
lin there7from_Adv = mkAdv ["minn hemm"] ;
lin there7to_Adv = mkAdv "s'hemm" ;
lin there_Adv = mkAdv "hemm" ;
lin therefore_PConj = ss "allura" ;
lin they_Pron = mkPron "huma" "hom" plural P3 masculine ;
lin thick_A = mkA "oħxon" "ħoxna" "ħoxnin" "eħxen" ;
lin thin_A = brokenA "rqiq" "rqaq" "rqaq" ;
lin think_V = haseb_HSB_1_8387_V ;
lin this_Quant = mkQuant "dan" "din" "dawn" True ;
lin through_Prep = mkPrep "minn ġo" "minn ġo" "minn ġol-" "minn ġot-" "minn ġol-" "minn ġo fija" "minn ġo fik" "minn ġo fih" "minn ġo fiha" "minn ġo fina" "minn ġo fikom" "minn ġo fihom" False ;
lin throw_V2 = dirV2 (waddab_WDB_2_10027_V) ;
lin tie_V2 = dirV2 (qafel_QFL_1_9206_V) ;
lin to_Prep = mkPrep "lil" "lill-" "lit-" ;
lin today_Adv = mkAdv "illum" ;
lin tongue_N = possN (mkN "lsien" "ilsna") ;
lin too_AdA = mkAdA "ukoll" ;
lin tooth_N = possN (mkN "sinna" "sinniet" "snien") ;
lin train_N = mkN "ferrovija" "ferroviji" ;
lin travel_V = vvjagga_V ;
lin tree_N = mkNColl "siġra" "siġar" "siġriet" ;
lin turn_V = dar_DWR_1_7803_V ;
lin ugly_A = mkA "ikrah" "kerha" "koroh" ;
lin uncertain_A = mkA "inċert" ;
lin under_Prep = mkPrep "taħt" ;
lin understand_V2 = lilV2 (fehem_FHM_1_10830_V) ;
lin university_N = mkN "università" "universitàjiet" ;
lin very_AdA = mkAdA "ħafna" ;
lin village_N = mkN "raħal" "rħula" ;
lin vomit_V = qala'_QLGH_1_9223_V ;
lin wait_V2 = lilV2 (stenna_'NJ_10_10781_V) ;
lin walk_V = mexa_MXJ_1_8926_V ;
lin want_VV = ried_V ;
lin war_N = mkN "gwerra" "gwerrer" ;
lin warm_A = brokenA "sħun" "sħan" ;
lin wash_V2 = lilV2 (hasel_HSL_1_8395_V) ;
lin watch_V2 = dirV2 (ra_R'J_1_9513_V) ;
lin water_N = mkN "ilma" "ilmijiet" masculine ;
lin we_Pron = mkPron "aħna" "na" plural P1 masculine ;
lin wet_A = mkA "mxarrab" "mxarrba" "mxarrbin" ;
lin whatPl_IP = mkIP ("x'" ++ BIND) plural ;
lin whatSg_IP = mkIP ("x'" ++ BIND) singular ;
lin when_IAdv = ss "meta" ;
lin when_Subj = ss "meta" ;
lin where_IAdv = ss "fejn" ;
lin which_IQuant = ss "liema" ;
lin white_A = mkA "abjad" "bajda" "bojod" ;
lin whoPl_IP = mkIP "min" plural ;
lin whoSg_IP = mkIP "min" singular ;
lin who_PN = mkPN "ODS" ;
lin why_IAdv = ss "għalfejn" ;
lin wide_A = broad_A ;
lin wife_N = mkN "mara" "nisa" ;
lin win_V2 = dirV2 (rebah_RBH_1_9371_V) ;
lin wind_N = mkN "riħ" "rjieħ" ;
lin window_N = mkN "tieqa" "twieqi" ;
lin wine_N = mkNColl "nbid" "nbejjed" ;
lin wing_N = mkN "ġewnaħ" "ġwienaħ" ;
lin wipe_V2 = dirV2 (mesah_MSH_1_8881_V) ;
lin with_Prep = mkPrep "ma'" "m'" "mal-" "mat-" "mal-" ;
lin without_Prep = mkPrep "mingħajr" ;
lin woman_N = mkN "mara" "nisa" ;
lin wonder_VQ = kkuntempla_V ;
lin wood_N = mkN "injam" "injamiet" ;
lin worm_N = mkNColl "dudu" "dud" "dudiet" ;
lin write_V2 = dirV2 (kiteb_KTB_1_8641_V) ;
lin year_N = mkNDual "sena" "sentejn" "snin" ;
lin yellow_A = mkA "isfar" "safra" "sofor" ;
lin yes_Utt = ss "iva" ;
lin youPl_Pron = mkPron "intom" "kom" plural P2 masculine ;
lin youPol_Pron = youSg_Pron ;
lin youSg_Pron = mkPron "int" "ek" singular P2 masculine ; --- also INTI
lin young_A = small_A ;
}
