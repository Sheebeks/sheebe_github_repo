@AccessControl.authorizationCheck: #NOT_REQUIRED
@EndUserText.label: 'Booking processor projection'
@Metadata.ignorePropagatedAnnotations: false
@Metadata.allowExtensions: true
define view entity ZMT_SH_BOOKING_PROCESSOR as projection on ZMT_SH_BOOKING
{
    key TravelId,
    key BookingId,
    BookingDate,
    CustomerId,
    CarrierId,
    ConnectionId,
    FlightDate,
    FlightPrice,
    CurrencyCode,
    BookingStatus,
    LastChangedAt,
    /* Associations */
    _BookingStatus,
    _BookingSupplement: redirected to composition child ZMT_SH_BOOKSUPPL_PROCESSOR,
    _Carrier,
    _Connection,
    _Customer,
    _Travel: redirected to parent ZMT_SH_TRAVEL_PROCESSOR
}
