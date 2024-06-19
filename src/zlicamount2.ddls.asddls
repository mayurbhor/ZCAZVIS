@AbapCatalog.sqlViewName: 'ZLICAMT'
@AbapCatalog.compiler.compareFilter: true
@AbapCatalog.preserveKey: true
@AccessControl.authorizationCheck: #NOT_REQUIRED
@EndUserText.label: 'Amount Table Function'
//@OData.publish :true
define view zlicamount2
  with parameters
    billdocno : zbill
  as select from zlicamount1( client : $session.client , BILL_DOC_NO : $parameters.billdocno ) as a
  //composition of target_data_source_name as _association_name
{
  key a.COMPCODE,
  key a.SALESDOCUMENT,
      a.ELIGIBLE_DBK_AMOUNT,
      a.ELIGIBLE_RODTEP_AMOUNT

}
