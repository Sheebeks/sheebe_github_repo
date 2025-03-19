@AbapCatalog.viewEnhancementCategory: [#NONE]
@AccessControl.authorizationCheck: #NOT_REQUIRED
@EndUserText.label: 'interface'
@Metadata.ignorePropagatedAnnotations: true
@ObjectModel.usageType:{
    serviceQuality: #X,
    sizeCategory: #S,
    dataClass: #MIXED
}
@VDM.viewType: #BASIC       //vdm is used for good practice
@Analytics.dataCategory: #DIMENSION     // data category is mentioned
define view entity Zmt_sh_I_BP as select from zmt_sh_bpa
{
    key bp_id as BpId,
    bp_role as BpRole,
    company_name as CompanyName,
    street as Street,
    country as Country,
    region as Region,
    city as City
}
