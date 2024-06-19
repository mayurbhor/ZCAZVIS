@AccessControl.authorizationCheck: #NOT_REQUIRED
@EndUserText.label: 'License Application CDS'
define root view entity ZLICAPPCDS as select from zlicapp
//composition of target_data_source_name as _association_name
{
    
    key compcode as CompCode,
    key license_type as License_Type
}
