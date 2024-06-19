CLASS ztf_amdp DEFINITION
  PUBLIC
  FINAL
  CREATE PUBLIC .

  PUBLIC SECTION.

   INTERFACES if_amdp_marker_hdb.

    TYPES : BEGIN OF ty_inv_cal,
              compcode               TYPE char10,
              salesdocument          TYPE char40,
              mat_doc                TYPE char40,
              dbkrate                TYPE char10,
              eligible_dbk_amount    TYPE char10,
              rodteprate             TYPE char10,
              eligible_rodtep_amount TYPE char10,
              inrfob_value           TYPE char10,
              usdfob_value           TYPE char10,

            END OF ty_inv_cal.

    TYPES it_inv_cal TYPE STANDARD TABLE OF ty_inv_cal WITH DEFAULT KEY.
    CLASS-METHODS get_data FOR TABLE FUNCTION ZELIZIBLEAMOUNT_TF.



  PROTECTED SECTION.
  PRIVATE SECTION.
ENDCLASS.



CLASS ZTF_AMDP IMPLEMENTATION.


  METHOD get_data BY DATABASE FUNCTION FOR HDB LANGUAGE SQLSCRIPT OPTIONS READ-ONLY USING zexportheader zexportdoc zdbkmaster zrodtepmaser zexportitem.


  return select client,tab2.compcode,tab2.salesdocument,tab2.mat_doc,tab2.dbkrate,
*  tab2.ELIGIBLE_DBK_AMOUNT,
  cast((cast((CASE when tab2.dbkrate='' THEN '0' ELSE tab2.dbkrate end) AS float ) * cast((CASE when tab2.inrfob_value='' THEN '0' ELSE tab2.inrfob_value end) AS float ) / 100) AS decimal(10,2))  AS eligible_dbk_amount ,
  tab2.rodteprate,
*  tab2.ELIGIBLE_RODTEP_AMOUNT,
  cast((cast((CASE when tab2.rodteprate='' THEN '0' ELSE tab2.rodteprate END ) AS float ) * cast((CASE when tab2.inrfob_value='' THEN '0' ELSE tab2.inrfob_value end) AS float ) / 100) AS decimal(10,2))  AS eligible_rodtep_amount,

  (case when tab2.inrfob_value='' then '0.00' else tab2.inrfob_value end) as inrfob_value,
  (case when tab2.usdfob_value='' then '0.00' else tab2.usdfob_value end) as usdfob_value

  from (select  * from ( select client,
   head.compcode as compcode,
   head.salesdocument as salesdocument,
  (SELECT material FROM zexportdoc AS m WHERE m.billingdocument = head.salesdocument and  m.billingdocument NOT IN( '1000000016','90000050') and  m.billingdocument <> '' group by m.material ) as mat_doc ,
   (SELECT dbkrate FROM zdbkmaster AS dbk
   WHERE dbk.material =  (SELECT material FROM zexportdoc AS m WHERE m.billingdocument = head.salesdocument and  m.billingdocument NOT IN( '1000000016','90000050') and  m.billingdocument <> '' group by m.material ) )  as dbkrate,
  '' as ELIGIBLE_DBK_AMOUNT,
   ( select rodteprate from zrodtepmaser
   where material = (SELECT material FROM zexportdoc AS m WHERE m.billingdocument = head.salesdocument and  m.billingdocument NOT IN( '1000000016','90000050') and  m.billingdocument <> '' group by m.material ) )  as rodteprate    ,
  '' as ELIGIBLE_RODTEP_AMOUNT ,
  ( select distinct sd_inrfob_value from zexportitem where lictype = 'DBK' and salesdocument = head.salesdocument ) as inrfob_value,
   ( select distinct sd_usdfob_value from zexportitem where lictype = 'DBK' and salesdocument = head.salesdocument ) as usdfob_value
  from zexportheader as head where head.salesdocument = billingdoc) as tab1 where tab1.mat_doc <> '') as tab2;


*  return select  client ,
* '1000' as compcode  ,
* '1231' as salesdocument,
*  'MAterial' as mat_doc ,
*  '1.4' as dbkrate,
*  '45.09' as ELIGIBLE_DBK_AMOUNT,
*  '9.87' as rodteprate    ,
*  '89.87' as ELIGIBLE_RODTEP_AMOUNT ,
*  '0.7' as inrfob_value from    zexportheader where salesdocument =  billingdoc;




*  return select '000' as client, compcode,salesdocument,mat_doc,dbkrate,
*    cast((cast((CASE when dbkrate='' THEN '0' ELSE dbkrate end) AS float ) * cast((CASE when inrfob_value='' THEN '0' ELSE inrfob_value end) AS float ) / 100) AS decimal(10,2))  AS eligible_dbk_amount ,
*    rodteprate,
*    cast((cast((CASE when rodteprate='' THEN '0' ELSE rodteprate END ) AS float ) * cast((CASE when inrfob_value='' THEN '0' ELSE inrfob_value end) AS float ) / 100) AS decimal(10,2))  AS eligible_rodtep_amount,
*     (CASE when inrfob_value='' THEN '0.00' ELSE inrfob_value END ) AS inrfob_value  FROM (  SELECT a.compcode,a.salesdocument,
*   (SELECT material FROM zexportdoc AS m WHERE m.billingdocument = a.salesdocument and  m.billingdocument <> '90000050' group by m.material ) as mat_doc,
*   (SELECT dbkrate FROM zdbkmaster AS dbk WHERE dbk.material = (SELECT material FROM zexportdoc AS m WHERE m.billingdocument = a.salesdocument and m.billingdocument <> '90000050' group by m.material ) ) as dbkrate,
*   ( select rodteprate from zrodtepmaser where material = (SELECT material FROM zexportdoc AS m WHERE m.billingdocument = a.salesdocument and m.billingdocument <> '90000050' group by m.material ) ) as rodteprate,
*   ( select distinct sd_inrfob_value from zexportitem where lictype = 'DBK' and salesdocument = a.salesdocument ) as inrfob_value
*    from zexportheader as a where a.salesdocument <> '90000050') as tab1;

  ENDMETHOD.
ENDCLASS.
