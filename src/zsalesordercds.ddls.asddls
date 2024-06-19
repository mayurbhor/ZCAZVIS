@AccessControl.authorizationCheck: #NOT_REQUIRED
@EndUserText.label: 'Sales return'
define root view entity zsalesordercds
  as select distinct from I_SalesDocumentItem as a
    inner join            I_SalesDocument     as b on a.SalesDocument = b.SalesDocument
    inner join            I_Customer          as c on b.SoldToParty = c.Customer
{
  key a.SalesDocument,
  key a.SalesDocumentItem,
      b.SalesDocumentType,
      a.Plant,
      a._Plant.PlantName,
      a._SalesDocument.SoldToParty,
      c.CustomerAccountGroup,
      c.CustomerName

}
where
     b.SalesDocumentType = 'CBAR'
  or b.SalesDocumentType = 'CBRE'
  or b.SalesDocumentType = 'CBG0'
