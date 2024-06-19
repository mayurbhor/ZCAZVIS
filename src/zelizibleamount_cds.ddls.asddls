@AbapCatalog.sqlViewName: 'ZELIAMT'
@AbapCatalog.compiler.compareFilter: true
@AbapCatalog.preserveKey: true
@AccessControl.authorizationCheck: #NOT_REQUIRED
@EndUserText.label: 'Elizible amount CDS'
define view ZELIZIBLEAMOUNT_CDS as select from ZELIZIBLEAMOUNT_TF(billingdoc : '90000223')
{
    key COMPCODE,
    key SALESDOCUMENT,
    MAT_DOC,
    DBKRATE,
    ELIGIBLE_DBK_AMOUNT,
    RODTEPRATE,
    ELIGIBLE_RODTEP_AMOUNT,
    INRFOB_VALUE,
    USDFOB_VALUE
    
    
}
