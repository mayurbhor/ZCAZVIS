CLASS zex_inv_cal1 DEFINITION
  PUBLIC
  FINAL
  CREATE PUBLIC .

  PUBLIC SECTION.
    INTERFACES :if_amdp_marker_hdb,if_rap_query_provider ,if_rap_query_response..

    TYPES : BEGIN OF ty_inv_cal,
*              mandt                  TYPE char4,
              compcode               TYPE char10,
              salesdocument          TYPE char40,
*              mat_doc                TYPE char40,
*              dbkrate                TYPE char10,
              eligible_dbk_amount    TYPE char10,
*              rodteprate             TYPE char10,
              eligible_rodtep_amount TYPE char10,
*              inrfob_value           TYPE char10,

            END OF ty_inv_cal.

    TYPES it_inv_cal TYPE STANDARD TABLE OF ty_inv_cal WITH DEFAULT KEY.
    CLASS-METHODS get_data1
*     FOR TABLE FUNCTION zlicamount1
      IMPORTING
        VALUE(bill_doc_no) TYPE string
      EXPORTING
        VALUE(it_data)     TYPE it_inv_cal .
    .
  PROTECTED SECTION.
  PRIVATE SECTION.
ENDCLASS.



CLASS ZEX_INV_CAL1 IMPLEMENTATION.


  METHOD get_data1 BY DATABASE PROCEDURE FOR HDB LANGUAGE SQLSCRIPT OPTIONS READ-ONLY USING zexportheader zexportdoc zdbkmaster zexportitem zrodtepmaser.

    it_data1 =    select compcode,salesdocument,mat_doc,dbkrate,
       cast((cast((CASE when dbkrate='' THEN '0' ELSE dbkrate end) AS float ) * cast((CASE when inrfob_value='' THEN '0' ELSE inrfob_value end) AS float ) / 100) AS decimal(10,2))  AS eligible_dbk_amount ,
       rodteprate,
       cast((cast((CASE when rodteprate='' THEN '0' ELSE rodteprate END ) AS float ) * cast((CASE when inrfob_value='' THEN '0' ELSE inrfob_value end) AS float ) / 100) AS decimal(10,2))  AS eligible_rodtep_amount,
        (CASE when inrfob_value='' THEN '0.00' ELSE inrfob_value END ) AS inrfob_value  FROM (  SELECT a.compcode,a.salesdocument,
      (SELECT material FROM zexportdoc AS m WHERE m.billingdocument = a.salesdocument group by m.material ) as mat_doc,
      (SELECT dbkrate FROM zdbkmaster AS dbk WHERE dbk.material = (SELECT material FROM zexportdoc AS m WHERE m.billingdocument = a.salesdocument group by m.material ) ) as dbkrate,
      ( select rodteprate from zrodtepmaser where material = (SELECT material FROM zexportdoc AS m WHERE m.billingdocument = a.salesdocument group by m.material ) ) as rodteprate,
      ( select sd_inrfob_value from zexportitem where lictype = 'DBK' and salesdocument = bill_doc_no ) as inrfob_value
       from zexportheader as a where salesdocument = bill_doc_no ) as tab1;


      it_data =  select  compcode, salesdocument ,eligible_dbk_amount ,eligible_rodtep_amount from :it_data1;

  ENDMETHOD.


  METHOD if_rap_query_provider~select.
    DATA:tgate TYPE STANDARD TABLE OF z20.

    DATA(off) = io_request->get_paging( )->get_offset(  ).
    DATA(pag) = io_request->get_paging( )->get_page_size( ).
    DATA(lv_max_rows) = COND #( WHEN pag = if_rap_query_paging=>page_size_unlimited THEN 0
                                ELSE pag ).
    DATA(lsort) = io_request->get_sort_elements( ) .
*    data(page) = io_request->

    DATA(set) = io_request->get_requested_elements( )."  --> could be used for optimizations
    DATA(lvs) = io_request->get_search_expression( ).
    DATA(filter1) = io_request->get_filter(  ).
    DATA(p1) = io_request->get_parameters(  ).
    DATA(p2) = io_request->get_requested_elements(  ).
    DATA(rng) = filter1->get_as_ranges(   ).

    DATA(str) = filter1->get_as_sql_string(  ).
*    SELECT billingdocument ,billingdocumentitem FROM I_BillingDocumentItem ORDER BY billingdocument  INTO TABLE @tgate
*    OFFSET @off UP TO @lv_max_rows ROWS  ..

    zex_inv_cal1=>get_data1( EXPORTING bill_doc_no = :str IMPORTING it_data = DATA(tab) ).
*    io_response->
    io_response->set_data( tab ).
    io_response->set_total_number_of_records( 1000 ).
  ENDMETHOD.
ENDCLASS.
