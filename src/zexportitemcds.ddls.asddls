@AccessControl.authorizationCheck: #NOT_REQUIRED
@EndUserText.label: 'Export ITem CDS'
define view entity zexportitemcds
  as select from zexportitem
  //composition of target_data_source_name as _association_name
  association to parent zexportheadcds as _head on  $projection.Salesdocument = _head.Salesdocument
                                                and $projection.Compcode      = _head.Compcode
{
  key compcode            as Compcode,
  key salesdocument       as Salesdocument,
  key lictype             as Lictype,
      leg1                as Leg1,
      leg2                as Leg2,
      leg3                as Leg3,
      leg4                as Leg4,
      vessel1             as Vessel1,
      vessel2             as Vessel2,
      vessel3             as Vessel3,
      vessel4             as Vessel4,
      eligible_amount     as Eligible_Amount,
      balance_amount      as Balance_Amount,
      shippin_agent       as Shippin_Agent,
      airwayno            as Airwayno,
      dbkrecdocno         as Dbkrecdocno,
      dbkrecamount        as Dbkrecamount,
      dbkrecdate          as Dbkrecdate,
      rodtepamount        as Rodtepamount,
      redteprecdate       as Redteprecdate,
      dbkpostdoc          as Dbkpostdoc,
      rodteppostdoc       as Rodteppostdoc,
      sd_usdexchange_rate as SD_USDExchange_Rate,
      sd_usdinvoice_amt   as SD_USDInvoice_Amt,
      sd_usdfrieght_amt   as SD_USDFrieght_Amt,
      sd_usdinsurace_amt  as SD_USDInsurace_Amt,
      sd_usdcommision_amt as SD_USDCommision_Amt,
      sd_usddiscount_amt  as SD_USDDiscount_Amt,
      sd_usdfob_value     as SD_USDFob_Value,
      sd_inrexchange_rate as SD_INRExchange_Rate,
      sd_inrinvoice_amt   as SD_INRInvoice_Amt,
      sd_inrfrieght_amt   as SD_INRFrieght_Amt,
      sd_inrinsurace_amt  as SD_INRInsurace_Amt,
      sd_inrcommision_amt as SD_INRCommision_Amt,
      sd_inrdiscount_amt  as SD_INRDiscount_Amt,
      sd_inrfob_value     as SD_INRFob_Value,
      _head // Make association public
}
