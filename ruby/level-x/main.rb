require 'date'
class Test
  def input
    {
      "cars": [
        { "id": 1, "price_per_day": 2000, "price_per_km": 10 },
        { "id": 2, "price_per_day": 3000, "price_per_km": 15 },
        { "id": 3, "price_per_day": 1700, "price_per_km": 8 }
      ],
      "rentals": [
        { "id": 1, "car_id": 1, "start_date": '2017-12-8', "end_date": '2017-12-10', "distance": 100 },
        { "id": 2, "car_id": 1, "start_date": '2017-12-14', "end_date": '2017-12-18', "distance": 550 },
        { "id": 3, "car_id": 2, "start_date": '2017-12-8', "end_date": '2017-12-10', "distance": 150 }
      ]
    }
  end

  def output
     input = input()
     rentals = []

     input[:rentals].each do |rent|
        car_id = rent[:car_id]
        # Find informations about car booked
        car = input[:cars].find { |car| car[:id] == car_id }

        end_date, start_date = Date.parse(rent[:end_date]), Date.parse(rent[:start_date])
        # Rent period is the difference between end_date rent and start_date with +1 to get the price until the last day
        rent_period = (end_date - start_date).to_i + 1

        rentals << {
            :id => rent[:id],
            :price => ( rent_period * car[:price_per_day] ) + ( rent[:distance] * car[:price_per_km] )
        }
     end

     {
        "rentals": rentals
     }
  end
end
