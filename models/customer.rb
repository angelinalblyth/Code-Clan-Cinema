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

end
