puts "Deleting old data..."
User.destroy_all
Movie.destroy_all
Director.destroy_all
MovieFavorite.destroy_all
DirectorFavorite.destroy_all
Friendslist.destroy_all
Watchlist.destroy_all
Suggested.destroy_all
Review.destroy_all

puts "🌱 Seeding spices..."

puts "Creating users..."
user1 = User.create(first_name: "Mike", last_name: "Neis", username: "neisguy")
user2 = User.create(first_name: "Joey", last_name: "Gasper", username: "goldennugget")
user3 = User.create(first_name: "Drew", last_name: "Schwarz", username: "drewbio")
user4 = User.create(first_name: "Mitch", last_name: "McKenzie", username: "chocolaterain")

puts "Creating directors..."
all_directors = [["Denis", "Villeneuve", 0],["Christopher", "Nolan", 0],["Quentin", "Tarantino", 2], ["Steven", "Spielberg", 4], ["George", "Lucas", 0], ["Ridley", "Scott", 0]]
all_directors.each{|dir| Director.create(first_name: dir[0], last_name: dir[1], oscars: dir[2])}


puts "Creating movies..."
all_movies = [["Dune", "Sci-Fi", "PG-13", 0], ["Memento", "Thriller", "PG-13", 1], ["Django", "Western", "R", 2], ["E.T.", "Family", "PG", 3], ["Star Wars", "Sci-Fi", "PG", 4], ["Sicario", "Thriller", "R", 0], ["Blade Runner 2049", "Sci-Fi", "R", 0], ["Arrival", "Sci-Fi", "PG-13", 0], ["Prisoners", "Mystery", "R", 0], ["Tenet", "Thriller", "PG-13", 1], ["Inception", "Sci-Fi", "PG-13", 1], ["The Prestige", "Mystery", "PG-13", 1], ["Dunkirk", "War", "PG-13", 1], ["Reservoir Dogs", "Crime", "R", 2], ["Kill Bill", "Action", "R", 2], ["Raiders of the Lost Ark", "Adventure", "PG", 3], ["Saving Private Ryan", "War", "R", 3], ["Gladiator", "Action", "R", 5], ["Thelma and Louise", "Adventure", "R", 5], ["Blade Runner", "Sci-Fi", "R", 5], ["Alien", "Sci-Fi", "R", 5]]
all_movies.each{|mov| Movie.create(title: mov[0], genre: mov[1], mpa_rating: mov[2], director: Director.all[mov[3]])}


puts "Creating favorites..."
MovieFavorite.create(user: user1, movie: Movie.first, ranking: 1)
DirectorFavorite.create(user: user1, director: Director.first, ranking: 1)

puts "Creating Watchlist..."
Watchlist.create(user: user1, movie: Movie.third)
Watchlist.create(user: user1, movie: Movie.second)
Watchlist.create(user: user1, movie: Movie.last)
Watchlist.create(user: user1, movie: Movie.all[4])
Watchlist.create(user: user2, movie: Movie.all[-1])

puts "Creating Reviews..."
Review.create(user: user1, movie: Movie.first, star_rating: 10, comment: "Absolutely loved the world building in this one. Beautifully executed by Denis.")
Review.create(user: user1, movie: Movie.second, star_rating: 10, comment: "Best Nolan film for sure.")
Review.create(user: user1, movie: Movie.third, star_rating: 1, comment: "Too much violence! I had to leave the theater.")
Review.create(user: user1, movie: Movie.all[-2], star_rating: 10, comment: "A classic.")
Review.create(user: user1, movie: Movie.fifth, star_rating: 10, comment: "Another classic.")
Review.create(user: user1, movie: Movie.all[5], star_rating: 10, comment: "Intense.")
Review.create(user: user1, movie: Movie.all[8], star_rating: 10, comment: "Thrilling.")
Review.create(user: user1, movie: Movie.all[-3], star_rating: 10, comment: "Yep.")
Review.create(user: user1, movie: Movie.all[6], star_rating: 10, comment: "Lovit.")
Review.create(user: user1, movie: Movie.all[7], star_rating: 10, comment: "Amy Adams good.")
Review.create(user: user2, movie: Movie.all[4], star_rating: 10, comment: "Starb Warg.")
Review.create(user: user2, movie: Movie.all[0], star_rating: 10, comment: "Mmm.")
Review.create(user: user2, movie: Movie.all[5], star_rating: 10, comment: "Woah.")
Review.create(user: user3, movie: Movie.all[0], star_rating: 10, comment: "Heeyah.")
Review.create(user: user3, movie: Movie.all[5], star_rating: 10, comment: "Bum badum buuum.")
Review.create(user: user3, movie: Movie.all[-4], star_rating: 10, comment: "Bum badum buuum.")
Review.create(user: user3, movie: Movie.all[-1], star_rating: 10, comment: "Bum badum buuum.")



puts "Creating friends..."
Friendslist.create(user_a_id: user1.id, user_b_id: user2.id)


puts "✅ Done seeding!"
