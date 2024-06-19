@AccessControl.authorizationCheck: #NOT_REQUIRED
@EndUserText.label: 'Rod Tep CDS'
define root view entity zrodtepcds
  as select from zrodtepmaser
  //composition of target_data_source_name as _association_name
{
  key compcode    as Compcode,
  key material    as Material,
      rodtepcode  as Rodtepcode,
      rodtepfrom  as Rodtepfrom,
      rodtepcurr  as Rodtepcurr,
      rodteprate  as Rodteprate,
      rodtepvalue as Rodtepvalue,
      description as Description,
      createdby   as Createdby,
      createdon   as Createdon,
      createdat   as Createdat,
      changedby   as Changedby,
      changedon   as Changedon,
      changedat   as Changedat
      //    _association_name // Make association public
}
