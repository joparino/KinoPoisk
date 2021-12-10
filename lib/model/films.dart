// To parse this JSON data, do
//
//     final welcome8 = welcome8FromJson(jsonString);



class Film {
    Film({
        required this.filmId,
        required this.nameRu,
        required this.nameEn,
        required this.year,
        required this.filmLength,
        required this.countries,
        required this.genres,
        required this.rating,
        required this.ratingVoteCount,
        required this.posterUrl,
        required this.posterUrlPreview,
        this.ratingChange,
    });

    int filmId;
    String nameRu;
    String? nameEn;
    String year;
    String? filmLength;
    List<Country> countries;
    List<Genre> genres;
    String? rating;
    int? ratingVoteCount;
    String posterUrl;
    String posterUrlPreview;
    dynamic ratingChange;

    factory Film.fromJson(Map<String, dynamic> json) => Film(
        filmId: json["filmId"],
        nameRu: json["nameRu"],
        nameEn: json["nameEn"],
        year: json["year"],
        filmLength: json["filmLength"],
        countries: List<Country>.from(json["countries"].map((x) => Country.fromJson(x))),
        genres: List<Genre>.from(json["genres"].map((x) => Genre.fromJson(x))),
        rating: json["rating"],
        ratingVoteCount: json["ratingVoteCount"],
        posterUrl: json["posterUrl"],
        posterUrlPreview: json["posterUrlPreview"],
        ratingChange: json["ratingChange"],
    );

    Map<String, dynamic> toJson() => {
        "filmId": filmId,
        "nameRu": nameRu,
        "nameEn": nameEn,
        "year": year,
        "filmLength": filmLength,
        "countries": List<dynamic>.from(countries.map((x) => x.toJson())),
        "genres": List<dynamic>.from(genres.map((x) => x.toJson())),
        "rating": rating,
        "ratingVoteCount": ratingVoteCount,
        "posterUrl": posterUrl,
        "posterUrlPreview": posterUrlPreview,
        "ratingChange": ratingChange,
    };
}

class Country {
    Country({
        required this.country,
    });

    String country;

    factory Country.fromJson(Map<String, dynamic> json) => Country(
        country: json["country"],
    );

    Map<String, dynamic> toJson() => {
        "country": country,
    };
}

class Genre {
    Genre({
        required this.genre,
    });

    String genre;

    factory Genre.fromJson(Map<String, dynamic> json) => Genre(
        genre: json["genre"],
    );

    Map<String, dynamic> toJson() => {
        "genre": genre,
    };
}
