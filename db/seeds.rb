#users
jalena = User.create!(first_name: "Jalena", last_name: "Taylor", email: "jalena.marie.taylor@gmail.com", dwolla_id: "123", dwolla_funding_source: "456", password: "password")

earl = User.create!(first_name: "Earl", last_name: "Stephens", email: "earl@example.com", dwolla_id: "123", dwolla_funding_source: "456", password: "password")

ethan = User.create!(first_name: "Ethan", last_name: "Grab", email: "ethan@example.com", dwolla_id: "123", dwolla_funding_source: "456", password: "password")

chi = User.create!(first_name: "Chi", last_name: "Tran", email: "chi@example.com", dwolla_id: "123", dwolla_funding_source: "456", password: "password")

#vacations with their users and activities
bachelorette = Vacation.create!(name: "bachelorette", location: "Hawaii", start_date: "2019-06-12", end_date: "2019-06-15")

  bachelorette_user_1 = bachelorette.vacation_users.create!(user_id: jalena.id, role: 1)
  bachelorette_user_2 = bachelorette.vacation_users.create!(user_id: chi.id, role: 0)

  hawaii_hotel = bachelorette.activities.create!(price: 600.00, num_attendees: 2, description: "Double Room", name: "Hawaii Hotel", no_of_days: 3, cutoff_date: "2019-06-10", type: FixedCost  , user_id: jalena.id)

    jalena_hawaii_hotel = UserActivity.create!(user_id: jalena.id, quantity: 1, price: 300.00, paid: false, activity_id: hawaii_hotel.id)

    chi_hawaii_hotel = UserActivity.create!(user_id: chi.id, quantity: 1, price: 300.00, paid: false, activity_id: hawaii_hotel.id)

  snorkeling = bachelorette.activities.create!(price: 200.00, num_attendees: 2, description: "Swim with the fishes", name: "Snorkeling", no_of_days: 1, cutoff_date: "2019-06-12", type: PerPersonCost, user_id: jalena.id)

    jalena_snorkeling = UserActivity.create!(user_id: jalena.id, quantity: 1, price: 100.00, paid: false, activity_id: snorkeling.id)

    chi_snorkeling = UserActivity.create!(user_id: chi.id, quantity: 1, price: 100.00, paid: false, activity_id: snorkeling.id)

party = Vacation.create!(name: "Party", location: "Brazil", start_date: "2019-07-12", end_date: "2019-07-17")

  party_user_1 = party.vacation_users.create!(user_id: earl.id, role: 1)
  party_user_2 = party.vacation_users.create!(user_id: ethan.id, role: 0)

  brazil_airbnb = party.activities.create!(price: 800.00, num_attendees: 2, description: "Condo", name: "Brazil AirBnB", no_of_days: 5, cutoff_date: "2019-07-10", type: FixedCost, user_id: earl.id)

      earl_brazil_airbnb = UserActivity.create!(user_id: earl.id, quantity: 1, price: 400.00, paid: false, activity_id: brazil_airbnb.id)

      ethan_brazil_airbnb = UserActivity.create!(user_id: ethan.id, quantity: 1, price: 400.00, paid: false, activity_id: brazil_airbnb.id)

    boat_rental = party.activities.create!(price: 400.00, num_attendees: 2, description: "For Friday & Saturday", name: "Boat Rental", no_of_days: 2, cutoff_date: "2019-07-14", type: PerPersonCost, user_id: earl.id)

      earl_boat_rental = UserActivity.create!(user_id: earl.id, quantity: 1, price: 200.00, paid: false, activity_id: boat_rental.id)

      ethan_boat_rental = UserActivity.create!(user_id: ethan.id, quantity: 1, price: 200.00, paid: false, activity_id: boat_rental.id)

wine_tasting = Vacation.create!(name: "Wine Tasting", location: "France", start_date: "2019-08-21", end_date: "2019-08-25")

  wt_user_1 = wine_tasting.vacation_users.create!(user_id: ethan.id, role: 1)
  wt_user_2 = wine_tasting.vacation_users.create!(user_id: earl.id, role: 0)
  wt_user_3 = wine_tasting.vacation_users.create!(user_id: jalena.id, role: 0)

  france_hotel = wine_tasting.activities.create!(price: 1_200.00, num_attendees: 3, description: "3 Rooms", name: "France Hotel", no_of_days: 4, cutoff_date: "2019-08-19", type: FixedCost, user_id: ethan.id)

      ethan_france_hotel = UserActivity.create!(user_id: ethan.id, quantity: 1, price: 400.00, paid: false, activity_id: france_hotel.id)

      earl_france_hotel = UserActivity.create!(user_id: earl.id, quantity: 1, price: 400.00, paid: false, activity_id: france_hotel.id)

      jalena_france_hotel = UserActivity.create!(user_id: jalena.id, quantity: 1, price: 400.00, paid: false, activity_id: france_hotel.id)


skiing = Vacation.create!(name: "Skiing", location: "Aspen", start_date: "2019-12-18", end_date: "2019-12-23")

  skiing_user_1 = skiing.vacation_users.create!(user_id: jalena.id, role: 1)
  skiing_user_2 = skiing.vacation_users.create!(user_id: chi.id, role: 0)
  skiing_user_4 = skiing.vacation_users.create!(user_id: earl.id, role: 0)

    aspen_hotel = skiing.activities.create!(price: 1_500.00, num_attendees: 3, description: "Moutain Lodge", name: "Aspen Hotel", no_of_days: 3, cutoff_date: "2019-12-16", type: FixedCost, user_id: jalena.id)

      jalena_aspen_hotel = UserActivity.create!(user_id: jalena.id, quantity: 1, price: 500.00, paid: false, activity_id: aspen_hotel.id)

      earl_aspen_hotel = UserActivity.create!(user_id: earl.id, quantity: 1, price: 500.00, paid: false, activity_id: aspen_hotel.id)

      chi_aspen_hotel = UserActivity.create!(user_id: chi.id, quantity: 1, price: 500.00, paid: false, activity_id: aspen_hotel.id)
