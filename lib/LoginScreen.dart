
import 'package:conditional_builder/conditional_builder.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_database/firebase_database.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:qrcode/Component.dart';
import 'package:qrcode/Homepage.dart';
import 'package:qrcode/RegCubit/States.dart';
import 'package:qrcode/RegisterScreen.dart';
import 'package:qrcode/User.dart';
import 'package:qrcode/cubit.dart';
import 'package:qrcode/states.dart';

class LoginScreen extends StatelessWidget {

  var formKey = GlobalKey<FormState>();

  @override
  Widget build(BuildContext context) {
    var emailAddressController =TextEditingController();
    var passwordController =TextEditingController();

    return BlocProvider(
      create: (BuildContext context) => QRLoginCubit(),
      child: BlocConsumer<QRLoginCubit , QRLoginState>(
          listener: (BuildContext context, state) {

            if(state is QRLoginErrorState){
              Fluttertoast.showToast(
                  msg: 'Invalid user',
                  toastLength: Toast.LENGTH_LONG,
                  gravity: ToastGravity.BOTTOM,
                  timeInSecForIosWeb: 5,
                  backgroundColor: Colors.red,
                  textColor: Colors.white,
                  fontSize: 16.0
              );
            }

             if(state is QRLoginSuccessState){
              NavigatAndFinish(context , usre());
              Fluttertoast.showToast(
                  msg: 'login successful',
                  toastLength: Toast.LENGTH_LONG,
                  gravity: ToastGravity.BOTTOM,
                  timeInSecForIosWeb: 5,
                  backgroundColor: Colors.green,
                  textColor: Colors.white,
                  fontSize: 16.0
              );
            }
          },
        builder: (BuildContext context , Object? state) {
          return Scaffold(
            appBar: AppBar(
            ),

            body: Padding(
              padding: const EdgeInsets.all(8.0),
              child: Center(
                child: SingleChildScrollView(
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: [
                      Text(
                        'Login Screeen',
                        style: TextStyle(
                          fontWeight: FontWeight.bold,
                          fontSize: 20.0,
                        ),
                      ),
                      SizedBox(
                        height: 50.0,
                      ),
                      TextFormField(
                        controller: emailAddressController,
                        keyboardType: TextInputType.emailAddress,
                        validator: (value){
                          if(value!.isNotEmpty){
                            return 'error';
                          }
                        },
                        decoration: InputDecoration(
                          label: Text('Email Address'),
                          prefixIcon:Icon(
                            Icons.email_outlined,
                          ),
                        ),
                      ),
                      SizedBox(
                        height: 10.0,
                      ),
                      TextFormField(
                        controller: passwordController,
                        keyboardType: TextInputType.visiblePassword,
                        obscureText: true,
                        validator: (value){
                          if(value!.isNotEmpty){
                            return 'error';
                          }
                        },
                        decoration: InputDecoration(
                          label: Text('Password'),
                          prefixIcon:Icon(
                            Icons.lock,
                          ),
                        ),
                      ),
                      Container(
                        width: double.infinity,
                        child: ConditionalBuilder(
                          condition: state is! QRLoginLoadingState,
                          builder: (context) => MaterialButton(onPressed: ()
                          {

                             // if(formKey.currentState!.validate()){
                              QRLoginCubit.get(context).userLogin(email: emailAddressController.text, password: passwordController.text);
                             // }

                          },
                            color: Colors.blue,
                            height : 50,
                            child: Text(
                              'Login',
                              style: TextStyle(
                                color: Colors.white,
                              ),
                            ),
                          ),
                          fallback: (context) => Center(child: CircularProgressIndicator()),
                        ),
                        decoration: BoxDecoration(
                          borderRadius:BorderRadius.circular(5.0),
                        ),
                      ),
                      SizedBox(
                        height: 15.0,
                      ),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Text('Don\'t have an account ?'),
                          TextButton(onPressed: ()
                          {
                            navigateTo(context , RegisterScreen());
                          },
                            child: Text('Register'),
                          ),
                        ],
                      ),
                    ],
                  ),
                ),
              ),
            ),
          );
        }
      ),
    );
  }
}
