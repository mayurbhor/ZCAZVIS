CLASS zex_inv_cal DEFINITION
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

            END OF ty_inv_cal.

    TYPES it_inv_cal TYPE STANDARD TABLE OF ty_inv_cal WITH DEFAULT KEY.
    CLASS-METHODS get_data  FOR TABLE FUNCTION zlicamount1
*      IMPORTING
*        VALUE(bill_doc_no) TYPE STRING
*      EXPORTING
*        VALUE(it_data)     TYPE it_inv_cal .
      .
  PROTECTED SECTION.
  PRIVATE SECTION.
ENDCLASS.



CLASS ZEX_INV_CAL IMPLEMENTATION.


  METHOD get_data BY DATABASE FUNCTION FOR HDB LANGUAGE SQLSCRIPT OPTIONS READ-ONLY USING zexportheader zexportdoc zdbkmaster zexportitem zrodtepmaser.

    it_data =    select compcode,salesdocument,mat_doc,dbkrate,
    cast((cast((CASE when dbkrate='' THEN '0' ELSE dbkrate end) AS float ) * cast((CASE when inrfob_value='' THEN '0' ELSE inrfob_value end) AS float ) / 100) AS decimal(10,2))  AS eligible_dbk_amount ,
    rodteprate,
    cast((cast((CASE when rodteprate='' THEN '0' ELSE rodteprate END ) AS float ) * cast((CASE when inrfob_value='' THEN '0' ELSE inrfob_value end) AS float ) / 100) AS decimal(10,2))  AS eligible_rodtep_amount,
     (CASE when inrfob_value='' THEN '0.00' ELSE inrfob_value END ) AS inrfob_value  FROM (  SELECT a.compcode,a.salesdocument,
   (SELECT material FROM zexportdoc AS m WHERE m.billingdocument = a.salesdocument group by m.material ) as mat_doc,
   (SELECT dbkrate FROM zdbkmaster AS dbk WHERE dbk.material = (SELECT material FROM zexportdoc AS m WHERE m.billingdocument = a.salesdocument group by m.material ) ) as dbkrate,
   ( select rodteprate from zrodtepmaser where material = (SELECT material FROM zexportdoc AS m WHERE m.billingdocument = a.salesdocument group by m.material ) ) as rodteprate,
   ( select sd_inrfob_value from zexportitem where lictype = 'DBK' and salesdocument = bill_doc_no ) as inrfob_value
    from zexportheader as a where salesdocument = bill_doc_no ) as tab1;


   return select  client as mandt,compcode, salesdocument ,eligible_dbk_amount ,eligible_rodtep_amount from :it_data;

  endmethod.
ENDCLASS.
