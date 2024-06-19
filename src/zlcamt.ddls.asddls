//@AbapCatalog.sqlViewName: ''
//@AbapCatalog.compiler.compareFilter: true
//@AbapCatalog.preserveKey: true
@ObjectModel.query.implementedBy: 'ABAP:ZEX_INV_CAL'
//@AccessControl.authorizationCheck: #NOT_REQUIRED
@EndUserText.label: 'Amount Table Function'
define root custom entity zlcamt //as select from data_source_name
  //{
  //
  //} im

  with parameters

//    @Environment.systemField: #CLIENT
//    client      : abap.clnt,
    BILL_DOC_NO : abap.char(10)
  //returns
{
//  key mandt                  : abap.clnt;
  key COMPCODE               : abap.char(4);
      //  mat_doc                : abap.char(10);
      //  dbkrate                : abap.char(10);
      ELIGIBLE_DBK_AMOUNT    : abap.char(30);
      //  rodteprate             : abap.char(20);
      ELIGIBLE_RODTEP_AMOUNT : abap.char(30);
      //  inrfob_value           : abap.char(20);
}
//implemented by method
//  ZEX_INV_CAL=>GET_DATA;
