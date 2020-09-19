  
import 'dart:io';
import 'package:finance_manager/models/locator.dart';
import 'package:finance_manager/models/storage.dart';
import 'package:finance_manager/models/user.dart';
import 'auth_repo.dart';

class UserController {
  StorageRepo _storageRepo = locator.get<StorageRepo>();
  UserModel _currentUser;
  AuthRepo _authRepo = locator.get<AuthRepo>();
  Future init;

  UserController() {
    init = initUser();
  }

  Future<UserModel> initUser() async {
    _currentUser = await _authRepo.getUser();
    return _currentUser;
  }

  UserModel get currentUser => _currentUser;

  Future<void> uploadProfilePicture(File image )async{
    _currentUser.avatarUrl = await _storageRepo.uploadFile(image);
  }

  Future<String> getDownloadUrl() async{
    return await _storageRepo.getUserProfileImageDownloadUrl(currentUser.uid);
  }

  Future<void> signInWithEmailAndPassword({String email, String password}) async{
    _currentUser = await _authRepo.signInWithEmailAndPassword(email: email,password: password);
    _currentUser.avatarUrl = await getDownloadUrl();
  }

}