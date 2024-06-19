@AccessControl.authorizationCheck: #NOT_REQUIRED
@EndUserText.label: 'DBK Master CDS'
define root view entity zdbkmastercds
  as select from zdbkmaster
  //composition of target_data_source_name as _association_name
{
  key compcode    as Compcode,
  key material    as Material,
      dbkcode     as Dbkcode,
      dbkfrom     as Dbkfrom,
      dbkcurr     as Dbkcurr,
      dbkrate     as Dbkrate,
      dbkvalue    as Dbkvalue,
      description as Description,
      createdby   as Createdby,
      createdon   as createdon,
      createdat   as createdat,
      changedby   as changedby,
      changedon   as changedon,
      changedat   as changedat
      //    _association_name // Make association public
}
