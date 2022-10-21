-- collect corresponding NDC for given RXNORM list
/*external list staged from csv file*/
create table ConceptSet_Med_AntiHTN_NDC as
select rxn.RXCUI
      ,rxn.DRUG_CLASS
      ,rxmap.ATV as NDC
      ,rxmap.SUPPRESS
from ConceptSet_Med_AntiHTN rxn
join ontology.rxnorm.rxnsat rxmap
on rxn.RXCUI = rxmap = RXCUI and
   rxmap.ATN = 'NDC'and rxmap.SAB = 'RXNORM' -- normalized 11-digit NDC codes
;

/*external list manually specified*/
create table ConceptSet_Med_AntiHTN_NDC as
select RXCUI
      ,ATV as NDC
      ,SUPPRESS
from ontology.rxnorm.rxnsat 
where ATN = 'NDC' and SAB = 'RXNORM' and -- normalized 11-digit NDC codes
   RXCUI in ('103945','104375','104376','104377','104378','104382','104384','104385','104388','104389',
             '106680','106681','106682','153275','153276','153277','153311','153312','153313','153460',
             '153461','153462','197884','198188','198189','199351','199352','199353','199622','199707',
             '199708','199709','199816','199817','199931','199937','201369','201370','201371','201372',
             '201373','201374','201377','201378','201379','201380','201381','201382','204404','205326',
             '206763','206764','206765','206766','206770','206771','207891','207892','207893','207895',
             '210671','210672','210673','210994','213482','226700','226701','226702','226706','226707',
             '226708','246264','246643','247516','250413','251856','251857','252820','260333','261962',
             '284213','308962','308963','308964','311353','311354','312748','312749','312750','314076',
             '314077','314203','317173','371001','371254','371506','372007','372274','372614','373293',
             '373731','373748','373749','374176','374177','374378','374938','378269','378288','389182',
             '389183','389184','393442','401965','401968','411434','413771','428809','428810','428811',
             '428825','428826','451330','452698','541022','582032','582033','700490','730511','730512',
             '730513','730514','844933','845488','845489','854925','854927','854984','854986','854988',
             '854990','857169','857171','857183','857185','857187','857189','857195','858804','858806',
             '858810','858812','858813','858815','858817','858819','858821','858823','858845','858926',
             '898687','898689','898690','898692','898719','898721','898723','898725','3829','29046','35296',
             '1299896','1299897','1299963','1299965','1435624','1435630','1729200','1729205','1806884',
             '429765','451173','104227','104228','104229','104230','104231','104232','104233','104234',
             '198222','198223','200815','200816','200817','200818','200819','200820','200821','200822',
             '200823','200824','200825','200826','200827','201282','207867','313096','351256','351257',
             '351258','373945','373946','378726','379251','402105','402106','402107','411223','411224',
             '429194','9997','198224','198225','208112','208113','208116','249762','250376','250377',
             '250704','370639','373947','373948','411480','427928','429195','432662','432663','451922',
             '451927','246399','251564','373944','432646','432647','451932','104359','104360','104361',
             '104363','104364','104366','141893','141894','141895','141896','141897','150752','152660',
             '152661','152662','152663','198141','199791','199796','199797','199798','199799','208467',
             '208469','208470','208471','208979','208980','208981','249389','249390','249747','249748',
             '250478','252198','260376','312593','312594','313214','313215','313216','313217','313218',
             '313219','313220','372478','373346','373352','373565','373566','373567','374033','374034',
             '385519','410176','411771','411772','430622','431751','431752','450643','451067','539839',
             '583146','583150','861402','861404','1361019','1361021','1361023','1361025','104367','104368',
             '104369','197625','197626','197627','197628','203210','205544','227240','235224','636360','636361',
             '1242404','1242408','153077','153078','153079','153080','153665','153666','153667','153822','153823',
             '153825','199850','199919','200094','200095','200096','205304','205305','213431','213432','252576',
             '261300','261301','282755','284531','310139','310140','349199','349200','349201','349373','349401',
             '349405','349483','351761','351762','352001','352199','352200','352201','352274','370704','371247',
             '372651','374024','374279','374612','378276','378991','389185','401971','540787','540791','577776',
             '577785','577787','639536','639537','639539','639543','979480','979482','979485','979487','979492',
             '979494','1091645','1091646','1091650','1091652','1091654','864774','1011718','1011724','1011729',
             '1011735','379442','450545','1191188','1191191','1191192','1191193','428207','430941','432681','439008',
             '439011','450465','102306','102309','102314','102315','103781','103782','104293','104294','104295',
             '104296','104300','104301','104303','104304','104305','104306','104308','104311','104312','104313',
             '104314','104315','104316','104317','104318','104348','104349','108356','108357','141832','141833',
             '141834','141883','141884','141885','141886','141887','141888','150750','150751','151071','151120',
             '152414','153532','153533','153817','153818','197379','197380','197381','198004','198005','198006',
             '198007','198008','198104','198105','198284','198285','198286','199277','199494','199495','199786',
             '199787','200031','200032','200033','200829','200830','200831','200832','200833','200835','200836',
             '200837','200838','200839','200840','200841','200842','200843','200844','200846','200847','200848',
             '200849','200850','200852','200853','200854','200855','200856','200857','200858','200859','201218',
             '201310','201311','201312','201313','201315','201316','201318','201319','201321','201322','201323',
             '201324','201325','201327','201328','201329','201330','201331','201332','201333','201334','201335',
             '201336','201337','201338','201339','201340','201343','201344','204012','204013','204014','204015',
             '206961','206964','206968','208140','208575','208576','211773','212388','212389','212390','226855',
             '226856','245278','245279','245718','245849','248494','249384','249385','250082','251762','252276',
             '346715','347160','370505','370619','370737','370959','370960','371065','371104','371295','371296',
             '372554','372891','372978','373183','373184','373254','373255','373460','373652','373653','373654',
             '373937','374135','375929','376261','376365','377103','377107','377113','377207','378147','378652',
             '378660','387013','387876','393308','393497','411993','414005','415736','421931','421932','428416',
             '429268','430569','430570','430619','430620','433892','434241','434242','437138','437140','450800',
             '450803','450805','628903','664767','686924','686926','727824','751612','751616','751618','751620',
             '751623','754914','755528','756436','827073','827075','844414','844906','854901','854903','854905',
             '854907','856443','856445','856448','856450','856457','856459','856460','856462','856463','856464',
             '856471','856472','856481','856483','856484','856485','856508','856519','856521','856528','856535',
             '856537','856538','856539','856556','856557','856569','856571','856572','856573','856576','856577',
             '856578','856579','856703','856704','856712','856713','856719','856724','856733','856734','856735',
             '856737','856739','860510','860512','860513','860514','860516','860518','860519','860520','860522',
             '860524','860525','860526','860532','860534','860535','860536','865154','865155','865157','865159',
             '866412','866414','866415','866416','866419','866421','866422','866423','866427','866429','866430',
             '866431','866436','866438','866439','866440','866508','866510','866511','866513','866514','866516',
             '866924','896758','896760','896762','896764','896766','896768','896771','896773','896775','896777',
             '896781','896783','896973','896983','896987','904561','904563','904567','904569','904571','904579',
             '904581','904583','904589','904591','904593','904601','904603','904605','904622','904630','904632',
             '904634','978577','978579','978581','978583','979428','979430','979432','979434','979436','979438',
             '995595','998685','998687','998689','998691','998693','998695','1191185','1191187','1191194','1191195',
             '1234256','1247408','1250200','1250201','1297753','1297755','1297757','1297759','1359872','1202','7008',
             '7226','8332','82084','203191','1606347','1606349','9947','1736541','1736546','1744259','1923422',
             '1923424','1923426','91691','91692','102337','102338','103944','104270','104271','104272','104273',
             '104276','104277','104278','104404','104406','104407','104408','104409','104411','104412','104414','104419',
             '104420','108494','108500','108501','108502','108745','108781','108834','108842','108849','108850','108913',
             '141902','141903','150753','151085','151126','151127','151240','151244','152543','152601','152725','152726',
             '152727','152730','152731','152801','152802','152803','152906','152908','152909','152933','152936','153071',
             '153103','153223','153308','153320','153369','153454','153455','153456','153457','153458','153538','153593',
             '153594','153680','153681','153789','153800','153839','153840','153894','153914','197361','197692','197848',
             '197849','198032','198033','198034','198035','198036','199329','199757','199782','199979','200877','200878',
             '200879','200880','200881','200883','200884','200885','200886','201285','201286','201287','201288','201289',
             '201290','201291','201292','201293','201294','201295','201296','201297','201444','201445','201449','201450',
             '201451','201452','201453','201455','201457','201458','202223','202224','202229','202230','202232','202233',
             '206934','206935','207765','207769','207772','207773','207774','212542','212549','212575','226347','226536',
             '226539','226540','226663','226710','226711','226712','226975','227052','227058','227059','227060','227061',
             '227073','227074','227075','227076','227077','227083','227110','227119','227121','227122','227164','227165',
             '227166','237443','237444','240575','245227','246260','246261','246262','246395','246396','246472','246473',
             '248631','248708','249387','249620','249717','249887','250206','250384','251867','252192','252211','252459',
             '308135','308136','311202','311203','311437','311983','311984','311985','311986','314132','317121','349485',
             '351438','358334','360344','360394','370573','370723','370724','371856','372289','372524','372555','372696',
             '373058','373059','373060','373067','373068','373069','373070','373093','373094','373098','374289','374290',
             '374411','374425','375031','375337','376248','376886','378649','379252','391901','391980','392165','393149',
             '393163','402695','402696','402698','404011','404013','405788','410587','411765','411766','412047','412048',
             '412163','412164','412181','412182','412510','412511','412512','415900','422272','429051','429052','431606',
             '431813','432811','433467','433843','434135','434570','437439','437440','437441','439558','439824','441152',
             '446659','446660','446705','446757','484953','491070','491078','491086','541603','542686','562154','562514',
             '562515','562518','562520','597921','597922','597923','597967','597971','597974','597977','597980','597984',
             '597987','597990','597993','672916','672917','672918','672920','672921','672922','700745','750199','750203',
             '750207','750211','750215','750219','750223','750227','750231','750235','750239','757673','757674','757675',
             '757676','762947','763497','763499','763519','763521','763574','763576','763589','763591','790489','790840',
             '804537','829359','829636','829734','829738','829747','829751','829757','830795','830798','830801','830803',
             '830837','830839','830845','830847','830861','830863','830865','830867','830869','830871','830872','830873',
             '830874','830876','830877','830878','830879','830880','830882','830883','830897','830898','830900','830902',
             '830922','830979','831012','831021','831022','831054','831055','831102','831103','831117','831119','831137',
             '831150','831172','831193','831196','831209','831215','831224','831226','831229','831230','831232','831233',
             '831240','831242','831244','831248','831250','831252','831254','831255','831271','831273','831274','831282',
             '831285','831288','831296','831300','831302','831305','831309','831312','831313','831319','831321','831323',
             '831325','831337','831338','831339','831345','831347','831349','831350','831351','831359','831360','833195',
             '833197','833199','833201','833217','833219','833222','833223','833694','833695','833696','833703','833704',
             '833705','833706','833707','833708','833716','834393','844410','844411','844412','844413','844415','844416',
             '844417','844418','844419','844420','844421','844422','844423','844424','844425','844428','844429','844430',
             '844431','844432','844433','844434','844435','844436','844437','844438','844439','844440','844441','844442',
             '844443','844444','844450','844454','844455','844456','844457','844458','844459','844460','844461','844462',
             '844584','844585','844586','844721','844722','844723','844724','844725','844726','844727','844728','844729',
             '844730','844731','844733','844734','844735','844736','844737','844738','844741','844745','844748','844750',
             '844830','844846','844872','844878','844923','844942','844943','844944','845004','845005','845006','845007',
             '845008','845009','845095','845096','845097','845098','845101','845102','845172','845173','845174','845175',
             '845176','845177','845178','845180','845181','845182','845183','845184','845185','845186','845187','845188',
             '845189','845190','845191','845192','845193','845194','845195','845196','845197','845198','845199','845200',
             '845201','845202','845203','845204','845205','845206','845207','845208','845214','845223','845224','845225',
             '845226','845227','845228','845229','845230','845231','845232','845233','845234','845235','845236','845237',
             '845238','845239','845240','845241','845242','845244','845245','845246','845247','845249','845250','845252',
             '845253','845254','845255','845256','845257','845258','845259','845260','845261','845262','845263','845264',
             '848524','849860','849861','849868','849869','858580','858583','858584','858585','858587','858589','858590',
             '858591','858593','858595','858596','858597','858599','858601','858603','858605','858607','858609','858613',
             '858615','858616','858617','858994','858996','859000','859007','859008','866828','880433','880434','880437',
             '880438','885733','885734','885735','885736','897584','897586','897587','897588','897590','897592','897593',
             '897594','897596','897598','897599','897600','897612','897614','897615','897616','897618','897620','897621',
             '897622','897624','897626','897627','897628','897630','897632','897633','897634','897635','897640','897646',
             '897649','897659','897661','897666','897667','897676','897680','897683','897685','897693','897694','897700',
             '897714','897719','897721','897722','897723','897726','897735','897743','898340','901434','901435','901438',
             '901444','901446','901448','901450','901468','901522','901523','901525','901526','977865','977867','1091623',
             '1091624','1091626','1091627','1091629','1091630','1091632','1091633','1091635','1091636','1091638','1091639',
             '1236453','1236458','1313987','1359734','1359797','7417','203138','203211','898316','198037','207779','1423767',
             '1791232','1791233','1791240','1812011','1812013','1812015','248267','371002','372008','372009','374178','379582',
             '389180','389181','393440','410743','411759','431825','439270','833237','846148','858618','858621','858884','858892',
             '897778','897780','897781','897782','897783','897785','897786','897787','897844','897846','897847','897848','897853',
             '897855','897856','897857','898342','898344','898346','898348','898350','898352','898353','898355','898356','898358',
             '898359','898361','901451','1600724','1600728','722125','722126','722131','722134','722137','724879','724887','724891',
             '724895','730860','730861','730866','730869','730872','744624','744628','744632','744636','876513','876514','876518',
             '876519','876523','876524','876528','876529','876533','251254','252201','370961','376172','393275','393276','411852',
             '411867','431674','432616','439560','446671','446677','432767','446675','1009218','1009220','1009247','1009249','1009253',
             '1009315','1009319','1009320','1009324','1050796','1050798','1050802','1050803','1050805','1050806','1050808','1050809',
             '1050811','1050812','1050814','432674','439288','104357','141951','152966','152967','197743','197744','197745','197746',
             '197955','197956','197957','197958','201352','201354','201355','201358','201361','206387','206389','206412','206413',
             '250546','250547','310661','311645','371581','371583','372364','372368','372854','372855','372969','375716','375876',
             '376259','376862','388078','411773','411774','411775','432414','446452','451311','884173','884175','884185','884187',
             '884189','884191','885790','885794','885878','885879','885880','885881','885882','885883','892789','892791','892795',
             '998671','998673','998675','998677','998679','998681','1013930','1013934','1013935','1013936','1013937','1013939',
             '1013940','1050315','1050316','1050334','1050335','1050338','1050339','1087322','1087323','1233709','1233785','1233786',
             '1233789','1233790','1360022','1360044','1360045','1360087','1360120','1360303','2599','6876','142432','202693','862006',
             '862010','862013','862015','862019','862021','862025','862027','93252','93253','104243','104245','104246','104248','108966',
             '198314','198315','198316','208124','250708','251268','310812','310817','310818','314029','370638','370640','370848',
             '370851','374192','374195','374196','376315','409813','427390','427727','428210','428292','428603','429932','429933',
             '429934','430625','432599','432676','432677','432742','437575','437576','437578','452285','452289','452292','452299',
             '452300','452302','539539','977883','977885','977907','977950','103932','103933','103934','153000','246528','249062',
             '251054','370847','370850','977890','977945','977951','977959','103966','104370','197436','197437','197438','197439',
             '197885','197886','197887','207961','207963','207965','211053','211072','249851','252371','310796','310797','310809',
             '349449','371000','371253','371507','372006','372273','372613','372946','373732','376291','393357','428808','428812',
             '428813','429647','429935','430636','446301','541946','790296','790297','809854','809858','823971','823982','823986',
             '854993','857166','857174','857178','857182','858824','858827','858828','858830','858921','882559','898362','898366',
             '898367','898371','898372','898376','898378','898382','991549','991553','991557','1001394','1299859','1299861','1299871',
             '1299873','1299890','1299959','312481','312482','312483','373564','428868','428869','451073','754802','754806','754812',
             '200284','200285','283316','283317','310792','310793','349353','351292','351293','352335','352336','370705','372650',
             '374280','374934','378735','378921','403853','403854','403855','406041','477130','485471','578325','578330','636042',
             '636045','749833','749837','749841','802749','805855','805859','805863','809014','809018','809022','809026','809030',
             '823934','823938','823942','847042','847055','847060','979464','979466','979468','979470','979471','979473','979497',
             '1235142','1235144','1235150','1235151','1235157','1235307','1235313','104324','104332','104337','104338','104340',
             '104343','104344','108743','108744','152916','153155','197382','197383','198000','198001','199717','201341','201342',
             '208003','208029','245854','245855','246267','246525','246526','246644','249567','249850','250226','250538','250543',
             '250544','250553','310811','370620','370738','370958','371103','372553','372879','372889','372890','372977','373181',
             '373182','373185','373186','373459','373461','373650','373651','373655','373656','373657','374136','374419','379254',
             '379255','385565','427556','428757','431608','432597','432657','432658','432678','433855','433891','434380','437142',
             '437986','440424','446468','491234','542127','687068','687069','746023','746030','854908','854910','854916','854918',
             '854919','854921','856393','856398','856401','856406','856412','856417','856422','856426','856429','856433','856586',
             '856587','856591','856592','856596','856597','856615','856616','856618','866452','866455','866456','866457','866461',
             '866464','866465','866466','866472','866475','866476','866477','866479','866482','866491','866498','866502','866506',
             '866846','896974','896975','896976','896990','998694','1111439','411865','432656','432659','432815','439004','439007',
             '440425','440427','848130','848131','848134','848135','848139','848140','848144','848145','848149','848151','848155',
             '999966','999967','999971','999986','999990','999991','999995','999996','1000000','1000001','1000005','852897','385943',
             '411821','452536','849871','197959','197960','197961','197962','197963','205332','206403','213488','213498','310664',
             '371580','371584','372366','372852','372853','430626','437827','438745','438747','485001','688643','688645','688647',
             '688649','884192','884196','884198','884202','884203','884207','884211','884215','884231','1233769','1233782','1233783',
             '1233784','1233788','152799','198312','198313','208674','208675','245283','245284','370564','370849','374193','374194',
             '562147','977880','977882','977887','10763','142424','197477','197562','197563','197564','197771','197789','197790',
             '197952','197953','197954','198198','198320','198321','204501','205364','205365','205474','205476','205478','205480',
             '205482','206558','206563','207094','207385','207387','208065','208066','208067','208084','208085','208086','208088',
             '208089','208090','208091','208092','208093','208825','213504','213505','214094','214095','237192','245282','251055',
             '310810','314018','315193','371003','371705','371706','373760','373761','373762','373763','373764','373765','373766',
             '373767','428142','428203','429153','429154','429155','451201','562344','637711','754717','1011710','1011712','1011713',
             '1011715','1011750','1011752','1011753','1011755','242957','370633','372406','432636','451919','905203','905207',
             '905211','905215','905217','905221','966574','966587','966594','966613','249746','374694','439015','905353','905355',
             '905367','905399','905401','905403','905405','905407','905409','905411','905413','966591','95600','104216','104217',
             '104218','104220','104221','121073','132604','197730','197731','197732','198369','198370','198371','198372','199610',
             '200800','200801','200802','200803','200804','200805','200806','200807','200808','200809','200810','200811','200812',
             '200813','200814','201234','201235','201236','201237','204154','205725','205726','205728','205732','208076','208080',
             '208081','208082','226982','248652','248657','249579','249815','250044','250477','251308','251372','251373','251746',
             '252484','282452','310429','313988','372278','372280','372281','372282','374168','377176','415572','415573','415574',
             '415575','415657','427474','428540','428541','542673','542678','543249','545041','617327','630032','630035','645036',
             '727573','727574','727575','727845','876422','899155','1112201','1233658','1233851','1251903','1251905','1251907',
             '1251909','1359513','1808','4603','5764','197417','197418','197419','205488','205489','205490','282486','1719286',
             '1719291','1727569','1729521','1729527','432679','446456','198194','198195','198196','198197','692500','1011736',
             '1011738','1011739','1011741','93382','104211','104212','104264','104267','150748','153208','197393','197394',
             '197475','197476','197497','197498','197499','197500','197769','197770','197788','197815','197816','197950','197951',
             '197977','197978','197979','198110','198111','198112','198319','199903','200791','200792','200793','200794','200795',
             '200796','200797','200798','200799','201262','201263','201269','202225','204515','206551','206552','206945','206946',
             '207089','207090','207271','207272','207276','207935','207936','207937','207938','207939','207940','207941','207942',
             '207943','207944','207945','207946','207947','208707','208708','208709','208710','208711','208716','208717','208719',
             '211759','213439','213443','213447','214081','214082','214083','242961','245285','250040','250528','250529','308614',
             '308615','308617','308618','309198','309633','310798','310813','311632','311671','312752','314020','346505','351451',
             '351505','370635','370636','370637','370650','370682','371004','371005','371409','371410','371472','371668','372468',
             '372847','372888','373241','373514','373734','374199','375772','375773','376241','376874','385502','411160','428333',
             '428539','429502','429503','431740','431741','433844','437828','440585','440593','484152','541298','542850','542854',
             '831701','831703','991211','991221','996476','1189779','5487','379256','379257','432897','432951','437781','977920',
             '977949','432769','452537','427704','438743','446454','1233787','430187','430188','437571','372407','966603','966616',
             '6984','197986','197987','199776','201347','207976','238240','314244','316310','317430','332239','370631','370632',
             '372938','374150','374151','375837','415553','415945','721832','905199','905201','905222','905224','905225','905227',
             '905377','905379','905395','905397','966571','966620','1165357','1165358','1241888','82027'
            )
;