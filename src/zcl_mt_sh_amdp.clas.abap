CLASS zcl_mt_sh_amdp DEFINITION
  PUBLIC
  FINAL
  CREATE PUBLIC .

  PUBLIC SECTION.
    INTERFACES if_oo_adt_classrun.
    INTERFACES if_amdp_marker_hdb .
   CLASS-METHODS get_customer_by_id
   IMPORTING
       value(i_bp_id) TYPE zmt_sh_dte_id
    EXPORTING
       VALUE(e_res) TYPE string.

  PROTECTED SECTION.
  PRIVATE SECTION.
ENDCLASS.



CLASS zcl_mt_sh_amdp IMPLEMENTATION.
  METHOD if_oo_adt_classrun~main.

zcl_mt_sh_amdp=>get_customer_by_id(
     EXPORTING
       i_bp_id = 'CE0AC213BE7A1EDFBFC53B0E7AD65E6C'

     IMPORTING
       e_res   = data(result)
   ).
   out->write(
     EXPORTING
       data   = result
   ).
  ENDMETHOD.


METHOD get_customer_by_id by DATABASE PROCEDURE FOR HDB LANGUAGE SQLSCRIPT
 OPTIONS READ-ONLY using zmt_sh_bpa.
   select company_name into e_res from zmt_sh_bpa where bp_id = :i_bp_id;
 ENDMETHOD.

ENDCLASS.
