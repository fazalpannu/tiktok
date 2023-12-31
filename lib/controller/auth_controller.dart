import 'dart:io';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:image_picker/image_picker.dart';
import 'package:tiktok/model/user.dart' as model;
import 'package:firebase_storage/firebase_storage.dart';
import 'package:get/get.dart';
import 'package:tiktok/constants.dart';
import 'package:tiktok/view/screen/homescreen.dart';

class AuthController extends GetxController {
  RxInt pageIdx = 0.obs;

  late Rx<File?> _pickedImage;
  RxString imagepath = ''.obs;
  // static AuthController instance = Get.find();
  File? get profilePhoto => _pickedImage.value;
  void pickImage() async {
    try {
      final pickedImage =
          await ImagePicker().pickImage(source: ImageSource.camera);
      if (pickedImage != null) {
        Get.snackbar('Profile Picture',
            'You have successfully selected your profile picture!');
      }
      _pickedImage = Rx<File?>(File(pickedImage!.path));
      imagepath.value = (pickedImage!.path).toString();
    } catch (e) {
      Get.snackbar(
        'Error ',
        e.toString(),
      );
    }
  }

  Future<String> _uploadToStorage(File image) async {
    Reference ref = firebaseStorage
        .ref()
        .child('profilePics')
        .child(firebaseAuth.currentUser!.uid);

    UploadTask uploadTask = ref.putFile(image);
    TaskSnapshot snap = await uploadTask;
    String downloadUrl = await snap.ref.getDownloadURL();
    return downloadUrl;
  }

  void loginUser(String email, String password) async {
    try {
      if (email.isNotEmpty && password.isNotEmpty) {
        await firebaseAuth
            .signInWithEmailAndPassword(email: email, password: password)
            .then((value) {
          Get.snackbar(' Login Successfully', '');
          Get.to(HomeScreen());
        });
      } else {
        Get.snackbar(
          'Error Logging in',
          'Please enter all the fields',
        );
      }
    } catch (e) {
      Get.snackbar(
        'Error Loggin gin',
        e.toString(),
      );
    }
  }

  void registerUser(
      String username, String email, String password, File? image) async {
    try {
      if (username.isNotEmpty &&
          email.isNotEmpty &&
          password.isNotEmpty &&
          image != null) {
        // save out user to our ath and firebase firestore
        UserCredential cred = await firebaseAuth.createUserWithEmailAndPassword(
          email: email,
          password: password,
        );
        String downloadUrl = await _uploadToStorage(image);
        model.User user = model.User(
          name: username,
          email: email,
          uid: cred.user!.uid,
          profilePhoto: downloadUrl,
        );
        await firestore
            .collection('users')
            .doc(cred.user!.uid)
            .set(user.toJson())
            .then((value) => Get.snackbar(
                  ' Create Account',
                  'Thank You!',
                ));
      } else {
        Get.snackbar(
          'Error Creating Account',
          'Please enter all the fields',
        );
      }
    } catch (e) {
      Get.snackbar(
        'Error Creating Account',
        e.toString(),
      );
    }
  }
}
