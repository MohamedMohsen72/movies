
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:netfliex/features/auth/view_model/auth_states.dart';

class AuthCubit extends Cubit<AuthStates> {
  AuthCubit() : super(AuthInitStates());

  //register as patient
  registerpatient(
      String name, String email, String password) async {
    emit(RegisterLoadingStates());
    try {
      final credential =
          await FirebaseAuth.instance.createUserWithEmailAndPassword(
        email: email,
        password: password,
      );
      User user = credential.user!;
      await user.updateDisplayName(name);

      FirebaseFirestore.instance.collection('user').doc(user.uid).set({
        'name': name,
        'email': email,
        'image': '',
        'phone': '',
      }, SetOptions(merge: true));//قابل للتعديل
      emit(RegisterSuccessStates());
    } on FirebaseAuthException catch (e) {
      if (e.code == 'weak-password') {
        emit(RegisterErrorStates(error: 'كلمه المرور ضعيفه'));
      } else if (e.code == 'email-already-in-use') {
        emit(RegisterErrorStates(error: 'الحساب موجود بالفعل'));
      } else {
        emit(RegisterErrorStates(error: 'حدثت مشكله ف التسجيل'));
      }
    }
  }

  Login(String email, String password) async {
    try {
      await FirebaseAuth.instance.signInWithEmailAndPassword(
          email: email,
          password: password

      );
      emit(LoginSuccessStates());
    } on FirebaseAuthException catch (e) {
      if (e.code == 'user-not-found') {
        emit(LoginErrorStates(error: 'الحساب غير موجود'));
      } else if (e.code == 'wrong-password') {
        emit(LoginErrorStates(error: 'كلمه السر خاطئه'));
      }
    }
  }


}


