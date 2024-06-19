@AbapCatalog.sqlViewName: 'ZELIZIBALEAMTSQL'
@AbapCatalog.compiler.compareFilter: true
@AbapCatalog.preserveKey: true
@AccessControl.authorizationCheck: #NOT_REQUIRED
@EndUserText.label: 'Elizible amount CDS'
define view ZELIZIBLEAMOUNTCDS
    with parameters billingdoc: char40
as select from ZELIZIBLEAMOUNT_TF(billingdoc : $parameters.billingdoc) 
{
   key compcode,
   key salesdocument,
    mat_doc,
    dbkrate,
    ELIGIBLE_DBK_AMOUNT,
    rodteprate,
    ELIGIBLE_RODTEP_AMOUNT,
    inrfob_value
    
} 

where salesdocument = $parameters.billingdoc
