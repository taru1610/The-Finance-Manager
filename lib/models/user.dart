  
class UserModel {
  String uid;
  String name;
  String avatarUrl;

  UserModel(this.uid, {this.name, this.avatarUrl});
}

class UserInfo{
  String name;
  String email;

  UserInfo({this.name,this.email});
}