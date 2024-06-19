@AccessControl.authorizationCheck: #NOT_REQUIRED
@EndUserText.label: 'Advace License application item CDS'
define view entity ZADVLICAPPITEMCDS as select from zadvlicappitem
//composition of target_data_source_name as _association_name
association to parent ZADVLICAPPHEADCDS as _head on  $projection.Sion_No = _head.Sion_No and _head.Application_No = $projection.Application_No
                                          
{
    key sion_no as Sion_No,
    key application_no as Application_No,
    mat_group as Mat_Group,
    description as Description,
     utilize as Utilize,
    import_qty as Import_Qty,
    uom as Uom,
    rate_uom as Rate_Uom,
    currency as Currency,
    exchange_rate as Exchange_Rate,
    cif_value as Cif_Value,
    cif_value_inr as Cif_ValueInr,
    _head
    //_association_name // Make association public
}
