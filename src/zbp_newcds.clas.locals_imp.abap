CLASS lhc_znewcds DEFINITION INHERITING FROM cl_abap_behavior_handler.
  PRIVATE SECTION.

    METHODS get_instance_authorizations FOR INSTANCE AUTHORIZATION
      IMPORTING keys REQUEST requested_authorizations FOR znewcds RESULT result.

    METHODS earlynumbering_create FOR NUMBERING
      IMPORTING entities FOR CREATE znewcds.

ENDCLASS.

CLASS lhc_znewcds IMPLEMENTATION.

  METHOD get_instance_authorizations.
  ENDMETHOD.

  METHOD earlynumbering_create.
    DATA:t LIKE LINE OF  mapped-znewcds.
    LOOP  AT entities ASSIGNING FIELD-SYMBOL(<w>) .
      MOVE-CORRESPONDING <w> TO t.
      t-char1 = 111.
      t-num1 = 11.
      APPEND t TO mapped-znewcds.
*      w-%cid-
*mapped-znewcds
*      MOVE-CORRESPONDING <w>-%data TO mapped-znewcds.
    ENDLOOP.
*    MOVE-CORRESPONDING entities TO mapped-znewcds.
  ENDMETHOD.

ENDCLASS.
