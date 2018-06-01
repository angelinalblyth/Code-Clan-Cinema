require_relative('../db/sql-runner.rb')

class Customer

  attr_reader :id
  attr_accessor :name, :funds

  def initialize(options)
    @id = options['id'][0].to_i if options['id']
    @name = options['name']
    @funds = options['funds'].to_i
  end

  def save()
    sql = "INSERT INTO customers (name, funds) VALUES ($1, $2) RETURNING id"
    values = [@name, @funds]
    customer = SqlRunner.run(sql, values).first
    @id = customer['id'].to_i
  end

  def self.all() #Customer.all()
    sql = "SELECT * FROM customers"
    customers = SqlRunner.run(sql)
    results = customers.map{|customer| Customer.new(customer)}
    return results
  end

  def self.delete_all()
    sql = "DELETE FROM customers"
    SqlRunner.run(sql)
  end

  def update()
    sql = "UPDATE customers SET (name, funds) = ($1, $2) WHERE id = $3"
    values = [@name, @funds, @id]
    SqlRunner.run(sql, values)
  end

  def delete()
    sql = "DELETE * from customers WHERE id = $1"
    values [@id]
    SqlRunner.run(sql, values)
  end

  def films()
    sql = "SELECT films.* FROM films INNER JOIN tickets ON films.id = tickets.film_id WHERE customer_id = $1"
    values = [@id]
    film_data = SqlRunner.run(sql, values)
    return Film.map_items(film_data)
  end

# Remaining funds. Need to SELECT the film price from the film table. Find what customers when to see that film from the tickets table. Get the customers funds in their wallet. Remove the film ticket price from the customers funds. Update the customers funds with the new amount.

  def buy_ticket(film)
    @funds -= film.price
    return @funds
  end

# def tickets_bought()
#   sql = ""
# end


def self.map_items(data)
  result = data.map{|customer| Customer.new(customer)}
  return result
end

end
