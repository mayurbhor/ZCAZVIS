@AccessControl.authorizationCheck: #NOT_REQUIRED
//@AccessControl.auditing.type: #CUSTOM
@EndUserText.label: 'Advace License application Head CDS'
define root view entity ZADVLICAPPHEADCDS
  as select from zadvlicapp
  composition [0..*] of ZADVLICAPPITEMCDS as _item
  //composition of target_data_source_name as _association_name
{
  key sion_no              as Sion_No,
  key application_no       as Application_No,
      mat_group            as Mat_Group,
      mat_desc             as Mat_Desc,
      export_qty           as Expor_tQty,
      uom                  as Uom,
      rate_uom             as Rate_Uom,
      doc_curr             as Doc_Curr,
      exchange_rate        as Exchange_Rate,
      fob_value            as Fob_Value,
      fob_value_inr        as Fob_Value_Inr,
      cif_value            as Cif_Value,
      cif_value_inr        as Cif_Value_Inr,
      value_add_percent    as Value_Add_Percent,
      value_add            as Value_Add,
      application_fees     as Application_Fees,
      dd_number            as Dd_Number,
      other_desc           as Other_Desc,
      other_date           as Other_Date,
      other_issuedby       as Other_Issuedby,
      port_of_registration as Port_Of_Registration,
      supp_ord_no          as Supp_Ord_No,
      supp_ord_date        as Supp_Ord_Date,
      with_norms_flg       as With_Norms_Flg,
      _item
      //_association_name // Make association public
}
