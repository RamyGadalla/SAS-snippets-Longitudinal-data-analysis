/* TIME catagotical variable
Fitting random intercept */

PROC MIXED DATA=X
  CLASS patient_ID variable TIME
  MODEL CHANGE = variable TIME variable*TIME /
  DDFM=KR; *Kenward-Roger approximation;
  Random INT / Subject=patient_ID;
  LSMEANS varibale*TIME/DIFFS;
Run;



/* TIME catagotical variable,
Fitting residual correlation - structured */

PROC MIXED DATA=X;
  CLASS patient_ID variable TIME;
  MODEL CHANGE = variable TIME variable*TIME /
  DDFM=KR; *Kenward-Roger approximation; 
  Repeated TIME / Subject= patient_ID TYPE=XX; /* XX either CS, TOEP, AR1..etc check documentation for correlation structures */
  LSMEANS varibale*TIME/DIFFS;
Run;


/* TIME catagotical variable,
Random intercept and structured Residual correlations */  

PROC MIXED DATA=X;
  CLASS patient_ID variable TIME;
  MODEL CHANGE = variable TIME variable*TIME /
  DDFM=KR; *Kenward-Roger approximation; 
  Random INT / Subject=patient_ID;
  Repeated TIME / Subject= patient_ID TYPE=XX; /* XX either CS, TOEP, AR1..etc check documentation for correlation structures */
  LSMEANS varibale*TIME/DIFFS;
  /*
  ODS OUTPUT DIFFS = _DIFFS (where=(TIME=_TIME))
  LSMEANS=_LSMEANS;
  */
Run;
