require_relative('../db/sql-runner.rb')
require_relative("film.rb")
require_relative("ticket.rb")
require_relative("customer.rb")

class Screening

  attr_reader :id
  attr_accessor :screening_time, :film_id

def initialize(options)
  @id = options['id'][0].to_i if options['id']
  @screening_time = options['screening_time']
  @film_id = options['film_id'].to_i
  # @tickets_sold = 0
end

def save()
  sql = "INSERT INTO screenings (screening_time, film_id) VALUES ($1, $2) RETURNING id"
  values = [@screening_time, @film_id]
  screening = SqlRunner.run(sql, values).first
  @id = screening['id'].to_i
end

def self.all() #Screening.all()
  sql = "SELECT * FROM screenings"
  results = SqlRunner.run(sql)
  return Screening.map_items(results)
end

def self.delete_all()
  sql = "DELETE FROM screenings"
  SqlRunner.run(sql)
end

def update()
  sql = "UPDATE screenings SET (screening_time, film_id) = ($1, $2) WHERE id = $3"
  values = [@screening_time, @film_id, @id]
  SqlRunner.run(sql, values)
end

def delete()
  sql = "DELETE * FROM screenings WHERE id = $1"
  values = [@id]
  SqlRunner.run(sql, values)
end


def self.map_items(data)
  result = data.map{|screening| Screening.new(screening)}
  return result
end

end
