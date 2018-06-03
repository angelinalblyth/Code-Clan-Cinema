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
end

def save()
  sql = "INSERT INTO screenings (screening_time, film_id) VALUES ($1, $2) RETURNING id"
  values = [@screening_time, @film_id]
  screening = SqlRunner.run(sql, values).first
  @id = screening['id'].to_i
end

end
