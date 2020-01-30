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

def delete()
  sql = "DELETE FROM movies WHERE id = $1"
  values = [@id]
  results = SqlRunner.run(sql, values)
end

def stars()
  sql = "SELECT stars.* FROM stars
  INNER JOIN castings
  ON castings.star_id = stars.id
  WHERE movie_id = $1"
  values = [@id]
  stars = SqlRunner.run(sql, values)
  return Star.map_items(stars)
end

def self.map_items(movie_data)
  return movie_data.map{|movie| Movie.new(movie)}
end

def self.all
  sql = "SELECT * FROM movies"
  movies = SqlRunner.run(sql)
  return movies.map {|movie| Movie.new(movie)}
end

def self.delete_all()
  sql = "DELETE FROM movies"
  SqlRunner.run(sql)
end



end
