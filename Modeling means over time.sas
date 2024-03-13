/* Modeling means over time
TIME categorical variable
*/

PROC MIXED DATA=X;
  CLASS patient_ID varaible TIME;
  Model CHANGE = variable TIME variable*TIME /
   DDFM=KR; *Kenward-Roger approximation;
  REPEATED TIME/ subject=patient_ID TYPE=UN R; *unstructured covriance in this case;
  LSMEANS variable*TIME/DIFFS;
  /*
  ODS OUTPUT DIFFS=_DIFFS (where=(TIME=_TIME)) LSMEANS=_LSMEANS;
  */
Run;
 
 
/*Modeling means over time
TIME_cont is continous time variable; values 1,2,3 as in patient visit number
fitting time as fixed effect (linear); always check if quardatic or cubic representation of time fits better
*/
PROC MIXED DATA=X;
  CLASS patient_ID varaible TIME;
  Model CHANGE = variable TIME_cont variable*TIME_cont /
   DDFM=KR; *Kenward-Roger approximation;
  REPEATED TIME/ subject=patient_ID TYPE=UN RCORR; *unstructured covriance in this case;
  LSMEANS variable / at TIME_cont=1 DIFFS;
  LSMEANS variable / at TIME_cont=2 DIFFS;
  LSMEANS variable / at TIME_cont=3 DIFFS;
  /*
  ODS OUTPUT DIFFS=_DIFFS (where=(TIME=_TIME)) LSMEANS=_LSMEANS;
  */
Run;


/*Modeling means over time
TIME is categorical variable
fitting time as random effect
*/
PROC MIXED DATA=X;
  CLASS patient_ID varaible;
  Model CHANGE = variable TIME variable*TIME /
   DDFM=KR; *Kenward-Roger approximation;
  Random INT TIME / Subject=patient_ID TYPE=UN G GCORR;
  LSMEANS variable / at TIME=1 DIFFS;
  LSMEANS variable / at TIME=2 DIFFS;
  LSMEANS variable / at TIME=3 DIFFS;
  /*
  ODS OUTPUT DIFFS=_DIFFS (where=(TIME=_TIME)) LSMEANS=_LSMEANS;
  */
Run;






