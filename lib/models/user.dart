  
class UserModel {
  String uid;
  String displayName;
  String avatarUrl;

  UserModel(this.uid, {this.displayName, this.avatarUrl});
}

class UserInfo{
  String name;
  String email;

  UserInfo({this.name,this.email});
}