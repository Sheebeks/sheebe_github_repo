@AbapCatalog.viewEnhancementCategory: [#NONE]
@AccessControl.authorizationCheck: #NOT_REQUIRED
@EndUserText.label: 'Sales Basic, Interface'
@Metadata.ignorePropagatedAnnotations: true
@ObjectModel.usageType:{
    serviceQuality: #X,
    sizeCategory: #S,
    dataClass: #MIXED
}
@VDM.viewType: #BASIC   // vdm for good practice
@Analytics.dataCategory: #FACT  // data category mentioned
define view entity ZI_MT_I_SH_SALES as select from zmt_sh_so_hdr  as hdr
association[1..*] to zmt_sh_so_item as _Items on
$projection.OrderId = _Items.order_id
{
    key hdr.order_id as OrderId,
   hdr.order_no as OrderNo,
   hdr.buyer as Buyer,
   hdr.created_by as CreatedBy,
   hdr.created_on as CreatedOn,
   ---exposed association - read data at Runtime
   _Items  
}
