import 'package:firebase_auth/firebase_auth.dart';
import 'package:taskyapp/core/network/result.dart';
import 'package:taskyapp/features/auth/data/model/user_model.dart';
import 'package:cloud_firestore/cloud_firestore.dart';

abstract class AuthFunctions {
  static CollectionReference<UserModel> get _getCollection {
    return FirebaseFirestore.instance
        .collection(UserModel.collection)
        .withConverter<UserModel>(
          fromFirestore: (snapshot, _) =>
              UserModel.fromJson(snapshot.data() ?? {}),
          toFirestore: (user, _) => user.toJson(),
        );
  }

  static Future<void> addUser(UserModel user) async {
    await _getCollection.doc(user.id).set(user);
  }

  static Future<Result<String>> loginUser({
    required String email,
    required String password,
  }) async {
    try {
      final user = await FirebaseAuth.instance.signInWithEmailAndPassword(
        email: email,
        password: password,
      );
      return Success<String>(user.user?.uid ?? "");
    } on FirebaseAuthException catch (e) {
      if (e.code == 'user-not-found') {
        return ErrorState<String>('USer not found please register now');
      } else {
        return ErrorState<String>('Worng password');
      }
    } catch (e) {
      return ErrorState<String>('Error');
    }
  }

  static Future<Result<UserModel>> registerUser({
    required UserModel user,
  }) async {
    try {
      final credential = await FirebaseAuth.instance
          .createUserWithEmailAndPassword(
            email: user.email ?? '',
            password: user.password ?? '',
          );
      user.id = credential.user?.uid;
      await AuthFunctions.addUser(user);
      return Success<UserModel>(user);
    } on FirebaseAuthException catch (e) {
      if (e.code == 'weak-password') {
        return ErrorState<UserModel>('The password provided is too weak.');
      } else{
        return ErrorState<UserModel>('The account already exists for that email.');
      }
    }
  }
}
