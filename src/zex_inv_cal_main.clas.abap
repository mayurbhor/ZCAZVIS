CLASS zex_inv_cal_main DEFINITION
  PUBLIC
  FINAL
  CREATE PUBLIC .

  PUBLIC SECTION.
    INTERFACES if_oo_adt_classrun .


  PROTECTED SECTION.
  PRIVATE SECTION.
ENDCLASS.



CLASS ZEX_INV_CAL_MAIN IMPLEMENTATION.


  METHOD if_oo_adt_classrun~main.
    DATA:payload TYPE string.
    TYPES : BEGIN OF ty_inv_cal,
              compcode      TYPE char10,
              salesdocument TYPE char40,
              mat_doc       TYPE char40,
              dbkrate       TYPE char10,
              ELIGIBLE_DBK_AMOUNT TYPE char10,
              rodteprate    TYPE char10,
              ELIGIBLE_RODTEP_AMOUNT TYPE char10,
              inrfob_value  TYPE char10,
            END OF ty_inv_cal.

    DATA : it_result TYPE STANDARD TABLE OF ty_inv_cal INITIAL SIZE 0.

    DATA: lt_my_table TYPE TABLE OF ty_inv_cal.

*    CALL METHOD zex_inv_cal=>get_data(
*      EXPORTING
*        bill_doc_no = '90000223'
*      IMPORTING
*        it_data     = it_result
*    ).
    out->write( it_result ).

*    LOOP AT IT_RESULT INTO DATA(demo).
*
*   out->write( demo-compcode ).
*    out->write( demo-mat_doc ).
*
*
*
*    ENDLOOP.

  ENDMETHOD.
ENDCLASS.
