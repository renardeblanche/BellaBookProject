from pathlib import Path
import fitz,json
root=Path(__file__).resolve().parents[1]
doc=fitz.open(root/'source/original.pdf')
specs=[
(298,'ch10_stemma_ruisseaux.png',(199,345,657,547)),
(298,'ch10_stemma_signal.png',(199,655,657,859)),
(298,'ch10_stemma_silence.png',(200,925,658,1127)),
(299,'ch10_stemma_adjectifs.png',(192,209,651,375)),
(300,'ch10_stemma_alfred.png',(337,100,536,231)),
(300,'ch10_incidence_structurale.png',(208,389,667,642)),
(300,'ch10_stemma_ami.png',(338,788,537,1004)),
(301,'ch10_incidence_semantique.png',(195,88,656,343)),
(301,'ch10_structure_sens.png',(134,422,799,669)),
(303,'ch10_categories_OA.png',(391,342,462,472)),
(304,'ch10_tau_schema.png',(169,213,799,368)),
(304,'ch10_livre_ami.png',(219,502,678,702)),
(304,'ch10_mode_paris.png',(219,768,678,921)),
(304,'ch10_mode_labels.png',(219,1013,678,1188)),
(305,'ch10_ecrivez.png',(292,128,545,385)),
(305,'ch10_docteur.png',(292,452,545,700)),
(305,'ch10_je_crois.png',(262,765,577,984)),
(306,'ch10_alfred_avoue.png',(300,99,571,302)),
(307,'ch10_alfred_bernard.png',(198,168,629,316)),
(307,'ch10_chante_crie.png',(199,829,629,978)),
(308,'ch10_anaphore.png',(174,273,711,527)),
(308,'ch10_alfred_rappel.png',(342,1002,542,1132)),
(309,'ch10_votre_ami.png',(331,236,529,427)),
(309,'ch10_nucleus_premiere.png',(262,954,600,1170)),
(310,'ch10_nucleus_deuxieme.png',(302,472,562,672)),
(311,'ch10_sujet_predicat.png',(237,89,636,173)),
(311,'ch10_alfred_dort.png',(357,240,517,398)),
(311,'ch10_frappe_comparaison.png',(149,560,782,726)),
(312,'ch10_trois_actants.png',(195,97,686,316)),
(312,'ch10_circonstants.png',(194,509,685,727)),
(313,'ch10_il_pleut.png',(361,544,481,672)),
]
records=[]
for n,name,xy in specs:
 r=fitz.Rect(*[x/1.5 for x in xy]); doc[n-1].get_pixmap(matrix=fitz.Matrix(2.5,2.5),clip=r).save(str(root/'assets'/name))
 records.append({'source_pdf_page':n,'file':'assets/'+name,'crop_pdf_points':list(r),'status':'原图保留，未改画'})
(root/'source/assets_ch10.json').write_text(json.dumps(records,ensure_ascii=False,indent=2))
