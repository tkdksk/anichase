0.upto(29) do |idx|
  Anime.create(
    anime_title: "シベ超#{idx + 1}",
  )
end