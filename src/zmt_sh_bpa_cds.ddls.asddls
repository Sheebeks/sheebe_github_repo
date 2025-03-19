@AbapCatalog.sqlViewName: 'ZMTSHBPACDS'
@AbapCatalog.compiler.compareFilter: true
@AbapCatalog.preserveKey: true
@AccessControl.authorizationCheck: #NOT_REQUIRED
@EndUserText.label: 'business partner view'
@Metadata.ignorePropagatedAnnotations: true
define view ZMT_SH_bpa_cds as select from zmt_sh_bpa
{
   key bp_id as BpId,
   bp_role as BpRole,
   company_name as CompanyName,
   street as Street,
   country as Country,
   region as Region,
   city as City
}
