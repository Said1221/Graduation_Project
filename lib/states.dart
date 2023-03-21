

import 'package:qrcode/login_model.dart';

abstract class QRLoginState {}


class QRLoginInitialState extends QRLoginState{}

class QRLoginLoadingState extends QRLoginState{}


class QRLoginSuccessState extends QRLoginState
   {
     // late final QRLoginModel loginModel;
     // QRLoginSuccessState(this.loginModel);
   }

class QRLoginErrorState extends QRLoginState{

  final String error ;

  QRLoginErrorState(this.error);

}