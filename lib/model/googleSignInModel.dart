import 'package:flutter/cupertino.dart';

class ResGoogleSignInModel with ChangeNotifier{
  String? displayName;
  String? email;
  String? photoUrl;
  String? id;
  String? token;

  ResGoogleSignInModel({
    this.displayName,
    this.email,
    this.photoUrl,
    this.id,
    this.token,
  });


  ResGoogleSignInModel.fromJson(Map<String, dynamic> json){
    displayName = json['displayName'];
    email = json['email'];
    photoUrl = json['photoUrl'];
    id = json['id'];
    token = json['token'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['displayName'] = this.displayName;
    data['email'] = this.email;
    data['photoUrl'] = this.photoUrl;
    data['id'] = this.id;
    data['token'] = this.token;
    return data;
  }
}

   class UserList with ChangeNotifier{
    List<ResGoogleSignInModel> _users=[

     ];

     void addUser(String? displayName,String? email,String? photoUrl,String? id,String? token){
       final user=ResGoogleSignInModel(
      displayName: displayName,
      email: email,
      photoUrl: photoUrl,
      id: id,
      token: token,
    );
    _users.add(user);
    notifyListeners();
  }
  List<ResGoogleSignInModel> get currentUser{
    return _users;
  }
  void remove()async{
    await _users.remove(1);
    notifyListeners();
  }
}