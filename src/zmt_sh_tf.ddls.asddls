@EndUserText.label: 'cds table function'
define table function zmt_sh_tf
with parameters 
@Environment.systemField: #CLIENT
p_clnt : abap.clnt
returns {
  client : abap.clnt;
 company_name: abap.char(256);
 total_sales: abap.curr(15,2);
 currency_code: abap.cuky(5);
 customer_rank: abap.int4;  
}
implemented by method zcl_mt_sh_amdp_sales=>get_total_sales;
