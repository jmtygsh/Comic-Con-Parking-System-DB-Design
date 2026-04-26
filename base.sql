// Comic-Con Parking System


vehicle_type [color: blue] {
  id SERIAL pk // auto increment id
  category ENUM ('two_wheeler', 'four_wheeler' 'six_wheeler', 'others')
  class VARCHAR(50) not null  // bike, car, SUV
  type VARCHAR(50) not null   // petrol, diesel, electric
  model VARCHAR(50) not null
  color VARCHAR(10)
  created_at timestamp 
  updated_at timestamp 
}

vehicle {
  id SERIAL pk
  number_plate VARCHAR(30) not null unique 
  vehicle_type_id INT fk not null
  created_at timestamp
}

parking_zone [color: green] {
  id SERIAL pk
  name VARCHAR(50) not null  // Zone A, Zone B
  level INT not null         // Level 1, Basement 2
  created_at timestamp
}


parking_spot_category [color: purple] {
  id SERIAL pk
  name ENUM ('general', 'vip', 'staff', 'ev_charging') // reserved type
}

access_category [color: orange] {
  id SERIAL pk
  name ENUM ('general', 'vip', 'staff', 'ev_priority') // who access the level of parking
  description TEXT 
}


parking_spot {
  id SERIAL pk
  spot_number VARCHAR(20) not null
  zone_id INT fk not null // what spot
  vehicle_type_id INT fk not null // what vehical
  spot_category_id INT fk not null // reserved category
  is_active BOOLEAN default true // it is active or not ?
}


parking_ticket {
  id SERIAL pk
  ticket_number VARCHAR(50) unique not null
  issued_at timestamp not null
  status ENUM ('active', 'closed', 'lost') 
}


parking_session [color: red] {
  id SERIAL pk
  vehicle_id INT fk not null
  parking_spot_id INT fk not null
  ticket_id INT fk not null
  access_category_id INT fk not null

  entry_time timestamp not null
  exit_time timestamp null

  status ENUM ('parked', 'completed', 'cancelled')
  created_at timestamp
}


parking_rate {
  id SERIAL pk
  vehicle_type_id INT fk not null
  spot_category_id INT fk not null
  hourly_rate DECIMAL(10,2) not null
  flat_rate DECIMAL(10,2) null
}


payment {
  id SERIAL pk
  parking_session_id INT fk not null
  amount DECIMAL(10,2) not null  /// stored into decimal for perfect amount
  payment_method ENUM ('cash', 'card', 'upi', 'online')
  payment_status ENUM ('pending', 'completed', 'failed')
  paid_at timestamp
}




// my all pk relationship 

parking_session.id < payment.parking_session_id 


vehicle_type.id < parking_rate.vehicle_type_id
parking_spot_category.id < parking_rate.spot_category_id


vehicle.id < parking_session.vehicle_id
parking_spot.id < parking_session.parking_spot_id
parking_ticket.id < parking_session.ticket_id
access_category.id < parking_session.access_category_id


parking_zone.id < parking_spot.zone_id
vehicle_type.id < parking_spot.vehicle_type_id
parking_spot_category.id < parking_spot.spot_category_id

vehicle_type.id < vehicle.vehicle_type_id



  
