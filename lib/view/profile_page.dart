import 'package:authentication/model/googleSignInModel.dart';
import 'package:flutter/material.dart';
import 'package:google_sign_in/google_sign_in.dart';
import 'package:provider/provider.dart';


class UserProfile extends StatefulWidget {
  //const UserProfile({Key? key}) : super(key: key);
  GoogleSignIn? googleSignIn;
  UserProfile({Key? key,this.googleSignIn}): super(key: key);
  @override
  _UserProfileState createState() => _UserProfileState(googleSignIn: googleSignIn);
}

class _UserProfileState extends State<UserProfile> {
  GoogleSignIn? googleSignIn;
  _UserProfileState({this.googleSignIn});

  @override
  Widget build(BuildContext context) {
    final user = Provider.of<UserList>(context);
    return Scaffold(
      body: Container(
        height: MediaQuery.of(context).size.height,
        width: 500,
        color: Colors.deepOrange,
        alignment: Alignment.center,
        child: SafeArea(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              CircleAvatar(
                backgroundImage: NetworkImage(
                  user.currentUser[0].photoUrl.toString(),
                ),
              ),
              Text(user.currentUser[0].displayName.toString()),
              Text(user.currentUser[0].email.toString()),
              Text(user.currentUser[0].id.toString()),
              Text(user.currentUser[0].token.toString()),
              ElevatedButton(
                onPressed: () async{
                  print(user.currentUser[0].email);
                  await googleSignIn!.disconnect();
                  user.remove();
                  Navigator.of(context).pop();
                },
                child: Text("Log Out"),
              ),
            ],
          ),
        ),
      ),
    );
  }
}