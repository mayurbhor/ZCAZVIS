@AccessControl.authorizationCheck: #NOT_REQUIRED
@EndUserText.label: 'Billing API item'
define view entity zbillingapiitem
  as select from    I_BillingDocumentItem as item

    left outer join I_ProductDescription  as d on  item.Material = d.Product
                                               and d.Language    = 'E'
  association to parent zbillingapiexp as _head on $projection.BillingDocument = _head.BillingDocument
  //composition of target_data_source_name as _association_name
{

      //    _association_name // Make association public
  key item.BillingDocument,
      item.BillingDocumentItem,

      item.Material,
      d.ProductDescription,
      item.BillingQuantityUnit,
      item.BillingQuantity,
      item.SalesDocument,
      item.NetAmount,
      item.TransactionCurrency,
      item._PricingElement[ BillingDocument = $projection.billingdocument and BillingDocumentItem = $projection.billingdocumentitem
      and ConditionType = 'JOCG' ].ConditionAmount   as freight,
      item._PricingElement[ BillingDocument = $projection.billingdocument and BillingDocumentItem = $projection.billingdocumentitem
      and ConditionType = 'JOCG' ].ConditionAmount   as insurance,
      item._PricingElement[ BillingDocument = $projection.billingdocument and BillingDocumentItem = $projection.billingdocumentitem
      and ConditionType = 'JOCG' ].ConditionAmount   as commission,
      item._PricingElement[ BillingDocument = $projection.billingdocument and BillingDocumentItem = $projection.billingdocumentitem
      and ConditionType = 'JOCG' ].ConditionAmount   as discount,

      @Semantics.amount.currencyCode: 'TransactionCurrency'
      item.NetAmount - ( item._PricingElement[ BillingDocument = $projection.billingdocument and BillingDocumentItem = $projection.billingdocumentitem
      and ConditionType = 'JOCG' ].ConditionAmount +

      item._PricingElement[ BillingDocument = $projection.billingdocument and BillingDocumentItem = $projection.billingdocumentitem
      and ConditionType = 'JOCG' ].ConditionAmount +
      item._PricingElement[ BillingDocument = $projection.billingdocument and BillingDocumentItem = $projection.billingdocumentitem
      and ConditionType = 'JOCG' ].ConditionAmount +
      item._PricingElement[ BillingDocument = $projection.billingdocument and BillingDocumentItem = $projection.billingdocumentitem
      and ConditionType = 'JOCG' ].ConditionAmount ) as fob,
      _head
}
