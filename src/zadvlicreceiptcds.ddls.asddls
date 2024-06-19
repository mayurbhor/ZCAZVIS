//@AccessControl.authorizationCheck: #NOT_REQUIRED
@AccessControl.authorizationCheck: #NOT_REQUIRED
@EndUserText.label: 'Advace License application CDS'
define root view entity ZADVLICRECEIPTCDS as select from zadvlicrecpthead
 //composition [0..*] of zadvlicrecptli as _item
//composition of zadvlicrecptli as __items
{
    key licnumber as Licnumber,
    key filenumber as Filenumber,
    key licdate as Licdate,
    licexpiredt as Licexpiredt,
    filedt as Filedt,
    portofreg as Portofreg,
    appfee as Appfee,
    ddnumber as Ddnumber,
    othrdtlsdate as Othrdtlsdate,
    issuedby as Issuedby,
    supordnum as Supordnum,
    suporddt as Suporddt,
    withnorms as Withnorms,
    sionnumber as Sionnumber,
    matgroup as Matgroup,
    description as Description,
    matnumber as Matnumber,
    exportqty as Exportqty,
    uom as Uom,
    rateuom as Rateuom,
    doccurr as Doccurr,
    exchangerate as Exchangerate,
    fobvalue as Fobvalue,
    cifvalueinr as Cifvalueinr,
    valueaddpercent as Valueaddpercent,
    valueaddition as Valueaddition
   // _item // Make association public
}
