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

genres = ["Sci-Fi", "Thriller", "Family", "Crime", "Drama", "Action", "Adventure"]

puts "Creating users..."
user1 = User.create(first_name: "Mike", last_name: "Neis", username: "neisguy")
user2 = User.create(first_name: "Joey", last_name: "Gasper", username: "goldennugget")
user3 = User.create(first_name: "Drew", last_name: "Schwarz", username: "drewbio")
user4 = User.create(first_name: "Mitch", last_name: "McKenzie", username: "chocolaterain")

puts "Creating directors..."
all_directors = [["Denis", "Villeneuve", 0],["Christopher", "Nolan", 0],["Quentin", "Tarantino", 2], ["Steven", "Spielberg", 4], ["George", "Lucas", 0], ["Ridley", "Scott", 0], ["Staney", "Kubrik", 1]]
all_directors.each{|dir| Director.create(first_name: dir[0], last_name: dir[1], oscars: dir[2])}


puts "Creating movies..."
all_movies = [["Dune", genres[0], "PG-13", 0, "https://static1.srcdn.com/wordpress/wp-content/uploads/2021/10/Dune-poster-of-giant-dune.jpeg?q=50&fit=crop&w=963&h=1407&dpr=1.5"], ["Memento", genres[1], "PG-13", 1, "https://cdn.shopify.com/s/files/1/0057/3728/3618/products/c15059527ae4d9c832dbb365b418369e_7c2bb4af-8bcd-428c-8904-27ddc512a45c_480x.progressive.jpg?v=1573594896"], ["Django", genres[5], "R", 2, "https://cdn.shopify.com/s/files/1/1057/4964/products/django-unchained-vintage-movie-poster-original-1-sheet-27x41.jpg?v=1605474022"], ["E.T.", genres[2], "PG", 3, "https://sothebys-md.brightspotcdn.com/dims4/default/055e8ed/2147483647/strip/true/crop/1343x2000+0+0/resize/2048x3050!/quality/90/?url=http%3A%2F%2Fsothebys-brightspot.s3.amazonaws.com%2Fmedia-desk%2Ff8%2Fa5%2Fe5c34f8f4304950ad7834cd24ee4%2Fl19985-b9yd5-01.jpg"], ["Star Wars", genres[0], "PG", 4, "https://m.media-amazon.com/images/I/81P3lDJbjCL._AC_SY450_.jpg"], ["Sicario", genres[1], "R", 0, "https://m.media-amazon.com/images/I/A1GdxURr+uL._AC_SY741_.jpg"], ["Blade Runner 2049", genres[0], "R", 0, "https://ae01.alicdn.com/kf/HTB1OSm9hf6H8KJjSspmq6z2WXXaP/Art-Sci-fi-Blade-Runner-2049-Movie-Propaganda-Posters-Retro-Vintage-Kraft-Poster-Canvas-Wall-Sticker.jpg_Q90.jpg_.webp"], ["Arrival", genres[0], "PG-13", 0, "https://cdn.shopify.com/s/files/1/1416/8662/products/Arrival_2016_original_film_art_e823c6c1-6f00-42c5-9a4a-74fbd7ec83a8_5000x.jpg?v=1636660813"], ["Prisoners", genres[4], "R", 0, "https://m.media-amazon.com/images/M/MV5BMTg0NTIzMjQ1NV5BMl5BanBnXkFtZTcwNDc3MzM5OQ@@._V1_.jpg"], ["Tenet", genres[1], "PG-13", 1, "https://m.media-amazon.com/images/I/71Tw-XHzu1L._AC_SY679_.jpg"], ["Inception", genres[0], "PG-13", 1, "https://ih1.redbubble.net/image.1172474510.1190/flat,750x,075,f-pad,750x1000,f8f8f8.jpg"], ["The Prestige", genres[4], "PG-13", 1, "https://m.media-amazon.com/images/M/MV5BMjA4NDI0MTIxNF5BMl5BanBnXkFtZTYwNTM0MzY2._V1_.jpg"], ["Dunkirk", genres[5], "PG-13", 1, "https://m.media-amazon.com/images/I/61jphewUR6L._AC_SY450_.jpg"], ["Reservoir Dogs", genres[3], "R", 2, "https://m.media-amazon.com/images/M/MV5BZmExNmEwYWItYmQzOS00YjA5LTk2MjktZjEyZDE1Y2QxNjA1XkEyXkFqcGdeQXVyMTQxNzMzNDI@._V1_FMjpg_UX1000_.jpg"], ["Kill Bill", genres[5], "R", 2, "https://i5.walmartimages.com/asr/5e75b600-6cd8-4d15-aa00-17ffee223291.c8ef61f69e869fc83a8d27cfbffee95e.jpeg"], ["Raiders of the Lost Ark", genres[6], "PG", 3, "http://cdn.shopify.com/s/files/1/0630/8509/products/pst2747indiana_grande.jpg?v=1527357382"], ["Saving Private Ryan", genres[5], "R", 3, "https://m.media-amazon.com/images/M/MV5BZjhkMDM4MWItZTVjOC00ZDRhLThmYTAtM2I5NzBmNmNlMzI1XkEyXkFqcGdeQXVyNDYyMDk5MTU@._V1_FMjpg_UX1000_.jpg"], ["Gladiator", genres[5], "R", 5, "https://m.media-amazon.com/images/I/71sj8Yt20qL._AC_SY679_.jpg"], ["Thelma and Louise", genres[6], "R", 5, "https://image.invaluable.com/housePhotos/AntiquitiesLV/59/669559/H22324-L206128795.jpg"], ["Blade Runner", genres[0], "R", 5, "https://cdn.shopify.com/s/files/1/1057/4964/products/Blade-Runner-Vintage-Movie-Poster-Original-30x40-7942_033ae405-66f4-4f49-b37f-df30529c2fe8.jpg?v=1638327758"], ["Alien", genres[0], "R", 5, "https://m.media-amazon.com/images/I/41VReP3cJoL._AC_.jpg"], ["Pulp Fiction", genres[3], "R", 2, "https://cdn.europosters.eu/image/750/posters/pulp-fiction-cover-i1288.jpg"], ["Inglorious Basterds", genres[6], "R", 2, "https://m.media-amazon.com/images/I/61PXdxTJGPL._AC_SY741_.jpg"], ["Schindler's List", genres[4], "R", 3, "https://m.media-amazon.com/images/M/MV5BNDE4OTMxMTctNmRhYy00NWE2LTg3YzItYTk3M2UwOTU5Njg4XkEyXkFqcGdeQXVyNjU0OTQ0OTY@._V1_.jpg"], ["The Adventures of Tintin", genres[2], "PG", 3, "https://m.media-amazon.com/images/M/MV5BNDE5MDExNTQ1OF5BMl5BanBnXkFtZTcwMDIxMTM5Ng@@._V1_.jpg"], ["Catch Me If You Can", genres[4], "PG-13", 3, "https://cdn.shopify.com/s/files/1/0057/3728/3618/products/ec805d680efb453bbd07a894684045cc_06e151c3-8ed7-43b9-9777-cd8d97622865_480x.progressive.jpg?v=1573593678"], ["Minority Report", genres[3], "PG-13", 3, "https://cdn.shopify.com/s/files/1/1416/8662/products/Minority_Report_2002_stylea_original_film_art_a_600x.jpg?v=1551788405"], ["Jaws", genres[1], "PG", 3, "https://m.media-amazon.com/images/I/718Hr+VKZ4L._AC_SY741_.jpg"], ["Jurassic Park", genres[6], "PG-13", 3, "https://m.media-amazon.com/images/I/61RLRZnbc+L._AC_SY741_.jpg"], ["The Martian", genres[0], "PG-13", 5, "https://images-wixmp-ed30a86b8c4ca887773594c2.wixmp.com/f/1592cb7c-9b89-4b7c-9cd7-61c44913dd58/d9bjt5a-88f0bd9e-c3d5-49a6-babe-d03c263fc2e5.jpg?token=eyJ0eXAiOiJKV1QiLCJhbGciOiJIUzI1NiJ9.eyJzdWIiOiJ1cm46YXBwOjdlMGQxODg5ODIyNjQzNzNhNWYwZDQxNWVhMGQyNmUwIiwiaXNzIjoidXJuOmFwcDo3ZTBkMTg4OTgyMjY0MzczYTVmMGQ0MTVlYTBkMjZlMCIsIm9iaiI6W1t7InBhdGgiOiJcL2ZcLzE1OTJjYjdjLTliODktNGI3Yy05Y2Q3LTYxYzQ0OTEzZGQ1OFwvZDlianQ1YS04OGYwYmQ5ZS1jM2Q1LTQ5YTYtYmFiZS1kMDNjMjYzZmMyZTUuanBnIn1dXSwiYXVkIjpbInVybjpzZXJ2aWNlOmZpbGUuZG93bmxvYWQiXX0.u5juvCP68W23VHR2c8MdGqKjjtca0yDD4z-89GuqkEU"], ["Black Hawk Down", genres[5], "R", 5, "https://m.media-amazon.com/images/M/MV5BYWMwMzQxZjQtODM1YS00YmFiLTk1YjQtNzNiYWY1MDE4NTdiXkEyXkFqcGdeQXVyNDYyMDk5MTU@._V1_.jpg"], ["2001: A Space Odyssey", genres[0], "G", 6, "https://m.media-amazon.com/images/M/MV5BMmNlYzRiNDctZWNhMi00MzI4LThkZTctMTUzMmZkMmFmNThmXkEyXkFqcGdeQXVyNzkwMjQ5NzM@._V1_.jpg"], ["The Shining", genres[6], "R", 6, "https://m.media-amazon.com/images/I/61cwYyI-c0L._AC_SY550_.jpg"], ["Full Metal Jacket", genres[5], "R", 6, "https://cdn.shopify.com/s/files/1/1057/4964/products/full-metal-jacket-vintage-movie-poster-original-1-sheet-27x41-6454.jpg?v=1628197222"]]
all_movies.each{|mov| Movie.create(title: mov[0], genre: mov[1], mpa_rating: mov[2], director: Director.all[mov[3]], movie_img: mov[4])}


puts "Creating favorites..."
MovieFavorite.create(user: user1, movie: Movie.first, ranking: 1)
DirectorFavorite.create(user: user1, director: Director.first, ranking: 1)

puts "Creating Watchlist..."
Watchlist.create(user: user1, movie: Movie.third)
Watchlist.create(user: user1, movie: Movie.second)
Watchlist.create(user: user1, movie: Movie.last)
Watchlist.create(user: user1, movie: Movie.all[4])
Watchlist.create(user: user1, movie: Movie.all[12])
Watchlist.create(user: user1, movie: Movie.all[6])
Watchlist.create(user: user1, movie: Movie.all[7])
Watchlist.create(user: user1, movie: Movie.all[10])


puts "Creating Reviews..."
Review.create(user: user1, movie: Movie.first, star_rating: 10, comment: "Absolutely loved this one.")
Review.create(user: user1, movie: Movie.second, star_rating: 10, comment: "Best Nolan film for sure.")
Review.create(user: user1, movie: Movie.third, star_rating: 1, comment: "Too much violence! I had to leave the theater.")
Review.create(user: user1, movie: Movie.all[-3], star_rating: 10, comment: "A classic.")
Review.create(user: user1, movie: Movie.fifth, star_rating: 10, comment: "Another classic.")


puts "Creating friends..."
Friendslist.create(user_a_id: user1.id, user_b_id: user2.id)


puts "✅ Done seeding!"
