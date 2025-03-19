CLASS zcl_sel_screen_travel_sh DEFINITION
  PUBLIC

  FINAL
  CREATE PUBLIC .

  PUBLIC SECTION.
  METHODS: display_screen,
             process_input.
  PROTECTED SECTION.
  PRIVATE SECTION.
    DATA: lv_input TYPE string.
ENDCLASS.



CLASS zcl_sel_screen_travel_sh IMPLEMENTATION.
  METHOD display_screen.
*    SELECTION-SCREEN BEGIN OF SCREEN 100.
*    PARAMETERS: p_input TYPE string.
*    SELECTION-SCREEN END OF SCREEN 100.

*    CALL SELECTION-SCREEN 100 STARTING AT 10 10.
*    lv_input = p_input.
  ENDMETHOD.

  METHOD process_input.
    " Process the input value
*    WRITE: / 'You entered:', lv_input.
  ENDMETHOD.

ENDCLASS.
*
*START-OF-SELECTION.
*  DATA: lo_screen TYPE REF TO lcl_selection_screen.
*  CREATE OBJECT lo_screen.
*  lo_screen->display_screen( ).
*  lo_screen->process_input( ).
