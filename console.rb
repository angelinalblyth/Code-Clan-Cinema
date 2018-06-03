require_relative('models/customer')
require_relative('models/film')
require_relative('models/ticket')
require_relative('models/screening')

require('pry-byebug')

Customer.delete_all()
Film.delete_all()
Ticket.delete_all()
Screening.delete_all()


customer1 = Customer.new({'name' => 'Angelina', 'funds' => '10'})
customer1.save()
customer2 = Customer.new({'name' => 'Grant', 'funds' => '20'})
customer2.save()
customer3 = Customer.new({'name' => 'Abi', 'funds' => '5'})
customer3.save()
customer4 = Customer.new({'name' => 'Christy', 'funds' => '10'})
customer4.save()
customer5 = Customer.new({'name' => 'Amy', 'funds' => '15'})
customer5.save()
customer6 = Customer.new({'name' => 'Mike', 'funds' => '10'})
customer6.save()

film1 = Film.new({'title' => 'Iron Man', 'price' => '4'})
film1.save()
film2 = Film.new({'title' => 'The Incredible Hulk', 'price' => '4'})
film2.save()
film3 = Film.new({'title' => 'Doctor Strange', 'price' => '4'})
film3.save()
film4 = Film.new({'title' => 'Avengers: Age of Ultron', 'price' => '4'})
film4.save()
film5 = Film.new({'title' => 'Thor: The Dark World', 'price' => '4'})
film5.save()
film6 = Film.new({'title' => 'Black Panther', 'price' => '4'})
film6.save()

screening1 = Screening.new({'screening_time' => '12:00', 'film_id' => film1.id})
screening1.save()
screening2 = Screening.new({'screening_time' => '13:00', 'film_id' => film1.id})
screening2.save()
screening3 = Screening.new({'screening_time' => '16:00', 'film_id' => film1.id})
screening3.save()
screening4 = Screening.new({'screening_time' => '12:00', 'film_id' => film2.id})
screening4.save()
screening5 = Screening.new({'screening_time' => '14:00', 'film_id' => film2.id})
screening5.save()
screening6 = Screening.new({'screening_time' => '16:00', 'film_id' => film3.id})
screening6.save()

ticket1 = Ticket.new({'customer_id' => '1', 'film_id' => '1', 'screening_id' => screening1.id})
ticket1.save()
ticket2 = Ticket.new({'customer_id' => '2', 'film_id' => '1', 'screening_id' => screening1.id})
ticket2.save()
ticket3 = Ticket.new({'customer_id' => '6', 'film_id' => '6', 'screening_id' => screening1.id})
ticket3.save()
ticket4 = Ticket.new({'customer_id' => '5', 'film_id' => '6', 'screening_id' => screening4.id})
ticket4.save()
ticket5 = Ticket.new({'customer_id' => '3', 'film_id' => '5', 'screening_id' => screening4.id})
ticket5.save()
ticket6 = Ticket.new({'customer_id' => '4', 'film_id' => '3', 'screening_id' => screening6.id})
ticket6.save()
ticket7 = Ticket.new({'customer_id' => '1', 'film_id' => '3', 'screening_id' => screening6.id})
ticket7.save()
ticket8 = Ticket.new({'customer_id' => '1', 'film_id' => '1', 'screening_id' => screening1.id})
ticket8.save()
ticket9 = Ticket.new({'customer_id' => '2', 'film_id' => '1', 'screening_id' => screening1.id})
ticket9.save()



customer1.name = "Angie"
customer1.update()

customer2.buy_ticket(film1)
customer2.update()

screening1.screening_time = "14:00"
screening1.update()


binding.pry
nil
