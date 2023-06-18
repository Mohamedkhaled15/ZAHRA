import 'package:bloc/bloc.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:google_sign_in/google_sign_in.dart';
import 'package:meta/meta.dart';

part 'google_sign_in_state.dart';

class GoogleSignInCubit extends Cubit<GoogleSignInState> {
  GoogleSignInCubit() : super(GoogleSignInInitial());


  final googleSignIn = GoogleSignIn();

  GoogleSignInAccount ? _user;

  GoogleSignInAccount get user => _user!;

  Future signInWithGoogle()async{

    final googleUser = await googleSignIn.signIn();
    if(googleUser == null)return;

    _user = googleUser;


    final googleAuth =await googleUser.authentication;

    final credential = GoogleAuthProvider.credential(
      idToken:googleAuth.idToken,
      accessToken: googleAuth.accessToken,
    );
     await FirebaseAuth.instance.signInWithCredential(credential);
  }
}
