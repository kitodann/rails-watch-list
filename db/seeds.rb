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

create_movies = response['results']

create_movies.each do |m|
  movie = Movie.create(
    title: m['title'],
    overview: m['overview'],
    poster_url: "https://image.tmdb.org/t/p/original#{m['poster_path']}",
    rating: m['vote_average']
  )
  puts movie.title
end

# puts response['results'][0]['title']
