import 'package:firebase_auth/firebase_auth.dart' as FirebaseAuth show User;
import 'package:flutter/foundation.dart';
import 'package:sossu/property/profile_info.dart';

@immutable
class AuthUser {
  final String? email;
  final bool isEmailVerified;
  final Profile _profile = Profile();

  AuthUser({
    required this.email,
    required this.isEmailVerified,
  });

  // create authuser from firebase user
  factory AuthUser.fromFirebase(FirebaseAuth.User user) => 
    AuthUser(
        email: user.email,
        isEmailVerified: user.emailVerified,
      );

  Profile get profile => _profile;
}