@EndUserText.label: 'Amount Table Function'
//@ClientDependent: true
@AccessControl.authorizationCheck: #NOT_REQUIRED
define table function zlicamount1
  with parameters

    @Environment.systemField: #CLIENT
    client      : abap.clnt,
    BILL_DOC_NO : abap.char(10)
returns
{
  mandt                  : abap.clnt;
  COMPCODE               : abap.char(4);
  SALESDOCUMENT          : abap.char(10);
  //  mat_doc                : abap.char(10);
  //  dbkrate                : abap.char(10);
  ELIGIBLE_DBK_AMOUNT    : abap.char(30);
  //  rodteprate             : abap.char(20);
  ELIGIBLE_RODTEP_AMOUNT : abap.char(30);
  //  inrfob_value           : abap.char(20);
}
implemented by method
  ZEX_INV_CAL=>GET_DATA;