import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flok/model/details_film.dart';

class DatabaseService{
  static User? user = FirebaseAuth.instance.currentUser;
  final  _filmDetailsCollection = FirebaseFirestore.instance.collection(user!.uid.toString());


  Future addFilmIsWatched(DetailsFilm detailsFilm) async{
    Map<String, dynamic> map = {'kinopoiskId': detailsFilm.kinopoiskId, 
                                'posterUrlPreview': detailsFilm.posterUrlPreview, 
                                'isWatched': true, 
                                'isWanted': false};

    return await _filmDetailsCollection.doc((detailsFilm.kinopoiskId).toString()).set(map);
  }

  Future addFilmIsWanted(DetailsFilm detailsFilm) async{
    Map<String, dynamic> map = {'kinopoiskId': detailsFilm.kinopoiskId, 
                                'posterUrlPreview': detailsFilm.posterUrlPreview, 
                                'isWatched': false, 
                                'isWanted': true, 
                                'isLiked': false};

    return await _filmDetailsCollection.doc((detailsFilm.kinopoiskId).toString()).set(map);
  }

  Future addFilmIsLiked(DetailsFilm detailsFilm) async{
    Map<String, dynamic> map = {'kinopoiskId': detailsFilm.kinopoiskId, 
                                'posterUrlPreview': detailsFilm.posterUrlPreview, 
                                'isWatched': true, 
                                'isLiked': true};

    return await _filmDetailsCollection.doc((detailsFilm.kinopoiskId).toString()).set(map);
  }

  Future deleteFilm(DetailsFilm detailsFilm) async{
    return await _filmDetailsCollection.doc((detailsFilm.kinopoiskId).toString()).delete();
  }
}