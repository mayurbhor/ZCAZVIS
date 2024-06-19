@AccessControl.authorizationCheck: #NOT_REQUIRED
@EndUserText.label: 'Advace License application line item CDS'
define view entity ZADVLICRECEIPTLICDS as select from zadvlicrecptli
//association to parent ZADVLICRECEIPTCDS as _head on _head.Licnumber = $projection.Licnumber and _head.Licdate = $projection.
 //   on $projection.element_name = _association_name.target_element_name
{
    
    key licnumber as Licnumber,
    key filenumber as Filenumber,
    key licdate as Licdate,
    matgroup as Matgroup,
    groupdesc as Groupdesc,
    utilize as Utilize,
    importqty as Importqty,
    uom as Uom,
    rateuom as Rateuom,
    currency as Currency,
    exchangerate as Exchangerate,
    cifvalue as Cifvalue,
    cifvalueinr as Cifvalueinr
   // _head
}
