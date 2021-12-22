class Film {
    Film({
        required this.filmId,
        required this.posterUrl,
        required this.posterUrlPreview,
    });

    int filmId;
    String posterUrl;
    String posterUrlPreview;

    factory Film.fromJson(Map<String, dynamic> json) => Film(
        filmId: json["filmId"],
        posterUrl: json["posterUrl"],
        posterUrlPreview: json["posterUrlPreview"],
    );

    Map<String, dynamic> toJson() => {
        "filmId": filmId,
        "posterUrl": posterUrl,
        "posterUrlPreview": posterUrlPreview,
    };
}
