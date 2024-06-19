@AccessControl.authorizationCheck: #NOT_REQUIRED
@EndUserText.label: 'New CDS'
define root view entity znewcds
  as select from znew
  //composition of target_data_source_name as _association_name
{
  key char1 as Char1,
  key num1  as Num1,
      text1 as Text1
      //    _association_name // Make association public
}
