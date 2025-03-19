@AbapCatalog.viewEnhancementCategory: [#NONE]
@AccessControl.authorizationCheck: #NOT_REQUIRED
@EndUserText.label: 'Booking entity as child node'
@Metadata.ignorePropagatedAnnotations: true
@ObjectModel.usageType:{
    serviceQuality: #X,
    sizeCategory: #S,
    dataClass: #MIXED
}
define view entity ZMT_SH_BOOKING as select from /dmo/booking_m

composition[0..*] of ZMT_SH_BOOKSUPPL as _BookingSupplement
association to parent ZMT_SH_TRAVEL as _Travel on
   $projection.TravelId = _Travel.TravelId
   
association[1..1] to /DMO/I_Customer as _Customer on
   $projection.CustomerId = _Customer.CustomerID
association[1..1] to /DMO/I_Carrier as _Carrier on
   $projection.CarrierId = _Carrier.AirlineID
association[1..1] to /DMO/I_Connection as _Connection on
   $projection.CarrierId = _Connection.AirlineID and
   $projection.ConnectionId = _Connection.ConnectionID
association[1..1] to /DMO/I_Booking_Status_VH as _BookingStatus on
   $projection.BookingStatus = _BookingStatus.BookingStatus
{
    key /dmo/booking_m.travel_id as TravelId,
    key /dmo/booking_m.booking_id as BookingId,
    /dmo/booking_m.booking_date as BookingDate,
    @Consumption.valueHelpDefinition: [
   { entity: {
               name: '/DMO/I_Customer',
               element: 'CustomerID'
       } }
   ]
    /dmo/booking_m.customer_id as CustomerId,
    @Consumption.valueHelpDefinition: [
   { entity: {
               name: '/DMO/I_Carrier',
               element: 'AirlineID'
       } }
   ]
    /dmo/booking_m.carrier_id as CarrierId,
   @Consumption.valueHelpDefinition: [
   { entity: {
               name: '/DMO/I_Connection',
               element: 'ConnectionID'
       },additionalBinding: [{
           element: 'AirlineID', localElement: 'CarrierId'
       }] }
   ]
    /dmo/booking_m.connection_id as ConnectionId,
   @Consumption.valueHelpDefinition: [
   { entity: {
               name: '/DMO/I_Flight',
               element: 'CustomerID'
       },additionalBinding: [{
           element: 'AirlineID', localElement: 'CarrierId'
       },{
           element: 'ConnectionID', localElement: 'ConnectionId'
       }] }
   ]
    /dmo/booking_m.flight_date as FlightDate,
    @Semantics.amount.currencyCode: 'CurrencyCode'
    /dmo/booking_m.flight_price as FlightPrice,
    /dmo/booking_m.currency_code as CurrencyCode,
    @Consumption.valueHelpDefinition: [
   { entity: {
               name: '/DMO/I_Booking_Status_VH',
               element: 'BookingStatus'
       } }
   ]
   /dmo/booking_m.booking_status as BookingStatus,
    @Semantics.systemDateTime.lastChangedAt: true
    /dmo/booking_m.last_changed_at as LastChangedAt,
    /*Expose associations*/
   _Customer,
   _Carrier,
   _Connection,
   _BookingStatus,
   _BookingSupplement,
   _Travel
}
