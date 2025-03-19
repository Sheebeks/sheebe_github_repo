CLASS zcl_mt_sh_amdp_mrp DEFINITION
  PUBLIC
  FINAL
  CREATE PUBLIC .

  PUBLIC SECTION.
    INTERFACES if_oo_adt_classrun.
    INTERFACES if_amdp_marker_hdb .
    class-METHODS get_prod_mrp IMPORTING
                                    VALUE(i_tax) TYPE i
                               EXPORTING
                                    VALUE(otab) TYPE ZMT_SH_TT_PROD_MRP.
  PROTECTED SECTION.
  PRIVATE SECTION.
ENDCLASS.



CLASS zcl_mt_sh_amdp_mrp IMPLEMENTATION.
  METHOD if_oo_adt_classrun~main.
    zcl_mt_sh_amdp_mrp=>get_prod_mrp(
     EXPORTING
       i_tax = 12
     IMPORTING
       otab  = data(itab)
   ).
   out->write(
     EXPORTING
       data   = itab
*        name   =
*      RECEIVING
*        output =
   ).
  ENDMETHOD.

  METHOD get_prod_mrp BY DATABASE PROCEDURE FOR HDB LANGUAGE SQLSCRIPT
                           options read-only
                              USING ZMT_SH_PRODUCT.
*   declare variables
   declare lv_Count integer;
   declare i integer;
   declare lv_mrp bigint;
   declare lv_price_d integer;
*   get all the products in a implicit table (like a internal table in abap)
   lt_prod = select * from zmt_sh_product;
*   get the record count of the table records
   lv_count := record_count( :lt_prod );
*   loop at each record one by one and calculate the price after discount (dbtable)
   for i in 1..:lv_count do
*   calculate the MRP based on input tax
       lv_price_d := :lt_prod.price[i] * ( 100 - :lt_prod.discount[i] ) / 100;
       lv_mrp := :lv_price_d * ( 100 + :i_tax ) / 100;
*   if the MRP is more than 15k, an additional 10% discount to be applied
       if lv_mrp > 15000 then
           lv_mrp := :lv_mrp * 0.90;
       END IF ;
*   fill the otab for result (like in abap we fill another internal table with data)
       :otab.insert( (
                         :lt_prod.name[i],
                         :lt_prod.category[i],
                         :lt_prod.price[i],
                         :lt_prod.currency[i],
                         :lt_prod.discount[i],
                         :lv_price_d,
                         :lv_mrp
                     ), i );
   END FOR ;
 ENDMETHOD.

ENDCLASS.
