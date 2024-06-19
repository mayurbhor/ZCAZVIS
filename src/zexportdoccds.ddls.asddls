@AccessControl.authorizationCheck: #NOT_REQUIRED
@EndUserText.label: 'Export CDS'
define view entity zexportdoccds
  as select from zexportdoc
  //composition of target_data_source_name as _association_name
  association to parent zexportheadcds as _head on  $projection.Billingdocument = _head.Salesdocument
                                                and $projection.compcode        = _head.Compcode
{
  key compcode            as compcode,
  key billingdocument     as Billingdocument,
  key billingdocumentitem as Billingdocumentitem,
      material            as Material,
      matdesc             as matdesc,
      billingquantityunit as Billingquantityunit,
      billingquantity     as Billingquantity,
      salesdocument       as Salesdocument,
      netamount           as Netamount,
      transactioncurrency as Transactioncurrency,
      _head // Make association public
}
