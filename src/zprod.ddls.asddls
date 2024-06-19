@AccessControl.authorizationCheck: #NOT_REQUIRED
@EndUserText.label: 'Prod Desc'
define root view entity zprod
  as select from I_ProductPlantBasic  as a
    inner join   I_ProductDescription as b on  a.Product  = b.Product
                                           and b.Language = 'E'
  //composition of target_data_source_name as _association_name
{
  key a.Product,
      a.Plant,
      b.ProductDescription
      //    _association_name // Make association public
}
