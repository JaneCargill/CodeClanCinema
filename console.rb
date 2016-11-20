require('pry-byebug')
require_relative('models/customers')
require_relative('models/films')
require_relative('models/tickets')

Ticket.delete_all
Customer.delete_all
Film.delete_all

film1 = Film.new({
  'title' => 'Doctor Strange',
  'price' => 6.20
  })
film2 = Film.new({
  'title' => 'Trolls',
  'price' => 7.50
  })
film3 = Film.new({
  'title' => 'Arrival',
  'price' => 7.00
  })
film4 = Film.new({
  'title' => 'Fantastic Beasts and Where to Find Them',
  'price' => 8.00
  })

film1.save()
film2.save()
film3.save()
film4.save()

customer1 = Customer.new({
  'name' => 'Peter Rabbit',
  'funds' => 35.00
  })
customer2 = Customer.new({
  'name' => 'Jemima Puddle-Duck',
  'funds' => 15.00
  })
customer3 = Customer.new({
  'name' => 'Mrs Tiggy-Winkle',
  'funds' => 15.00
  })
customer4 = Customer.new({
  'name' => 'Benjamin Bunny',
  'funds' => 50.00
  })
customer5 = Customer.new({
  'name' => 'Mr Jeremy Fisher',
  'funds' => 25.00
  })

customer1.save
customer2.save
customer3.save
customer4.save
customer5.save

customer2.funds = 20.00
customer3.funds = 30.00

customer2.update
customer3.update
# customer5.delete
# film3.delete

ticket1 = Ticket.new({
  'customer_id' => customer3.id,
  'film_id' => film1.id,
  'film_time' => '11:00'
  })
ticket2 = Ticket.new({
  'customer_id' => customer4.id,
  'film_id' => film1.id,
  'film_time' => '12:00'
  })
ticket3 = Ticket.new({
  'customer_id' => customer5.id,
  'film_id' => film1.id,
  'film_time' => '13:00'
  })
ticket4 = Ticket.new({
  'customer_id' => customer1.id,
  'film_id' => film1.id,
  'film_time' => '12:00'
  })
ticket5 = Ticket.new({
  'customer_id' => customer5.id,
  'film_id' => film2.id,
  'film_time' => '12:00'
  })
ticket6 = Ticket.new({
  'customer_id' => customer5.id,
  'film_id' => film3.id,
  'film_time' => '13:00'
  })
ticket7 = Ticket.new({
  'customer_id' => customer5.id,
  'film_id' => film4.id,
  'film_time' => '14:00'
  })
ticket8 = Ticket.new({
  'customer_id' => customer2.id,
  'film_id' => film1.id,
  'film_time' => '12:00'
  })

ticket1.save
ticket2.save
ticket3.save
ticket4.save
ticket5.save
ticket6.save
# ticket7.save
# ticket8.save

customer1.buy_ticket(film1)
film1.popular_film_time
film1.ticket_limit(film1)
film2.ticket_limit(film2)
film3.ticket_limit(film3)
film4.ticket_limit(film4)


customers = Customer.all
films = Film.all
tickets = Ticket.all

binding.pry
nil

