import 'package:flutter/services.dart';
import 'package:retrieval_practice/blocs/bloc_base.dart';

import 'package:firebase_auth/firebase_auth.dart';

enum SignUpResponseStatus { SUCCESS, EMAIL_ALREADY_IN_USE }

enum LoginResponseStatus {SUCCESS, USER_NOT_FOUND, WRONG_PASSWORD}

class AuthBloc extends BlocBase {
  final FirebaseAuth _auth = FirebaseAuth.instance;

  FirebaseUser _loggedInUser;

  Future<FirebaseUser> get loggedInUser async {
    if (_loggedInUser != null) return _loggedInUser;
    return _auth.currentUser();
  }

  Future<SignUpResponseStatus> signUpWithEmailAndPassword(
      email, password) async {
    FirebaseUser user;
    try {
      user = (await _auth.createUserWithEmailAndPassword(
              email: email, password: password))
          .user;
    } on PlatformException catch (e) {
      if (e.code == 'ERROR_EMAIL_ALREADY_IN_USE') {
        return SignUpResponseStatus.EMAIL_ALREADY_IN_USE;
      }
    }

    _loggedInUser = user;
    return SignUpResponseStatus.SUCCESS;
  }

  Future<bool> isSignedIn() async {
    var theUser = await _auth.currentUser();
    return theUser != null;
  }

  logout() async {
    _loggedInUser = null;
    return await _auth.signOut();
  }



  Future<LoginResponseStatus> loginWithEmailAndPassword(email, pwd) async {

    FirebaseUser user;
    try {
      user = (await _auth.signInWithEmailAndPassword(email: email, password: pwd)).user;
    } on PlatformException catch (e) {
      if (e.code == 'ERROR_USER_NOT_FOUND') {
        return LoginResponseStatus.USER_NOT_FOUND;
      } else if (e.code == 'ERROR_WRONG_PASSWORD') {
        return LoginResponseStatus.WRONG_PASSWORD;
      }
    }

    _loggedInUser = user;
    return LoginResponseStatus.SUCCESS;
  }




  @override
  void dispose() {
    // TODO: implement dispose
  }
}
