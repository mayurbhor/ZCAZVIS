
CLASS getdata DEFINITION.
  PUBLIC SECTION.
    TYPES: BEGIN OF ty_buffer.
             INCLUDE TYPE   zexportheadcds.
    TYPES:   flag TYPE c LENGTH 1,
           END OF ty_buffer.

    TYPES tdata TYPE TABLE OF ty_buffer .
    CLASS-DATA:ttdata TYPE tdata.

    TYPES: BEGIN OF ty_buffer1.
             INCLUDE TYPE   zexportitemcds.
    TYPES:   flag TYPE c LENGTH 1,
           END OF ty_buffer1.

    TYPES tdataitem TYPE TABLE OF ty_buffer1 .
    CLASS-DATA:ttdataitem TYPE tdataitem.


    TYPES: BEGIN OF ty_buffer2.
             INCLUDE TYPE   zexportdoccds.
    TYPES:   flag TYPE c LENGTH 1,
           END OF ty_buffer2.

    TYPES tdatadoc TYPE TABLE OF ty_buffer2 .
    CLASS-DATA:ttdatadoc TYPE tdatadoc.
ENDCLASS.
*CLASS lhc_zexportdoccds DEFINITION INHERITING FROM cl_abap_behavior_handler.
*
*  PRIVATE SECTION.
*
*    METHODS update FOR MODIFY
*      IMPORTING docdata FOR UPDATE zexportdoccds.
*
*    METHODS delete FOR MODIFY
*      IMPORTING keys FOR DELETE zexportdoccds.
*
*    METHODS read FOR READ
*      IMPORTING keys FOR READ zexportdoccds RESULT result.
*
*    METHODS rba_Head FOR READ
*      IMPORTING keys_rba FOR READ zexportdoccds\_Head FULL result_requested RESULT result LINK association_links.
*
*ENDCLASS.
*
*CLASS lhc_zexportdoccds IMPLEMENTATION.
*
*  METHOD update.
*    MOVE-CORRESPONDING docdata TO getdata=>ttdatadoc.
*    MOVE-CORRESPONDING docdata TO mapped-zexportdoccds.
*  ENDMETHOD.
*
*  METHOD delete.
*  ENDMETHOD.
*
*  METHOD read.
*  ENDMETHOD.
*
*  METHOD rba_Head.
*  ENDMETHOD.
*
*ENDCLASS.
*
*
*CLASS lhc_zexportheadcds DEFINITION INHERITING FROM cl_abap_behavior_handler.
*  PRIVATE SECTION.
*
*    METHODS get_instance_authorizations FOR INSTANCE AUTHORIZATION
*      IMPORTING keys REQUEST requested_authorizations FOR zexportheadcds RESULT result.
*
*    METHODS create FOR MODIFY
*      IMPORTING cdata FOR CREATE zexportheadcds.
*
*    METHODS update FOR MODIFY
*      IMPORTING udata FOR UPDATE zexportheadcds.
*
*    METHODS delete FOR MODIFY
*      IMPORTING keys FOR DELETE zexportheadcds.
*
*    METHODS read FOR READ
*      IMPORTING keys FOR READ zexportheadcds RESULT result.
*
*    METHODS rba_Item FOR READ
*      IMPORTING keys_rba FOR READ zexportheadcds\_Item FULL result_requested RESULT result LINK association_links.
*
*    METHODS cba_Item FOR MODIFY
*      IMPORTING citem FOR CREATE zexportheadcds\_Item.
*
*ENDCLASS.
*
*CLASS lhc_zexportheadcds IMPLEMENTATION.
*
*  METHOD get_instance_authorizations.
*  ENDMETHOD.
*
*  METHOD create.
*    DATA:wfail LIKE LINE OF  failed-zexportheadcds,
*         map   LIKE mapped-zexportheadcds,
*         gt    LIKE getdata=>ttdata.
*
*    MOVE-CORRESPONDING cdata TO mapped-zexportheadcds.
**        map-sion = number+10(10).
*    MOVE-CORRESPONDING cdata TO getdata=>ttdata.
**        gt-sion = number+10(10).
**    APPEND map TO mapped-zsionmain.
**    APPEND gt TO getdata=>ttdata.
*  ENDMETHOD.
*
*  METHOD update.
*  ENDMETHOD.
*
*  METHOD delete.
*  ENDMETHOD.
*
*  METHOD read.
*  ENDMETHOD.
*
*  METHOD rba_Item.
*  ENDMETHOD.
*
*  METHOD cba_Item.
*    DATA:gt LIKE LINE OF getdata=>ttdataitem.
*    LOOP AT citem INTO DATA(ct1).
*      LOOP AT ct1-%target INTO DATA(ct).
*        MOVE-CORRESPONDING ct TO gt.
*        APPEND gt TO getdata=>ttdataitem.
*      ENDLOOP.
*    ENDLOOP.
*  ENDMETHOD.
*
*ENDCLASS.
*
*CLASS lhc_zexportitemcds DEFINITION INHERITING FROM cl_abap_behavior_handler.
*  PRIVATE SECTION.
*
*    METHODS update FOR MODIFY
*      IMPORTING entities FOR UPDATE zexportitemcds.
*
*    METHODS delete FOR MODIFY
*      IMPORTING keys FOR DELETE zexportitemcds.
*
*    METHODS read FOR READ
*      IMPORTING keys FOR READ zexportitemcds RESULT result.
*
*    METHODS rba_Head FOR READ
*      IMPORTING keys_rba FOR READ zexportitemcds\_Head FULL result_requested RESULT result LINK association_links.
*
*ENDCLASS.
*
*CLASS lhc_zexportitemcds IMPLEMENTATION.
*
*  METHOD update.
*  ENDMETHOD.
*
*  METHOD delete.
*  ENDMETHOD.
*
*  METHOD read.
*  ENDMETHOD.
*
*  METHOD rba_Head.
*  ENDMETHOD.
*
*ENDCLASS.
*
*CLASS lsc_ZEXPORTHEADCDS DEFINITION INHERITING FROM cl_abap_behavior_saver.
*  PROTECTED SECTION.
*
*    METHODS finalize REDEFINITION.
*
*    METHODS check_before_save REDEFINITION.
*
*    METHODS save REDEFINITION.
*
*    METHODS cleanup REDEFINITION.
*
*    METHODS cleanup_finalize REDEFINITION.
*
*ENDCLASS.
*
*CLASS lsc_ZEXPORTHEADCDS IMPLEMENTATION.
*
*  METHOD finalize.
*  ENDMETHOD.
*
*  METHOD check_before_save.
*  ENDMETHOD.
*
*  METHOD save.
*    DATA:tad   TYPE TABLE OF zexportheader,
*         titem TYPE TABLE OF zexportitem,
*         tdoc  TYPE TABLE OF zexportdoc.
*    MOVE-CORRESPONDING getdata=>ttdata TO tad.
*    MODIFY zexportheader FROM TABLE @tad.
*
*    MOVE-CORRESPONDING getdata=>ttdataitem TO titem.
*    MODIFY zexportitem FROM TABLE @titem.
*
*    MOVE-CORRESPONDING getdata=>ttdatadoc TO tdoc.
*    MODIFY zexportdoc FROM TABLE @tdoc.
*  ENDMETHOD.
*
*  METHOD cleanup.
*  ENDMETHOD.
*
*  METHOD cleanup_finalize.
*  ENDMETHOD.
*
*ENDCLASS.
******************************************
CLASS lhc_zexportheadcds DEFINITION INHERITING FROM cl_abap_behavior_handler.
  PRIVATE SECTION.

    METHODS get_instance_authorizations FOR INSTANCE AUTHORIZATION
      IMPORTING keys REQUEST requested_authorizations FOR zexportheadcds RESULT result.

    METHODS create FOR MODIFY
      IMPORTING cdata FOR CREATE zexportheadcds.

    METHODS update FOR MODIFY
      IMPORTING entities FOR UPDATE zexportheadcds.

    METHODS delete FOR MODIFY
      IMPORTING keys FOR DELETE zexportheadcds.

    METHODS read FOR READ
      IMPORTING keys FOR READ zexportheadcds RESULT result.

    METHODS rba_Doc FOR READ
      IMPORTING vitem FOR READ zexportheadcds\_Doc FULL result_requested RESULT result LINK association_links.

    METHODS rba_Item FOR READ
      IMPORTING citem FOR READ zexportheadcds\_Item FULL result_requested RESULT result LINK association_links.

    METHODS cba_Doc FOR MODIFY
      IMPORTING vitem FOR CREATE zexportheadcds\_Doc.

    METHODS cba_Item FOR MODIFY
      IMPORTING citem FOR CREATE zexportheadcds\_Item.

ENDCLASS.

CLASS lhc_zexportheadcds IMPLEMENTATION.

  METHOD get_instance_authorizations.
  ENDMETHOD.

  METHOD create.
    DATA:wfail LIKE LINE OF  failed-zexportheadcds,
         map   LIKE mapped-zexportheadcds,
         gt    LIKE getdata=>ttdata.

    MOVE-CORRESPONDING cdata TO mapped-zexportheadcds.
*        map-sion = number+10(10).
    MOVE-CORRESPONDING cdata TO getdata=>ttdata.
  ENDMETHOD.

  METHOD update.
  ENDMETHOD.

  METHOD delete.
  ENDMETHOD.

  METHOD read.
  ENDMETHOD.

  METHOD rba_Doc.

  ENDMETHOD.

  METHOD rba_Item.

  ENDMETHOD.

  METHOD cba_Doc.
    DATA:gt LIKE LINE OF getdata=>ttdatadoc.
    LOOP AT vitem INTO DATA(ct1).
      LOOP AT ct1-%target INTO DATA(ct).
        MOVE-CORRESPONDING ct TO gt.
        APPEND gt TO getdata=>ttdatadoc.
      ENDLOOP.
    ENDLOOP.
  ENDMETHOD.

  METHOD cba_Item.
    DATA:gt LIKE LINE OF getdata=>ttdataitem.
    LOOP AT citem INTO DATA(ct1).
      LOOP AT ct1-%target INTO DATA(ct).
        MOVE-CORRESPONDING ct TO gt.
        APPEND gt TO getdata=>ttdataitem.
      ENDLOOP.
    ENDLOOP.

  ENDMETHOD.

ENDCLASS.

CLASS lhc_zexportitemcds DEFINITION INHERITING FROM cl_abap_behavior_handler.
  PRIVATE SECTION.

    METHODS update FOR MODIFY
      IMPORTING entities FOR UPDATE zexportitemcds.

    METHODS delete FOR MODIFY
      IMPORTING keys FOR DELETE zexportitemcds.

    METHODS read FOR READ
      IMPORTING keys FOR READ zexportitemcds RESULT result.

    METHODS rba_Head FOR READ
      IMPORTING keys_rba FOR READ zexportitemcds\_Head FULL result_requested RESULT result LINK association_links.

ENDCLASS.

CLASS lhc_zexportitemcds IMPLEMENTATION.

  METHOD update.
  ENDMETHOD.

  METHOD delete.
  ENDMETHOD.

  METHOD read.
  ENDMETHOD.

  METHOD rba_Head.
  ENDMETHOD.

ENDCLASS.

CLASS lhc_zexportdoccds DEFINITION INHERITING FROM cl_abap_behavior_handler.
  PRIVATE SECTION.

    METHODS update FOR MODIFY
      IMPORTING entities FOR UPDATE zexportdoccds.

    METHODS delete FOR MODIFY
      IMPORTING keys FOR DELETE zexportdoccds.

    METHODS read FOR READ
      IMPORTING keys FOR READ zexportdoccds RESULT result.

    METHODS rba_Head FOR READ
      IMPORTING keys_rba FOR READ zexportdoccds\_Head FULL result_requested RESULT result LINK association_links.

ENDCLASS.

CLASS lhc_zexportdoccds IMPLEMENTATION.

  METHOD update.
  ENDMETHOD.

  METHOD delete.
  ENDMETHOD.

  METHOD read.
  ENDMETHOD.

  METHOD rba_Head.
  ENDMETHOD.

ENDCLASS.

CLASS lsc_ZEXPORTHEADCDS DEFINITION INHERITING FROM cl_abap_behavior_saver.
  PROTECTED SECTION.

    METHODS finalize REDEFINITION.

    METHODS check_before_save REDEFINITION.

    METHODS save REDEFINITION.

    METHODS cleanup REDEFINITION.

    METHODS cleanup_finalize REDEFINITION.

ENDCLASS.

CLASS lsc_ZEXPORTHEADCDS IMPLEMENTATION.

  METHOD finalize.
  ENDMETHOD.

  METHOD check_before_save.
  ENDMETHOD.

  METHOD save.
    DATA:tad   TYPE TABLE OF zexportheader,
         titem TYPE TABLE OF zexportitem,
         tdoc  TYPE TABLE OF zexportdoc.
    MOVE-CORRESPONDING getdata=>ttdata TO tad.
    MODIFY zexportheader FROM TABLE @tad.

    MOVE-CORRESPONDING getdata=>ttdataitem TO titem.
    MODIFY zexportitem FROM TABLE @titem.

    MOVE-CORRESPONDING getdata=>ttdatadoc TO tdoc.
    MODIFY zexportdoc FROM TABLE @tdoc.
  ENDMETHOD.

  METHOD cleanup.
  ENDMETHOD.

  METHOD cleanup_finalize.
  ENDMETHOD.

ENDCLASS.
