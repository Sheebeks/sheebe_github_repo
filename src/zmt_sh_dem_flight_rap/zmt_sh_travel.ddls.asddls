@AccessControl.authorizationCheck: #NOT_REQUIRED
@EndUserText.label: 'Root Entity for my BO - travel'
@Metadata.ignorePropagatedAnnotations: true
define root view entity ZMT_SH_TRAVEL as select from /dmo/travel_m

--Composition child for travel viz booking
composition[0..*] of ZMT_SH_BOOKING as _Booking
--Composition child for travel viz booking
composition[0..*] of ZMT_SH_M_ATTACH as _Attachments
--associations - lose coupling to get dependent data
//composition of target_data_source_name as _association_name
association[1] to /DMO/I_Agency as _Agency on
   $projection.AgencyId = _Agency.AgencyID
association[1] to /DMO/I_Customer as _Customer on
   $projection.CustomerId = _Customer.CustomerID
association[1] to I_Currency as _Currency on
   $projection.CurrencyCode = _Currency.Currency
association[1..1] to /DMO/I_Overall_Status_VH as _OverallStatus on
   $projection.OverallStatus = _OverallStatus.OverallStatus
{
    key /dmo/travel_m.travel_id as TravelId,
    
     @Consumption.valueHelpDefinition: [
   { entity: {
//               name: '/DMO/I_Agency',
                name: 'ZMT_SH_AGENCY_ES5',
               element: 'AgencyID'
       } }
   ]
   @ObjectModel.text.element: [ 'AgencyName' ]
    /dmo/travel_m.agency_id as AgencyId,
    _Agency.Name as AgencyName,
   
   @Consumption.valueHelpDefinition: [
   { entity: {
               name: '/DMO/I_Customer',
               element: 'CustomerID'
       } }
   ]
   @ObjectModel.text.element: [ 'CustomerName' ]
    /dmo/travel_m.customer_id as CustomerId,
    _Customer.LastName as CustomerName,
    
    /dmo/travel_m.begin_date as BeginDate,
    /dmo/travel_m.end_date as EndDate,
    @Semantics.amount.currencyCode: 'CurrencyCode'
    /dmo/travel_m.booking_fee as BookingFee,
    @Semantics.amount.currencyCode: 'CurrencyCode'
    /dmo/travel_m.total_price as TotalPrice,
    /dmo/travel_m.currency_code as CurrencyCode,
    case overall_status
       when 'A' then 3
       when 'X' then 1
       else 2
        end as Criticality,
    /dmo/travel_m.description as Description,
    @Consumption.valueHelpDefinition: [
   { entity: {
               name: '/DMO/I_Overall_Status_VH',
               element: 'OverallStatus'
       } }
   ]
   @ObjectModel.text.element: [ 'Status' ]
    /dmo/travel_m.overall_status as OverallStatus,
    _OverallStatus._Text.Text as Status,
    @Semantics.user.createdBy: true
   created_by as CreatedBy,
   @Semantics.systemDateTime.createdAt: true
   created_at as CreatedAt,
   @Semantics.user.lastChangedBy: true
   last_changed_by as LastChangedBy,
   @Semantics.systemDateTime.lastChangedAt: true
   //Local ETag Field --> Odata Etag
   last_changed_at as LastChangedAt,
   /*Expose associations*/
   --_Booking,
   _Agency,
   _Customer,
   _Currency,
   _OverallStatus,
   _Booking,
   _Attachments
}
