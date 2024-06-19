//@AbapCatalog.sqlViewName: ''
//@AbapCatalog.compiler.compareFilter: true
//@AbapCatalog.preserveKey: true
//@AccessControl.authorizationCheck: #NOT_REQUIRED
//@EndUserText.label: 'HSN code for Product'
define root view entity zhsn
  as select distinct from    I_ProductPlantBasic as a
    left outer join I_Product as b on a.Product = b.Product
    left outer join I_ProductDescription_2 as c on b.Product = c.Product and c.Language = 'E'
{
  key a.Product,
  c.ProductDescription,
  a.Plant,
  a.ConsumptionTaxCtrlCode as HSN

}
