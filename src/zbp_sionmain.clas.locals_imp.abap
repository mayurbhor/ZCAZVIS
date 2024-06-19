CLASS getdata DEFINITION.
  PUBLIC SECTION.
    TYPES: BEGIN OF ty_buffer.
             INCLUDE TYPE   zsionhead.
    TYPES:   flag TYPE c LENGTH 1,
           END OF ty_buffer.

    TYPES tdata TYPE TABLE OF ty_buffer .
    CLASS-DATA:ttdata TYPE tdata.

    TYPES: BEGIN OF ty_buffer1.
             INCLUDE TYPE   zsionitemcds.
    TYPES:   flag TYPE c LENGTH 1,
           END OF ty_buffer1.

    TYPES tdataitem TYPE TABLE OF ty_buffer1 .
    CLASS-DATA:ttdataitem TYPE tdataitem.
ENDCLASS.
CLASS lhc_zsionmain DEFINITION INHERITING FROM cl_abap_behavior_handler.
  PRIVATE SECTION.

    METHODS get_instance_authorizations FOR INSTANCE AUTHORIZATION
      IMPORTING keys REQUEST requested_authorizations FOR zsionmain RESULT result.

    METHODS create FOR MODIFY
      IMPORTING cdata FOR CREATE zsionmain.

    METHODS update FOR MODIFY
      IMPORTING entities FOR UPDATE zsionmain.

    METHODS delete FOR MODIFY
      IMPORTING keys FOR DELETE zsionmain.

    METHODS read FOR READ
      IMPORTING keys FOR READ zsionmain RESULT result.

    METHODS rba_item FOR READ
      IMPORTING keys_rba FOR READ zsionmain\_item FULL result_requested RESULT result LINK association_links.

    METHODS cba_item FOR MODIFY
      IMPORTING item FOR CREATE zsionmain\_item.

ENDCLASS.

CLASS lhc_zsionmain IMPLEMENTATION.

  METHOD get_instance_authorizations.
  ENDMETHOD.

  METHOD create.
    DATA: number TYPE cl_numberrange_runtime=>nr_number,
          wfail  LIKE LINE OF  failed-zsionmain,
          map    LIKE LINE OF mapped-zsionmain,
          gt     LIKE LINE OF getdata=>ttdata.

*
    LOOP  AT cdata ASSIGNING FIELD-SYMBOL(<cd>).
      SELECT SINGLE * FROM zsionhead  WHERE compcode = @<cd>-compcode AND
      material = @<cd>-material INTO @DATA(st).
      IF sy-subrc NE 0.
        TRY.
            cl_numberrange_runtime=>number_get(  EXPORTING nr_range_nr = '01' object = 'ZSION' IMPORTING number = number ).
*            <cd>-sion = number.
            MOVE-CORRESPONDING <cd> TO map.
            map-sion = number+10(10).
            MOVE-CORRESPONDING <cd> TO gt.
            gt-sion = number+10(10).
            APPEND map TO mapped-zsionmain.
            APPEND gt TO getdata=>ttdata.
          CATCH cx_number_ranges.
            "handle exception
        ENDTRY.
      ELSE.
        MOVE-CORRESPONDING <cd> TO map.
*        MOVE-CORRESPONDING <cd> TO map.
        map-sion = st-sion .
        MOVE-CORRESPONDING <cd> TO gt.
        gt-sion = st-sion.
        APPEND map TO mapped-zsionmain.
*        append map to failed-zsionmain.
        APPEND gt TO getdata=>ttdata.
*        MOVE-CORRESPONDING <cd> TO wfail.
*        APPEND wfail TO failed-zsionmain.
      ENDIF.
    ENDLOOP.

  ENDMETHOD.

  METHOD update.
  ENDMETHOD.

  METHOD delete.
*  delete zsionhead where .
  ENDMETHOD.

  METHOD read.
  ENDMETHOD.

  METHOD rba_item.
  ENDMETHOD.

  METHOD cba_item.
    DATA:gti LIKE LINE OF getdata=>ttdataitem.
    LOOP AT getdata=>ttdata INTO DATA(gt1).
      LOOP AT item ASSIGNING FIELD-SYMBOL(<it1>).
*        <it1>-Sion = gt1-Sion.\
        LOOP AT <it1>-%target ASSIGNING FIELD-SYMBOL(<gtt>).
          MOVE-CORRESPONDING <gtt> TO gti.
          gti-sion = gt1-sion.
          APPEND gti TO getdata=>ttdataitem.
        ENDLOOP.
      ENDLOOP.
    ENDLOOP.
  ENDMETHOD.

ENDCLASS.

CLASS lhc_zsionitemcds DEFINITION INHERITING FROM cl_abap_behavior_handler.
  PRIVATE SECTION.

    METHODS update FOR MODIFY
      IMPORTING entities FOR UPDATE zsionitemcds.

    METHODS delete FOR MODIFY
      IMPORTING keys FOR DELETE zsionitemcds.

    METHODS read FOR READ
      IMPORTING keys FOR READ zsionitemcds RESULT result.

    METHODS rba_head FOR READ
      IMPORTING keys_rba FOR READ zsionitemcds\_head FULL result_requested RESULT result LINK association_links.

ENDCLASS.

CLASS lhc_zsionitemcds IMPLEMENTATION.

  METHOD update.
  ENDMETHOD.

  METHOD delete.
  ENDMETHOD.

  METHOD read.
  ENDMETHOD.

  METHOD rba_head.
  ENDMETHOD.

ENDCLASS.

CLASS lsc_zsionmain DEFINITION INHERITING FROM cl_abap_behavior_saver.
  PROTECTED SECTION.

    METHODS finalize REDEFINITION.

    METHODS check_before_save REDEFINITION.

    METHODS save REDEFINITION.

    METHODS cleanup REDEFINITION.

    METHODS cleanup_finalize REDEFINITION.
    METHODS adjust_numbers REDEFINITION.

ENDCLASS.

CLASS lsc_zsionmain IMPLEMENTATION.

  METHOD finalize.
  ENDMETHOD.

  METHOD check_before_save.
  ENDMETHOD.

  METHOD save.
    DATA:tad   TYPE TABLE OF zsionhead,
         titem TYPE TABLE OF zsionitem.
    MOVE-CORRESPONDING getdata=>ttdata TO tad.
    MODIFY zsionhead FROM TABLE @tad.

    MOVE-CORRESPONDING getdata=>ttdataitem TO titem.
    MODIFY zsionitem FROM TABLE @titem.
  ENDMETHOD.

  METHOD cleanup.
  ENDMETHOD.

  METHOD cleanup_finalize.
  ENDMETHOD.

  METHOD adjust_numbers.
    DATA: number TYPE cl_numberrange_runtime=>nr_number.
*          wfail  LIKE LINE OF  failed-zsionmain.
*    LOOP  AT getdata=>ttdata ASSIGNING FIELD-SYMBOL(<cd>).
*      SELECT SINGLE * FROM zsionhead  WHERE sion = @<cd>-sion AND compcode = @<cd>-compcode AND
*      material = @<cd>-material INTO @DATA(st).
*      IF sy-subrc NE 0.
*        TRY.
*            cl_numberrange_runtime=>number_get(  EXPORTING nr_range_nr = '01' object = 'ZSION' IMPORTING number = number ).
*            <cd>-sion = number.
*          CATCH cx_number_ranges.
*            "handle exception
*        ENDTRY.
*      ELSE.
*      ENDIF.
*    ENDLOOP.
  ENDMETHOD.

ENDCLASS.
