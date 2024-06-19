CLASS lhc_zadvlicappheadcds DEFINITION INHERITING FROM cl_abap_behavior_handler.
  PRIVATE SECTION.

    METHODS get_instance_authorizations FOR INSTANCE AUTHORIZATION
      IMPORTING keys REQUEST requested_authorizations FOR zadvlicappheadcds RESULT result.

    METHODS earlynumbering_create FOR NUMBERING
      IMPORTING tdata FOR CREATE zadvlicappheadcds.

ENDCLASS.

CLASS lhc_zadvlicappheadcds IMPLEMENTATION.

  METHOD get_instance_authorizations.
  ENDMETHOD.

  METHOD earlynumbering_create.
    DATA:number TYPE cl_numberrange_runtime=>nr_number.
    LOOP AT tdata INTO DATA(td).
      SELECT SINGLE * FROM zadvlicapp  WHERE sion_no = @td-sion_no INTO @DATA(adv).
      IF sy-subrc NE 0.
        TRY.
            cl_numberrange_runtime=>number_get(  EXPORTING nr_range_nr = '01' object = 'ZAPP_NO' IMPORTING number = number ).
            MOVE-CORRESPONDING tdata TO mapped-zadvlicappheadcds.
            LOOP AT mapped-zadvlicappheadcds ASSIGNING FIELD-SYMBOL(<r>).
              <r>-application_no = number.
            ENDLOOP.
            LOOP AT mapped-zadvlicappitemcds ASSIGNING FIELD-SYMBOL(<r1>) ."WHERE sion_no = <r>-sion_no.
              <r1>-application_no = number.
            ENDLOOP.
          CATCH cx_number_ranges.
            "handle exception
        ENDTRY.
      ELSE.
        MOVE-CORRESPONDING tdata TO mapped-zadvlicappheadcds.
        LOOP AT mapped-zadvlicappheadcds ASSIGNING FIELD-SYMBOL(<r12>).
          <r12>-application_no = adv-application_no.
        ENDLOOP.
        LOOP AT mapped-zadvlicappitemcds ASSIGNING FIELD-SYMBOL(<r11>) ."WHERE sion_no = <r>-sion_no.
          <r11>-application_no = adv-application_no.
        ENDLOOP.
      ENDIF.
    ENDLOOP.
  ENDMETHOD.

ENDCLASS.
