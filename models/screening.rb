require_relative('../db.sql-runner.rb')

class Screening

  attr_reader :id
  attr_accessor :screening_time, :film_id

def initialize(options)
  @id = options['id'][0].to_i if options['id']
  @screening_time = options['screening_time']
  @film_id = options['film_id'].to_i
end

end
