
import 'package:conditional_builder/conditional_builder.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:qrcode/Component.dart';
import 'package:qrcode/Homepage.dart';
import 'package:qrcode/LoginScreen.dart';
import 'package:qrcode/Map.dart';
import 'package:qrcode/RegCubit/Cubit.dart';
import 'package:qrcode/RegCubit/States.dart';
import 'package:qrcode/cubit.dart';
import 'package:qrcode/states.dart';

class RegisterScreen extends StatelessWidget {

  var formKey = GlobalKey<FormState>();

  var a;
  var b;
  var c;
  var d;

  @override
  Widget build(BuildContext context) {

    var UserNameController =TextEditingController();
    var emailAddressRegController =TextEditingController();
    var passwordRegController =TextEditingController();
    var PhoneNumController =TextEditingController();








    return BlocProvider(
      create: (BuildContext context) => QRRegisterCubit(),
      child: BlocConsumer<QRRegisterCubit , QRRegisterState>(
          listener: (BuildContext context, state) {


              if (state is QRRegisterSuccessState) {
                NavigatAndFinish(context, LoginScreen());
                Fluttertoast.showToast(
                  msg: 'Register successful',
                  toastLength: Toast.LENGTH_LONG,
                  gravity: ToastGravity.BOTTOM,
                  timeInSecForIosWeb: 5,
                  backgroundColor: Colors.green,
                  textColor: Colors.white,
                  fontSize: 16.0,
                );
              }


              if(state is QRRegisterErrorState){
                Fluttertoast.showToast(
                    msg: 'Register field',
                    toastLength: Toast.LENGTH_LONG,
                    gravity: ToastGravity.BOTTOM,
                    timeInSecForIosWeb: 5,
                    backgroundColor: Colors.red,
                    textColor: Colors.white,
                    fontSize: 16.0
                );
              }

          },
        builder: (BuildContext context , Object?state) {
          return Scaffold(
            appBar: AppBar(),
            body: Padding(
              padding: const EdgeInsets.all(8.0),
              child: Center(
                child: SingleChildScrollView(
                  child: Column(
                    children: [
                      Text(
                        'Registration',
                        style: TextStyle(
                          fontWeight: FontWeight.bold,
                          fontSize: 20.0,
                        ),
                      ),
                      SizedBox(
                        height: 50.0,
                      ),
                      TextFormField(
                        controller: UserNameController,
                        keyboardType: TextInputType.name,
                        validator: (value){
                          if(value!.isNotEmpty){
                            return 'error';
                          }
                        },
                        decoration: InputDecoration(
                          label: Text('User Name'),
                          prefixIcon:Icon(
                            Icons.person,
                          ),
                        ),
                      ),
                      SizedBox(
                        height: 10.0,
                      ),
                      TextFormField(
                        controller: emailAddressRegController,
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
                        controller: passwordRegController,
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
                      TextFormField(
                        controller: PhoneNumController,
                        keyboardType: TextInputType.phone,
                        validator: (value){
                          if(value!.isNotEmpty){
                            return 'error';
                          }
                        },
                        decoration: InputDecoration(
                          label: Text('Phone'),
                          prefixIcon:Icon(
                            Icons.phone,
                          ),
                        ),
                      ),
                      SizedBox(
                        height: 10.0,
                      ),
                      Container(
                        width: double.infinity,
                        child: ConditionalBuilder(
                          condition: state is! QRRegisterLoadingState,
                          builder: (context) => MaterialButton(onPressed: ()
                          {
                             // if(formKey.currentState!.validate()){
                              QRRegisterCubit.get(context).userRegister(
                                  name : UserNameController.text,
                                  email: emailAddressRegController.text,
                                  password: passwordRegController.text,
                                  phone : PhoneNumController.text,
                              );





                              QRRegisterCubit.get(context).userdelete(
                                  name: UserNameController.text,
                                  email: emailAddressRegController.text,
                                  phone: passwordRegController.text,
                                  Uid: PhoneNumController.text,

                              );


                          },
                            color: Colors.blue,
                            height : 50,
                            child: Text(
                              'Register',
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
