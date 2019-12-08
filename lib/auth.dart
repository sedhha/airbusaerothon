import 'package:firebase_auth/firebase_auth.dart';
import 'user.dart';
class AuthServices
{
  final FirebaseAuth _auth=FirebaseAuth.instance;
  User _userFromFirebaseUser(FirebaseUser user)
  {
    return user!=null?User(uid: user.uid):null;
  }
  Stream<User> get user {
    return _auth.onAuthStateChanged
        .map(_userFromFirebaseUser);
  }
  //sign in anonymous
  Future signInAnonymous()
  async
  {
    try {
      AuthResult result=await _auth.signInAnonymously();
      FirebaseUser user=result.user;
      return(_userFromFirebaseUser(user));
    }
    catch(e)
    {
      print(e.toString());
      return(null);

    }
  }
//Sign in with email
  Future registerWithEmailPassword(String email,String Password)
  async
  {
    try{
      AuthResult result=await _auth.createUserWithEmailAndPassword(
          email: email, password: Password);
      FirebaseUser user = result.user;
      return _userFromFirebaseUser(user);
    }
    catch(e)
    {
      print(e.toString());
      return null;

    }

  }
//register

  Future signInWithEmailPassword(String email,String Password)
  async
  {
    try{
      AuthResult result=await _auth.signInWithEmailAndPassword(
          email: email, password: Password);
      FirebaseUser user = result.user;
      if(user!=null)
        print('Success');
      else
        print('trying');
          }
    catch(e)
    {
      print(e.toString());
      return null;

    }

  }

//log out
  Future signOut() async
  {
    try{
      return await _auth.signOut();
    }
    catch(e)
    {
      print(e.toString());
      return null;
    }
  }
//get Luggage stream


}