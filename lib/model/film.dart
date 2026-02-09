
class Film {
    Film({
        required this.filmId,
        required this.posterUrlPreview,
    });

    int filmId;
    String posterUrlPreview;

    factory Film.fromJson(Map<String, dynamic> json) => Film(
        filmId: json["filmId"],
        posterUrlPreview: json["posterUrlPreview"],
    );

    Map<String, dynamic> toJson() => {
        "filmId": filmId,
        "posterUrlPreview": posterUrlPreview,
    };
}


class FilmSearched {
    FilmSearched({
        required this.keyword,
        required this.films,
    });

    String? keyword;
    List<Film> films;

    factory FilmSearched.fromJson(Map<String, dynamic> json) => FilmSearched(
        keyword: json["keyword"] ?? '',
        films: List<Film>.from(json["films"].map((x) => Film.fromJson(x))),
    );

    Map<String, dynamic> toJson() => {
        "keyword": keyword,
        "films": List<dynamic>.from(films.map((x) => x.toJson())),
    };
}
