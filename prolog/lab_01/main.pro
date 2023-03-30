domains
  surname = string.
  mark = string.
  color = string.
  price = integer.
  number = integer.
  
  name = string.
  city = string.
  street = string.
  house = integer.
  apartment = integer.
  
  phone = integer.
  
  address = address(city, street, house, apartment).
  
predicates
  phone_record(surname, name, address, phone).
  car_record(surname, mark, color, price, number).
  get_phone_by_car_mark(mark, phone).
  get_phone_by_car_number(number, phone).
  
clauses
  phone_record("Ivanov", "Ivan", address("Moscow", "Ivanovskay", 5, 0), 2294055).
  phone_record("Petrov", "Petr", address("Volgograd", "Leninskaya", 1, 0), 8456372).
  phone_record("Sidorov", "Ivan", address("Ekaterinburg", "Lesnaya", 2, 4), 8994527).
  phone_record("Svidorov", "Pavel", address("Moscow", "Lesnaya", 8, 0), 8994558).
  phone_record("Ivanov", "Ivan", address("Ekaterinburg", "Glavnaya", 4, 0), 6994566).
 
  car_record("Ivanov", "mark1", "red", 100, 1).
  car_record("Petrov", "mark1", "blue", 100, 2).
  car_record("Sidorov", "mark2", "green", 110, 3).
  
  get_phone_by_car_mark(Mark, Phone) :- 
      car_record(Surname, Mark, _, _, _),
      phone_record(Surname, _, address(_, _, _, _), Phone).
      
  get_phone_by_car_number(Number, Phone) :- 
      car_record(Surname, _, _, _, Number),
      phone_record(Surname, _, address(_, _, _, _), Phone).

goal
  get_phone_by_car_number(1, Phone).