@AccessControl.authorizationCheck: #NOT_REQUIRED
@EndUserText.label: 'Exchange Rate CDS'
define root view entity zexchangeratecds
  as select from zexchange
  //composition of target_data_source_name as _association_name
{
  key tocurrency   as Tocurrency,
  key validfrom    as Validfrom,
      exchangerate as Exchangerate
      //    _association_name // Make association public
}
