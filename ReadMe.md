## Comic-Con Parking System


# Mental Map

-- vehicle enter (four wheeler)

1. vehicle comes →
   we store in vehicle table
   (number_plate)

2. then we map it to vehicle_type →
   category = four_wheeler
   class = car
   type = petrol/diesel/electric
   model, color also stored

3. now system checks access →
   access_category (general / vip / staff / ev_priority)

4. system finds parking spot →
   from parking_spot table
   based on:
     - vehicle_type
     - spot_category
     - is_active = true
     - not already occupied

5. once spot found →
   assign parking_spot_id

6. generate parking_ticket →
   ticket_number + issued_at
   status = active

7. create parking_session →
   store:
     - vehicle_id
     - parking_spot_id
     - ticket_id
     - access_category_id
     - entry_time = now
     - status = parked

8. vehicle is now parked 



-- While Parking
- vehicle is inside when exit_time = NULL
- parking_spot is occupied
- we track using parking_session



-- Exit Flow

1. vehicle comes to exit →
   give ticket / number_plate

2. system finds parking_session →
   using vehicle_id or ticket_id

3. calculate time →
   duration = exit_time - entry_time

4. get rate from parking_rate →
   based on:
     - vehicle_type
     - spot_category

5. calculate amount →
   hourly_rate OR flat_rate

6. create payment →
   store:
     - parking_session_id
     - amount
     - payment_method
     - status = completed
     - paid_at = now

7. update parking_session →
   exit_time = now
   status = completed

8. parking_spot becomes free again.
