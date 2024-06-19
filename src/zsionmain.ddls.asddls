@AccessControl.authorizationCheck: #NOT_REQUIRED
@EndUserText.label: 'SION Main CDS'
define root view entity zsionmain as select from zsionhead
composition [0..*] of zsionitemcds as _item

{
    key compcode as Compcode,
    key sion as Sion,
    material as Material,
    mat_group as Mat_Group,
    mat_grp_desc as Mat_Grp_Desc,
    createdby as Createdby,
    createdon as Createdon,
    createdat as Createdat,
    _item
//    _association_name // Make association public
}
