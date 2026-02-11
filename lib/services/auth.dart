import 'package:flok/pages/auth/landing.dart';
import 'package:flok/services/user.dart';
import 'dart:async';
import 'package:flutter/foundation.dart';
import 'package:supabase_flutter/supabase_flutter.dart' hide AuthUser;

class AuthService {
  final supabase = Supabase.instance.client;
  Stream<AuthUser?> get currentUser {
    return supabase.auth.onAuthStateChange.map((authState) {
      final user = authState.session?.user;
      return user == null ? null : AuthUser.fromSupabase(user);
    });
  }

  Future<AuthUser?> signInWithEmailAndPassword(String email, String password) async {
    try {
      final auth = await supabase.auth
          .signInWithPassword(email: email, password: password)
          .timeout(const Duration(seconds: 20));
      final user = auth.user;
      debugPrint('signInWithEmailAndPassword: user=${user?.id}, hasSession=${auth.session != null}');
      return user == null ? null : AuthUser.fromSupabase(user);
    } on TimeoutException {
      debugPrint('signInWithEmailAndPassword timeout: request took more than 20s');
      return null;
    } on AuthException catch (e) {
      debugPrint('signInWithEmailAndPassword AuthException: ${e.message}');
      return null;
    } catch (e) {
      debugPrint('signInWithEmailAndPassword error: $e');
      return null;
    }
  }

  Future<AuthUser?> registerWithEmailAndPassword(String email, String password) async {
    try {
      final auth = await supabase.auth
          .signUp(email: email, password: password)
          .timeout(const Duration(seconds: 20));
      final user = auth.user;
      debugPrint('registerWithEmailAndPassword: user=${user?.id}, hasSession=${auth.session != null}');
      if (auth.session == null) {
        debugPrint('registerWithEmailAndPassword: session is null (usually email confirmation is required)');
      }
      return user == null ? null : AuthUser.fromSupabase(user);
    } on TimeoutException {
      debugPrint('registerWithEmailAndPassword timeout: request took more than 20s');
      return null;
    } on AuthException catch (e) {
      debugPrint('registerWithEmailAndPassword AuthException: ${e.message}');
      return null;
    } catch (e) {
      debugPrint('registerWithEmailAndPassword error: $e');
      return null;
    }
  }
  
  Future logOut() async {
    await supabase.auth.signOut();
    return const Landing();
  }

}
