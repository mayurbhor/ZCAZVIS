@AccessControl.authorizationCheck: #NOT_REQUIRED
@EndUserText.label: 'SION Item CDS'
define view entity zsionitemcds
  as select from zsionitem
  //composition of target_data_source_name as _association_name
  association to parent zsionmain as _head on  $projection.Sion     = _head.Sion
                                           and $projection.Compcode = _head.Compcode
{
  key compcode     as Compcode,
  key sion         as Sion,
  key itemno       as Itemno,
      material     as Material,
      mat_group    as Mat_Group,
      mat_grp_desc as Mat_Grp_Desc,
      unit         as Unit,
      quantity     as Quantity,
      deleted      as Deleted,
      _head
      //    _association_name // Make association public
}
