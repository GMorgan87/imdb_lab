require_relative("../db/sql_runner")

class Movie

  attr_reader :id
  attr_accessor :title, :genre

def initialize(options)
  @id = options["id"].to_i if options["id"]
  @title = options["title"]
  @genre = options["genre"]
end

def save()
  sql = "INSERT INTO movies
  (title, genre)
  values
  ($1, $2)
  RETURNING id"
  values = [@title, @genre]
  results = SqlRunner.run(sql, values)
  @id = results[0]["id"].to_i
end




end
