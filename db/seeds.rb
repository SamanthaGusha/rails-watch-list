# This file should ensure the existence of records required to run the application in every environment (production,
# development, test). The code here should be idempotent so that it can be executed at any point in every environment.
# The data can then be loaded with the bin/rails db:seed command (or created alongside the database with db:setup).
#
# Example:
#
#   ["Action", "Comedy", "Drama", "Horror"].each do |genre_name|
#     MovieGenre.find_or_create_by!(name: genre_name)
#   end
require 'faker'

puts 'Creating movies....'

30.times do
  movie = Movie.new(
    title: Faker::Movie.title,
    overview: Faker::Lorem.sentence(word_count: 10),
    poster_url: Faker::Internet.url,
    rating: Faker::Number.between(from: 1, to: 10).to_f.round(1)
  )
  movie.save
end

puts 'Finished!'
