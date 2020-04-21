
import 'package:retrieval_practice/blocs/bloc_base.dart';

import 'package:firebase_auth/firebase_auth.dart';

class AuthBloc extends BlocBase {

  final FirebaseAuth _auth = FirebaseAuth.instance;


  Future<FirebaseUser> signUpWithEmailAndPassword(email, password) async {
    return (await _auth.createUserWithEmailAndPassword(
      email: email,
      password: password,
    )).user;
  }





  @override
  void dispose() {
    // TODO: implement dispose
  }




}