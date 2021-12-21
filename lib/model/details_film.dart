class DetailsFilm {
    DetailsFilm({
        required this.kinopoiskId,
        required this.nameRu,
        required this.nameOriginal,
        required this.posterUrl,
        required this.posterUrlPreview,
        required this.ratingKinopoisk,
        required this.ratingImdb,
        required this.ratingFilmCritics,
        required this.webUrl,
        required this.year,
        required this.filmLength,
        required this.slogan,
        required this.description,
        required this.shortDescription,
        required this.ratingAgeLimits,
        required this.countries,
        required this.genres
    });

    int kinopoiskId;
    String nameRu;
    String nameOriginal;
    String posterUrl;
    String posterUrlPreview;
    double ratingKinopoisk;
    double ratingImdb;
    double ratingFilmCritics;
    String webUrl;
    int year;
    int filmLength;
    String slogan;
    String description;
    dynamic shortDescription;
    String ratingAgeLimits;
    List<Countrys> countries;
    List<Genre> genres;

    factory DetailsFilm.fromJson(Map<String, dynamic> json) => DetailsFilm(
        kinopoiskId: json["kinopoiskId"],
        nameRu: json["nameRu"],
        nameOriginal: json["nameOriginal"] ?? '',
        posterUrl: json["posterUrl"],
        posterUrlPreview: json["posterUrlPreview"],
        ratingKinopoisk: json["ratingKinopoisk"] ?? 0.0,
        ratingImdb: json["ratingImdb"] ?? 0.0,
        ratingFilmCritics: json["ratingFilmCritics"] ?? 0.0,
        webUrl: json["webUrl"],
        year: json["year"],
        filmLength: json["filmLength"] ?? 0,
        slogan: json["slogan"] ?? '',
        description: json["description"] ?? '',
        shortDescription: json["shortDescription"] ?? '',
        ratingAgeLimits: json["ratingAgeLimits"] ?? '',
        countries: List<Countrys>.from(json["countries"].map((x) => Countrys.fromJson(x))),
        genres: List<Genre>.from(json["genres"].map((x) => Genre.fromJson(x))),
    );

    Map<String, dynamic> toMap() => {
        "kinopoiskId": kinopoiskId,
        "nameRu": nameRu,
        "nameOriginal": nameOriginal,
        "posterUrl": posterUrl,
        "posterUrlPreview": posterUrlPreview,
        "ratingKinopoisk": ratingKinopoisk,
        "ratingImdb": ratingImdb,
        "ratingFilmCritics": ratingFilmCritics,
        "webUrl": webUrl,
        "year": year,
        "filmLength": filmLength,
        "slogan": slogan,
        "description": description,
        "shortDescription": shortDescription,
        "ratingAgeLimits": ratingAgeLimits,
        "countries": List<dynamic>.from(countries.map((x) => x.toMap())),
        "genres": List<dynamic>.from(genres.map((x) => x.toMap())),
    };
}

class Countrys {
    Countrys({
        required this.country,
    });

    String country;

    factory Countrys.fromJson(Map<String, dynamic> json) => Countrys(
        country: json["country"] ?? '',
    );

    Map<String, dynamic> toMap() => {
        "country": country,
    };
}

class Genre {
    Genre({
        required this.genre,
    });

    String genre;

    factory Genre.fromJson(Map<String, dynamic> json) => Genre(
        genre: json["genre"] ?? '',
    );

    Map<String, dynamic> toMap() => {
        "genre": genre,
    };
}