CLASS zcl_mt_sh_amdp_sales DEFINITION
  PUBLIC
  FINAL
  CREATE PUBLIC .

  PUBLIC SECTION.
      INTERFACES if_oo_adt_classrun.
      INTERFACES if_amdp_marker_hdb .
      CLASS-METHODS get_total_sales for table FUNCTION ZMT_sh_TF.
  PROTECTED SECTION.
  PRIVATE SECTION.
ENDCLASS.



CLASS zcl_mt_sh_amdp_sales IMPLEMENTATION.
  METHOD if_oo_adt_classrun~main.
*out->write(
*     EXPORTING
*       data   = itab
**        name   =
**      RECEIVING
**        output =
*   ).

  ENDMETHOD.

  METHOD get_total_sales by DATABASE FUNCTION FOR HDB LANGUAGE SQLSCRIPT OPTIONS READ-ONLY
  USING zMT_sh_bpa zMT_sh_so_hdr zMT_sh_so_item.
*   note here FUNCTION is used instead of PROCEDURE to indicate table function
return select
           bpa.client,
           bpa.company_name,
           sum( item.amount ) as total_sales,
           item.currency as currency_code,
           RANK ( ) OVER ( order by sum( item.amount ) desc ) as customer_rank
    from zMT_sh_bpa as bpa
   INNER join zMT_sh_so_hdr as sls
   on bpa.bp_id = sls.buyer
   inner join zMT_sh_so_item as item
   on sls.order_id = item.order_id
   group by bpa.client,
           bpa.company_name,
           item.currency ;


  ENDMETHOD.

ENDCLASS.
