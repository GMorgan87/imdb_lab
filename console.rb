require('pry')
require_relative('models/movie')
require_relative('models/star')
require_relative('models/casting')

Casting.delete_all()
Movie.delete_all()
Star.delete_all()

  movie1 = Movie.new({"title" => "Highlander", "genre" => "sci-fi" })
  movie1.save()

  movie2 = Movie.new({"title" => "Goldfinger", "genre" => "action" })
  movie2.save()

  star1 = Star.new({"first_name" => "Sean", "last_name" => "Connery"})
  star1.save()

  star2 = Star.new({"first_name" => "Christopher", "last_name" => "Lambert"})
  star2.save()

  casting1 = Casting.new({"movie_id" => movie1.id, "star_id" => star1.id})
  casting1.save()

  casting2 = Casting.new({"movie_id" => movie2.id, "star_id" => star1.id})
  casting2.save()

  casting3 = Casting.new({"movie_id" => movie1.id, "star_id" => star2.id})
  casting3.save()

binding.pry()
nil
