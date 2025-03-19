@AbapCatalog.viewEnhancementCategory: [#NONE]
@AccessControl.authorizationCheck: #NOT_REQUIRED
@EndUserText.label: 'PROCESSOR'
@Metadata.ignorePropagatedAnnotations: false
@ObjectModel.usageType:{
    serviceQuality: #X,
    sizeCategory: #S,
    dataClass: #MIXED
}
@Metadata.allowExtensions: true
define view entity ZMT_SH_M_ATTACH_PROCESSOR as projection on ZMT_SH_M_ATTACH
{
    key TravelId,
    key Id,
    Memo,
     @Semantics.largeObject: {
       mimeType: 'Filetype',
       fileName: 'Filename',
       contentDispositionPreference: #INLINE,
       acceptableMimeTypes: [ 'application/pdf' ]
   }
    Attachment,
    @Semantics.mimeType: true
    Filename,
    Filetype,
    LocalCreatedBy,
    LocalCreatedAt,
    LocalLastChangedBy,
    LocalLastChangedAt,
    LastChangedAt,
    /* Associations */
    _Travel: redirected to parent ZMT_SH_TRAVEL_PROCESSOR
}
