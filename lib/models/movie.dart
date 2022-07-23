class Movie {
  final int id;
  final String title;
  final String image;
  final String releaseDate;
  final double rating;

  Movie(this.id, this.title, this.image, this.releaseDate, this.rating);

  Movie.fromJson(Map<String, dynamic> json)
      : id = json["id"],
        title = json["title"],
        image = json["backdrop_path"],
        releaseDate = json["release_date"],
        rating = json["vote_average"];

  @override
  String toString() {
    return "[$id, $title, $image, $releaseDate, $rating]";
  }
}
