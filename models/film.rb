require_relative('../db/sql-runner.rb')

class Film

  attr_reader :id
  attr_accessor :title, :price

  def initialize(options)
      @id = options['id'][0].to_i if options['id']
      @title = options['title']
      @price = options['price']
  end

  def save()
    sql = "INSERT INTO films (title, price) VALUES ($1, $2) RETURNING id"
    values = [@title, @price]
    film = SqlRunner.run(sql, values).first
    @id = film['id'].to_i
  end

  def self.all()
    sql = "SELECT * FROM films"
    films = SqlRunner.run(sql)
    results = films.map{|film| Film.new(film)}
    return results
  end

end
