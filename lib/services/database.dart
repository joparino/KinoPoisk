import 'dart:collection';

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flok/model/details_film.dart';
import 'package:flok/services/auth.dart';
import 'package:flok/services/user.dart';
import 'package:provider/provider.dart';

class DatabaseService{
  static User? user = FirebaseAuth.instance.currentUser;
  final  _filmDetailsCollection = FirebaseFirestore.instance.collection(user!.uid.toString());


  Future addFilmIsWatched(DetailsFilm detailsFilm) async{
    Map<String, dynamic> map = HashMap();
    map.addAll({'kinopoiskId': detailsFilm.kinopoiskId});
    map.addAll({'posterUrlPreview': detailsFilm.posterUrlPreview});
    map.addAll({'isWatched': 1});
    map.addAll({'isWanted': 0});

    return await _filmDetailsCollection.doc((detailsFilm.kinopoiskId).toString()).set(map);
  }

  Future addFilmIsWanted(DetailsFilm detailsFilm) async{
    Map<String, dynamic> map = HashMap();
    map.addAll({'kinopoiskId': detailsFilm.kinopoiskId});
    map.addAll({'posterUrlPreview': detailsFilm.posterUrlPreview});
    map.addAll({'isWatched': 0});
    map.addAll({'isWanted': 1});
    map.addAll({'isLiked': 0});

    return await _filmDetailsCollection.doc((detailsFilm.kinopoiskId).toString()).set(map);
  }

  Future addFilmIsLiked(DetailsFilm detailsFilm) async{
    Map<String, dynamic> map = HashMap();
    map.addAll({'kinopoiskId': detailsFilm.kinopoiskId});
    map.addAll({'posterUrlPreview': detailsFilm.posterUrlPreview});
    map.addAll({'isWatched': 1});
    map.addAll({'isWanted': 0});
    map.addAll({'isLiked': 1});

    return await _filmDetailsCollection.doc((detailsFilm.kinopoiskId).toString()).set(map);
  }

  Future deleteFilm(DetailsFilm detailsFilm) async{

    return await _filmDetailsCollection.doc((detailsFilm.kinopoiskId).toString()).delete();
  }
}