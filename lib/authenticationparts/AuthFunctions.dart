import 'package:firebase_auth/firebase_auth.dart';
import 'package:quiz_app/library.dart' as lib;

void registerUser(String email, String password) async{
  UserCredential credential;
  try{
    credential = await FirebaseAuth.instance.createUserWithEmailAndPassword(
        email: email,
        password: password
    );
    lib.credential = credential;
  } on FirebaseAuthException catch (e) {
    if(e.code == "email-already-in-use"){
      print("email address ${email} is already in use");
    }else if(e.code == "invalid-email"){
      print("email address is invalid");
    }else if(e.code == "operation-not-allowed"){
      print("operation isn't allowed");
    }else if(e.code == "weak-password"){
      print("this password isn't secure");
    }else{
      print("we didn't write a special message for this error. here's the error code: ${e.code}");
    }

  } catch(e){
    print(e);
  }

  throw Error();//fuck you you handle it
}

void signInUser(String email, String password) async{
  UserCredential credential;
  try{
    credential = await FirebaseAuth.instance.signInWithEmailAndPassword(
        email: email,
        password: password
    );
    lib.credential = credential;
  }on FirebaseAuthException catch (e){
    if(e.code == "wrong-password"){
      print("wrong password");
    }else if(e.code == "invalid-email"){
      print("invalid email");
    }else if(e.code == "user-disabled"){
      print("this user is disabled");
    }else if(e.code == "user-not-found"){
      print("this user doesn't exist");
    }else{
      print(e.code);
    }
  }catch(e){
    print(e);
  }
}