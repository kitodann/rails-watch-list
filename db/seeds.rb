# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the bin/rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)

require 'open-uri'
require 'json'

url = 'https://tmdb.lewagon.com/movie/top_rated'
uri = URI.open(url).read
response = JSON.parse(uri)

# Access to the array inside the parsed JSON file
create_movies = response['results']

Movie.destroy_all
puts 'Cleaning DB.......................'

puts ' Creating top movies.......................'

create_movies.each do |m|
  movie = Movie.create(
    title: m['title'],
    overview: m['overview'],
    poster_url: "https://image.tmdb.org/t/p/original#{m['poster_path']}",
    rating: m['vote_average']
  )
  puts movie.title
end

# puts ' Creating genre lists.......................'

# genres = %w[action adventure comedy fantasy horror romance western drama historical]

# genres.each do |genre|
#   list = List.create(
#     name: genre
#   )

#   puts list.name
# end
