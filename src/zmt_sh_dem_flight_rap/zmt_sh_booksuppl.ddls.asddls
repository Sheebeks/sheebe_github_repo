@AbapCatalog.viewEnhancementCategory: [#NONE]
@AccessControl.authorizationCheck: #NOT_REQUIRED
@EndUserText.label: 'Booking supplement child'
@Metadata.ignorePropagatedAnnotations: true
@ObjectModel.usageType:{
    serviceQuality: #X,
    sizeCategory: #S,
    dataClass: #MIXED
}
define view entity ZMT_SH_BOOKSUPPL as select from /dmo/booksuppl_m

association to parent ZMT_SH_BOOKING as _Booking on
   $projection.BookingId = _Booking.BookingId and
   $projection.TravelId = _Booking.TravelId
   
association[1..1] to ZMT_SH_TRAVEL as _Travel on
   $projection.TravelId = _Travel.TravelId
association[1..1] to /DMO/I_Supplement as _Product on
   $projection.SupplementId = _Product.SupplementID
association[1..*] to /DMO/I_SupplementText as _SupplementText on
   $projection.SupplementId = _SupplementText.SupplementID 
{
   key /dmo/booksuppl_m.travel_id as TravelId,
   key /dmo/booksuppl_m.booking_id as BookingId,
   key /dmo/booksuppl_m.booking_supplement_id as BookingSupplementId,
   /dmo/booksuppl_m.supplement_id as SupplementId,
   @Semantics.amount.currencyCode: 'CurrencyCode'
   /dmo/booksuppl_m.price as Price,
   /dmo/booksuppl_m.currency_code as CurrencyCode,
   @Semantics.systemDateTime.lastChangedAt: true
   /dmo/booksuppl_m.last_changed_at as LastChangedAt,
   _Travel,
   _Product,
   _SupplementText,
   _Booking 
}
