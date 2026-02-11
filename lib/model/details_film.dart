class DetailsFilm {
    static const String _tmdbImageBase = 'https://image.tmdb.org/t/p/w500';

    DetailsFilm({
        required this.kinopoiskId,
        required this.nameRu,
        required this.nameOriginal,
        required this.posterUrl,
        required this.posterUrlPreview,
        required this.ratingKinopoisk,
        required this.ratingImdb,
        required this.ratingFilmCritics,
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
    int year;
    int filmLength;
    String slogan;
    String description;
    dynamic shortDescription;
    String ratingAgeLimits;
    List<Countrys> countries;
    List<Genre> genres;

    static int _toInt(dynamic value, {int fallback = 0}) {
        if (value is int) return value;
        if (value is num) return value.toInt();
        if (value is String) return int.tryParse(value) ?? fallback;
        return fallback;
    }

    static double _toDouble(dynamic value, {double fallback = 0.0}) {
        if (value is double) return value;
        if (value is num) return value.toDouble();
        if (value is String) return double.tryParse(value) ?? fallback;
        return fallback;
    }

    factory DetailsFilm.fromJson(Map<String, dynamic> json) {
        final bool isTmdbPayload = json.containsKey('id') && json.containsKey('overview');

        if (!isTmdbPayload) {
            return DetailsFilm(
                kinopoiskId: _toInt(json["kinopoiskId"]),
                nameRu: (json["nameRu"] ?? '') as String,
                nameOriginal: (json["nameOriginal"] ?? '') as String,
                posterUrl: (json["posterUrl"] ?? '') as String,
                posterUrlPreview: (json["posterUrlPreview"] ?? '') as String,
                ratingKinopoisk: _toDouble(json["ratingKinopoisk"]),
                ratingImdb: _toDouble(json["ratingImdb"]),
                ratingFilmCritics: _toDouble(json["ratingFilmCritics"]),
                year: _toInt(json["year"]),
                filmLength: _toInt(json["filmLength"]),
                slogan: (json["slogan"] ?? '') as String,
                description: (json["description"] ?? 'No description yet.') as String,
                shortDescription: json["shortDescription"] ?? 'No description yet.',
                ratingAgeLimits: (json["ratingAgeLimits"] ?? '') as String,
                countries: List<Countrys>.from((json["countries"] ?? const []).map((x) => Countrys.fromJson(x as Map<String, dynamic>))),
                genres: List<Genre>.from((json["genres"] ?? const []).map((x) => Genre.fromJson(x as Map<String, dynamic>))),
            );
        }

        final String? posterPath = json["poster_path"] as String?;
        final String fullPosterUrl = posterPath == null ? '' : '$_tmdbImageBase$posterPath';

        final String? releaseDate = json["release_date"] as String?;
        final int parsedYear = (releaseDate != null && releaseDate.length >= 4)
            ? int.tryParse(releaseDate.substring(0, 4)) ?? 0
            : 0;

        final List<dynamic> tmdbCountries = (json["production_countries"] ?? const []) as List<dynamic>;
        final List<dynamic> tmdbGenres = (json["genres"] ?? const []) as List<dynamic>;

        return DetailsFilm(
            kinopoiskId: _toInt(json["id"]),
            nameRu: ((json["title"] ?? json["name"]) ?? '') as String,
            nameOriginal: (json["original_title"] ?? '') as String,
            posterUrl: fullPosterUrl,
            posterUrlPreview: fullPosterUrl,
            ratingKinopoisk: _toDouble(json["vote_average"]),
            ratingImdb: _toDouble(json["vote_average"]),
            ratingFilmCritics: 0.0,
            year: parsedYear,
            filmLength: _toInt(json["runtime"]),
            slogan: (json["tagline"] ?? '') as String,
            description: ((json["overview"] as String?)?.isNotEmpty ?? false)
                ? json["overview"] as String
                : 'No description yet.',
            shortDescription: ((json["tagline"] as String?)?.isNotEmpty ?? false)
                ? json["tagline"]
                : json["overview"],
            ratingAgeLimits: (json["adult"] == true) ? '18+' : '',
            countries: List<Countrys>.from(
                tmdbCountries.map((x) => Countrys.fromJson({"country": (x as Map<String, dynamic>)["name"] ?? ''})),
            ),
            genres: List<Genre>.from(
                tmdbGenres.map((x) => Genre.fromJson({"genre": (x as Map<String, dynamic>)["name"] ?? ''})),
            ),
        );
    }

    Map<String, dynamic> toMap() => {
        "kinopoiskId": kinopoiskId,
        "nameRu": nameRu,
        "nameOriginal": nameOriginal,
        "posterUrl": posterUrl,
        "posterUrlPreview": posterUrlPreview,
        "ratingKinopoisk": ratingKinopoisk,
        "ratingImdb": ratingImdb,
        "ratingFilmCritics": ratingFilmCritics,
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
        country: (json["country"] ?? '') as String,
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
        genre: (json["genre"] ?? '') as String,
    );

    Map<String, dynamic> toMap() => {
        "genre": genre,
    };
}
