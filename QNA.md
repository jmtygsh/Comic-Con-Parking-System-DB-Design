## Questions & Answers

### What vehicles entered the parking facility?
- Stored in `parking_session` → linked with `vehicle` and `vehical_type` store vehical information.

### What type of vehicle entered?
- From `vehicle.vehicle_type_id` → `vehicle_type`.

### Which parking spot was assigned?
- From `parking_session.parking_spot_id`

### Which zone or level does that parking spot belong to?
- `parking_spot.zone_id` → `parking_zone (name, level)`

### Was the parking spot reserved for VIP / staff / EV?
- `parking_spot.spot_category_id` → `parking_spot_category`

### When did the vehicle enter the facility?
- `parking_session.entry_time`

### When did the vehicle exit the facility?
- `parking_session.exit_time`

### What ticket was issued for the parking session?
- `parking_session.ticket_id` → `parking_ticket`

### Can one vehicle visit multiple times?
- Yes → One `vehicle` → Many `parking_session`

### Can one parking spot be reused?
- Yes → One `parking_spot` → Many `parking_session`

### How is parking availability tracked?
- Available = Total spots - Active sessions  
- Active session = `exit_time IS NULL`

### How are parking charges calculated?
- Using `parking_rate`  
- Based on:
  - `vehicle_type`
  - `spot_category`
  - duration (entry → exit)

### How is payment recorded?
- Stored in `payment` table  
- Linked via `parking_session_id`

### Can special access categories be represented?
- Yes → `access_category` (vip, staff, exhibitor, etc.)

### Can system track currently parked vehicles?
- Yes → `parking_session WHERE exit_time IS NULL`
