CLASS lhc_travel DEFINITION INHERITING FROM cl_abap_behavior_handler.
  PRIVATE SECTION.

    METHODS augment_create FOR MODIFY
      IMPORTING entities FOR CREATE travel.

    METHODS precheck_create FOR PRECHECK
      IMPORTING entities FOR CREATE travel.

    METHODS precheck_update FOR PRECHECK
      IMPORTING entities FOR UPDATE travel.

ENDCLASS.

CLASS lhc_travel IMPLEMENTATION.

  METHOD augment_create.
  data: travel_create type table for create zmt_sh_travel.
    travel_create = CORRESPONDING #( entities ).
    loop at travel_create assigning field-symbol(<travel>).
       <travel>-AgencyId = '70003'.
       <travel>-OverallStatus = 'O'.
       <travel>-%control-AgencyId = if_abap_behv=>mk-on.
       <travel>-%control-OverallStatus = if_abap_behv=>mk-on.
    ENDLOOP.
    MODIFY augmenting entities of zmt_sh_travel
    entity travel
    create from travel_create.
  ENDMETHOD.

  METHOD precheck_create.
  ENDMETHOD.

  METHOD precheck_update.
  ENDMETHOD.

ENDCLASS.
