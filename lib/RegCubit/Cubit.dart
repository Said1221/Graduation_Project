
// ignore_for_file: avoid_print

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:qrcode/RegCubit/States.dart';
import 'package:qrcode/RegisterScreen.dart';
import 'package:qrcode/Registeration_model.dart';
import 'package:qrcode/dio_helper.dart';
import 'package:qrcode/end_point.dart';
import 'package:qrcode/login_model.dart';
import 'package:qrcode/states.dart';


class QRRegisterCubit extends Cubit <QRRegisterState> {


  QRRegisterCubit() : super(QRRegisterInitialState());


  static QRRegisterCubit get(context) => BlocProvider.of(context);


  void userRegister({
    required String name,
    required String email,
    required String password,
    required String phone,
  }) {
    emit(QRRegisterLoadingState());
    FirebaseAuth.instance.createUserWithEmailAndPassword(
        email: email, password: password)
        .then((value) {
      print(value.user!.email);
      print(value.user!.uid);
      userCreate(
        name: name,
        email: email,
        phone: phone,
        Uid: value.user!.uid,
      );

      void dd(){
        userdelete(
          name: name,
          email: email,
          phone: phone,
          Uid: value.user!.uid,
        );
      };


      emit(QRRegisterSuccessState());
    })
        .catchError((error) {
      emit(QRRegisterErrorState(error.toString()));
    });
  }


  void userCreate({
    required String name,
    required String email,
    required String phone,
    required String Uid,
  }) {
    RegisterModel model = RegisterModel(
      name: name,
      email: email,
      phone: phone,
      Uid: Uid,
    );


    FirebaseFirestore.instance.collection('user').doc(Uid).set(model.toMap())
        .then((value) {
      emit(QRCreateSuccessState());
    })
        .catchError((error) {
      emit(QRCreateErrorState(error.toString()));
    });
  }






  userdelete({
    required String name,
    required String email,
    required String phone,
    required String Uid,
  }) {
    FirebaseFirestore.instance.collection('user').doc(Uid).delete()
        .then((value) {
      emit(QRCreateSuccessState());
    })
        .catchError((error) {
      emit(QRCreateErrorState(error.toString()));
    });
  }






}











