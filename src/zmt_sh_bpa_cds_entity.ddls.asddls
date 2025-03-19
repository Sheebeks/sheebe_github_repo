@AbapCatalog.viewEnhancementCategory: [#NONE]
@AccessControl.authorizationCheck: #NOT_REQUIRED
@EndUserText.label: 'bpa cds entity'
@Metadata.ignorePropagatedAnnotations: true
@ObjectModel.usageType:{
    serviceQuality: #X,
    sizeCategory: #S,
    dataClass: #MIXED
}
define view entity ZMT_SH_bpa_cds_entity as select from zmt_sh_bpa
{
    key bp_id as BpId,
    bp_role as BpRole,
    company_name as CompanyName,
    street as Street,
    country as Country,
    region as Region,
    city as City
}
