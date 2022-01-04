import 'package:authentication/model/googleSignInModel.dart';
import 'package:authentication/view/profile_page.dart';
import 'package:flutter/material.dart';

import 'package:flutter_signin_button/button_view.dart';
import 'package:flutter_signin_button/flutter_signin_button.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:google_sign_in/google_sign_in.dart';
import 'package:provider/provider.dart';

class LogIn extends StatefulWidget {
  const LogIn({Key? key}) : super(key: key);

  @override
  _LogInState createState() => _LogInState();
}

class _LogInState extends State<LogIn> {
  @override
  Widget build(BuildContext context) {
    final size=MediaQuery.of(context).size;
    return Container(
      height: size.height,
      width: size.width,
      color: Colors.deepOrange,
      child: Scaffold(
        appBar: AppBar(
          title: Text("Log In with Google"),
        ),
        body: Stack(
          children: [
            Align(
              alignment: Alignment.center,
              child: SizedBox(
                height: 20,
                child: SignInButton(
                  Buttons.Google,
                  onPressed: (){
                    _googleSignInProcess(context);
                  },
                ),
              ),
            ),
          ],
        ),
        //_googleSignInProcess(context),
      ),
    );
  }
}

void _googleSignInProcess(BuildContext context) async {
  GoogleSignIn _googleSignIn = GoogleSignIn();
  GoogleSignInAccount? googleUser = await _googleSignIn.signIn();
  GoogleSignInAuthentication? googleAuth = await googleUser?.authentication;
  String? token = googleAuth?.idToken;

  Provider.of<UserList>(context,listen: false).addUser(
    googleUser?.displayName,
    googleUser?.email,
    googleUser?.photoUrl,
    googleUser?.id,
    token,
  );
  Fluttertoast.showToast(
    msg: googleUser!.email,
    backgroundColor: Colors.blue,
    //fontSize: 50,
    textColor: Colors.white,
  );
  //print(user.currentUser);
  Navigator.of(context).push(MaterialPageRoute(builder: (builder)=>UserProfile(googleSignIn: _googleSignIn,)));
}