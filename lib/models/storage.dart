import 'dart:io';
import 'package:finance_manager/models/locator.dart';
import 'package:firebase_storage/firebase_storage.dart';
import 'auth_repo.dart';

class StorageRepo{
  FirebaseStorage storage = FirebaseStorage(storageBucket: "gs://financemanager-d2748.appspot.com");

AuthRepo _authrepo = locator.get<AuthRepo>();

  Future<String> uploadFile(File file) async{
    var user = _authrepo.getUser();
    var storageref = storage.ref().child("user/profile/$user.uid");
    var uploadTask = storageref.putFile(file);
    var completeTask = await uploadTask.onComplete;
    String downloadUrl = await completeTask.ref.getDownloadURL();

    return downloadUrl;
  }

  Future<String> getUserProfileImageDownloadUrl(String uid) async{
    var storageRef = storage.ref().child("user/profile/$uid");
    return await storageRef.getDownloadURL();
  }

}