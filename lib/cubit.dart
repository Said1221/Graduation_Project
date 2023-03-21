
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:qrcode/dio_helper.dart';
import 'package:qrcode/login_model.dart';
import 'package:qrcode/states.dart';

class QRLoginCubit extends Cubit <QRLoginState>{


  QRLoginCubit() : super(QRLoginInitialState());


  static QRLoginCubit get(context) => BlocProvider.of(context);




      void userLogin({
        required String email ,
        required String password ,
      })

      {

        emit(QRLoginLoadingState());
        FirebaseAuth.instance.signInWithEmailAndPassword(email: email, password: password)
        .then((value){
          emit(QRLoginSuccessState());
        }).catchError((error){
          emit(QRLoginErrorState(error.toString()));
        });












    // DioHelper.postData(url: LOGIN ,
    //     data:
    //     {
    //       'email' : email,
    //       'password' : password,
    //     }, token: '',
    // ).then((value) {
    //   print(value.data);
    //   QRLoginModel loginModel;
    //   loginModel = QRLoginModel.fromJson(value.data);
    //   print(loginModel.data);
    //   print(loginModel.status);
    //   print(loginModel.message);
    //   print(loginModel.data.token);
      // emit(QRLoginSuccessState(loginModel));
    // }).catchError((error){
    //   emit(QRLoginErrorState(error.toString()));
    // });
    //
      }

}


