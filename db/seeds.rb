puts "Deleting old data..."
User.destroy_all
Movie.destroy_all
Director.destroy_all
Favorite.destroy_all
Friendslist.destroy_all
Watchlist.destroy_all
Suggested.destroy_all
Review.destroy_all

puts "🌱 Seeding spices..."

puts "Creating users..."
user1 = User.create(first_name: "Mike", last_name: "Neis", username: "neisguy")
user2 = User.create(first_name: "Joey", last_name: "Gasper", username: "goldennugget")

puts "Creating directors..."
all_directors = [["Denis", "Villeneuve", 0],["Christopher", "Nolan", 0],["Quentin", "Tarantino", 2], ["Steven", "Spielberg", 4], ["George", "Lucas", 0], ["Ridley", "Scott", 0]]
all_directors.each{|dir| Director.create(first_name: dir[0], last_name: dir[1], oscars: dir[2])}


puts "Creating movies..."
all_movies = [["Dune", "Sci-Fi", "PG-13", 0], ["Memento", "Thriller", "PG-13", 1], ["Django", "Western", "R", 2], ["E.T.", "Family", "PG", 3], ["Star Wars", "Sci-Fi", "PG", 4], ["Sicario", "Thriller", "R", 0], ["Blade Runner 2049", "Sci-fi", "R", 0], ["Arrival", "Sci-Fi", "PG-13", 0], ["Prisoners", "Mystery", "R", 0], ["Tenet", "Thriller", "PG-13", 1], ["Inception", "Sci-Fi", "PG-13", 1], ["The Prestige", "Mystery", "PG-13", 1], ["Dunkirk", "War", "PG-13", 1], ["Reservoir Dogs", "Crime", "R", 2], ["Kill Bill", "Action", "R", 2], ["Raiders of the Lost Ark", "Adventure", "PG", 3], ["Saving Private Ryan", "War", "R", 3], ["Gladiator", "Action", "R", 5], ["Thelma and Louise", "Adventure", "R", 5], ["Blade Runner", "Sci-Fi", "R", 5]]
all_movies.each{|mov| Movie.create(title: mov[0], genre: mov[1], rating: mov[2], director: Director.all[mov[3]])}


puts "Creating favorites..."
Favorite.create(user: user1, movie: Movie.first, ranking: 1)
Favorite.create(user: user1, director: Director.first, ranking: 1)

puts "Creating Watchlist..."
Watchlist.create(user: user1, movie: Movie.third)
Watchlist.create(user: user1, movie: Movie.second)
Watchlist.create(user: user1, movie: Movie.last)
Watchlist.create(user: user1, movie: Movie.all[4])

puts "Creating Reviews..."
Review.create(user: user1, movie: Movie.first, rating: 10, comment: "Absolutely loved the world building in this one. Beautifully excicuted by Denis.")


puts "Creating friends..."
Friendslist.create(user1: user1.id, user2: user2.id)


puts "✅ Done seeding!"
