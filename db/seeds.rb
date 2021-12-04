puts "Deleting old data..."
User.destroy_all
Movie.destroy_all
Director.destroy_all
Favorite.destroy_all
puts "here?"
Friendslist.destroy_all
puts "here."
Watchlist.destroy_all
Suggested.destroy_all
Review.destroy_all

puts "🌱 Seeding spices..."

puts "Creating users..."
user1 = User.create(first_name: "Mike", last_name: "Neis", username: "neisguy")
user2 = User.create(first_name: "Joey", last_name: "Gasper", username: "goldennugget")

puts "Creating directors..."
all_directors = [["Denis", "Villeneuve", 0],["Christopher", "Nolan", 0],["Quentin", "Tarantino", 2], ["Stephen", "Speilberg", 2], ["George", "Lucas", 0]]
all_directors.each{|dir| Director.create(first_name: dir[0], last_name: dir[1], oscars: dir[2])}


puts "Creating movies..."
all_movies = [["Dune", "SciFi", "PG-13"], ["Memento", "Thriller", "PG-13"], ["Django", "Western", "R"], ["E.T.", "Family", "PG"], ["Star Wars", "SciFi", "PG"]]
all_movies.each{|mov| Movie.create(title: mov[0], genre: mov[1], rating: mov[2])}
specMovie = Movie.create(title: "Sicario", genre: "Thriller", rating: "R")

puts "Creating favorites..."
Favorite.create(user: user1, movie: specMovie, ranking: 1)

puts "Creating friends..."
Friendslist.create(user1: user1, user2: user2)


puts "✅ Done seeding!"
