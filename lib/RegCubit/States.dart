

import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:qrcode/RegCubit/Cubit.dart';
import 'package:qrcode/Registeration_model.dart';
import 'package:qrcode/login_model.dart';

abstract class QRRegisterState {}


class QRRegisterInitialState extends QRRegisterState{}

class QRRegisterLoadingState extends QRRegisterState{}


class QRRegisterSuccessState extends QRRegisterState
{

}

class QRRegisterErrorState extends QRRegisterState{

  final String error ;

  QRRegisterErrorState(this.error);

}


class QRCreateSuccessState extends QRRegisterState {}

class QRCreateErrorState extends QRRegisterState{

  final String error ;

  QRCreateErrorState(this.error);

}


class QRDeleteState extends QRRegisterState {}