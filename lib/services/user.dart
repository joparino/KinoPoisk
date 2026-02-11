import 'package:supabase_flutter/supabase_flutter.dart' show User;

class AuthUser{
  String? id;
  
  AuthUser.fromSupabase(User user){
    id = user.id;
  }
}
