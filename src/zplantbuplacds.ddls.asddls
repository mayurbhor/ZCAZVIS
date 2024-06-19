//@AbapCatalog.sqlViewName: ''
//@AbapCatalog.compiler.compareFilter: true
//@AbapCatalog.preserveKey: true
//@AccessControl.authorizationCheck: #NOT_REQUIRED
//@EndUserText.label: 'Plant Bupla'
define root view entity zplantbuplacds
  as select from zplantbupla
{
  key plant    as Plant,
      compcode as Compcode,
      country  as Country,
      bupla    as Bupla
}
