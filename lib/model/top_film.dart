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
