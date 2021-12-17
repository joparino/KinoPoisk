class FilmSearched {
    FilmSearched({
        required this.keyword,
        required this.films,
    });

    String? keyword;
    List<FilmS> films;

    factory FilmSearched.fromJson(Map<String, dynamic> json) => FilmSearched(
        keyword: json["keyword"] ?? '',
        films: List<FilmS>.from(json["films"].map((x) => FilmS.fromJson(x))),
    );

    Map<String, dynamic> toJson() => {
        "keyword": keyword,
        "films": List<dynamic>.from(films.map((x) => x.toJson())),
    };
}

class FilmS {
    FilmS({
        required this.filmId,
        required this.nameRu,
        required this.nameEn,
        required this.year,
        required this.description,
        required this.filmLength,
        required this.countries,
        required this.genres,
        required this.rating,
        required this.posterUrl,
        required this.posterUrlPreview,
    });

    int filmId;
    String nameRu;
    String nameEn;
    String year;
    String description;
    String filmLength;
    List<Country> countries;
    List<Genre> genres;
    String rating;
    String posterUrl;
    String posterUrlPreview;

    factory FilmS.fromJson(Map<String, dynamic> json) => FilmS(
        filmId: json["filmId"],
        nameRu: json["nameRu"]??'',
        nameEn: json["nameEn"] ?? '',
        year: json["year"],
        description: json["description"]??'',
        filmLength: json["filmLength"]??'',
        countries: List<Country>.from(json["countries"].map((x) => Country.fromJson(x))),
        genres: List<Genre>.from(json["genres"].map((x) => Genre.fromJson(x))),
        rating: json["rating"],
        posterUrl: json["posterUrl"],
        posterUrlPreview: json["posterUrlPreview"],
    );

    Map<String, dynamic> toJson() => {
        "filmId": filmId,
        "nameRu": nameRu,
        "nameEn": nameEn,
        "year": year,
        "description": description,
        "filmLength": filmLength,
        "countries": List<dynamic>.from(countries.map((x) => x.toJson())),
        "genres": List<dynamic>.from(genres.map((x) => x.toJson())),
        "rating": rating,
        "posterUrl": posterUrl,
        "posterUrlPreview": posterUrlPreview,
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
