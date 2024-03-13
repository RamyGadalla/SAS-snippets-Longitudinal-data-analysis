
/* Generalized least square
fitting variableX as continous covariate */

PROC MIXED DATA=X;
 CLASS patient_ID variable TIME;
 MODEL Y = variableX variable TIME variablex*TIME variable*TIME /
  DDFM=KR;
 REPEATED TIME / SUBJECT=patient_ID TYPE=UN R RCORR;
 LSMEANS variable*TIME /DIFFS;
RUN;




/* Generalized least square
fitting variableX as categorical covariate */

PROC MIXED DATA=X;
 CLASS patient_ID variable TIME variableX;
 MODEL Y = variableX variable TIME variablex*TIME variable*TIME /
  DDFM=KR OUTP= Cov;
 REPEATED TIME / SUBJECT=patient_ID TYPE=UN R RCORR;
 LSMEANS variable*TIME /DIFFS;
RUN;
