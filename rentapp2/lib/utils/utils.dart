import 'dart:io';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_storage/firebase_storage.dart';
import 'package:flutter/widgets.dart';
import 'package:gallery_picker/gallery_picker.dart';

Future<void> signInUserAnonFirebase() async{
  try {
    final userCredentails = await FirebaseAuth.instance.signInAnonymously();

  } catch (e) {
    print(e);
  }
}

Future<File?> getImageFromGallery(BuildContext context)async{
  try {
    List<MediaFile>? singleMedia = await GalleryPicker.pickMedia(context: context, singleMedia: true);
    return singleMedia?.first.getFile();
  } catch (e) {
    print(e);
  }

}

Future<bool> uploadImageForUser(File file) async{

  try {
    final userUid = FirebaseAuth.instance.currentUser?.uid;
    final storageRef = FirebaseStorage.instance.ref();
    final fileName = file.path.split("/").last;
    final timeStamp = DateTime.now().millisecondsSinceEpoch;
    final uploadRef = storageRef.child("$userUid/images/$timeStamp-$fileName");
    await uploadRef.putFile(file);
    return true;
  } catch (e) {
    print(e);
  }
  return false;
}