@EndUserText.label: 'Elizible amount table function'
define table function ZELIZIBLEAMOUNT_TF

  with parameters
   billingdoc : abap.char(40)
returns
{
  CLIENT                 : abap.clnt;
  COMPCODE               : abap.char(10); //char10,
  SALESDOCUMENT          : abap.char(40); // TYPE char40,
  MAT_DOC                : abap.char(40); //  TYPE char40,
  DBKRATE                : abap.char(10); // TYPE char10,
  ELIGIBLE_DBK_AMOUNT    : abap.char(10); //TYPE char10,
  RODTEPRATE             : abap.char(10); //TYPE char10,
  ELIGIBLE_RODTEP_AMOUNT : abap.char(10); //TYPE char10,
  INRFOB_VALUE           : abap.char(10); // TYPE char10,
  USDFOB_VALUE           : abap.char(10);  
}
implemented by method
  ztf_amdp=>GET_DATA;