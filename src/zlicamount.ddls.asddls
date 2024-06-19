@AccessControl.authorizationCheck: #NOT_REQUIRED
@EndUserText.label: 'Amount calculation'
//@ClientDependent: true
define root view entity zlicamount
  with parameters
    billdocno : zbill
  as select from zlicamount1( BILL_DOC_NO : $parameters.billdocno ,client : $session.client ) as a
  //composition of target_data_source_name as _association_name
{
  key a.COMPCODE,
  key a.SALESDOCUMENT,
      a.ELIGIBLE_DBK_AMOUNT,
      a.ELIGIBLE_RODTEP_AMOUNT

}
