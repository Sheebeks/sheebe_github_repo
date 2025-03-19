@AbapCatalog.viewEnhancementCategory: [#NONE]
@AccessControl.authorizationCheck: #NOT_REQUIRED
@EndUserText.label: 'product dimension basic interface'
@Metadata.ignorePropagatedAnnotations: true
@ObjectModel.usageType:{
    serviceQuality: #X,
    sizeCategory: #S,
    dataClass: #MIXED
}
@VDM.viewType: #BASIC   // vdm for good practice
@Analytics.dataCategory: #DIMENSION // data category mentioned
define view entity ZI_MT_I_SH_PRODUCT as select from zmt_sh_product
{
    key product_id as ProductId,
    name as Name,
    category as Category,
    --@Semantics.amount.currencyCode: 'Currency'
    price as Price,
    currency as Currency,
    discount as Discount
}
