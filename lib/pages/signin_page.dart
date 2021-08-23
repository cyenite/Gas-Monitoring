import 'package:flushbar/flushbar.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:gas_monitoring/config/data.dart';
import 'package:gas_monitoring/controllers/auth_controller.dart';
import 'package:gas_monitoring/controllers/user_controller.dart';
import 'package:gas_monitoring/models/user_model.dart';
import 'package:gas_monitoring/pages/signup_page.dart';
import 'package:gas_monitoring/widgets/app_button.dart';
import 'package:gas_monitoring/widgets/text.dart';
import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';

import 'home_page.dart';

final formKey = new GlobalKey<FormState>();
bool passwordVisible = false;
bool isRemember = false;
String _username, _password;
TextEditingController emailController = new TextEditingController();
TextEditingController passwordController = new TextEditingController();
var isPassword = true;

class SignIn extends StatefulWidget {
  static var tag = "/SignIn";

  @override
  SignInState createState() => SignInState();
}

class SignInState extends State<SignIn> {
  @override
  void initState() {
    super.initState();
    passwordVisible = false;
  }

  @override
  Widget build(BuildContext context) {
    bool successful = true;
    AuthController auth = Get.find<AuthController>();
    UserController userController = Get.find<UserController>();
    var size = MediaQuery.of(context).size;

    var loading = Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: <Widget>[
        CircularProgressIndicator(),
        SizedBox(
          width: 20,
        ),
        Text(" Authenticating ... Please wait")
      ],
    );

    var doLogin = () async {
      final form = formKey.currentState;
      if (form.validate()) {
        form.save();
        _username = emailController.text;
        _password = passwordController.text;

        Future<Map<String, dynamic>> successfulMessage =
            auth.login(_username, _password);

        successfulMessage.then((response) {
          if (response['status']) {
            User user = response['user'];
            userController.setUser(user);
            Get.off(HomePage());
          } else {
            setState(() {
              successful = false;
              Flushbar(
                title: "Failed Login",
                message: response['message']['message'].toString(),
                duration: Duration(seconds: 3),
              ).show(context);
            });
          }
        });
      } else {
        print("Form not valid");
      }
    };
    //changeStatusColor(Colors.transparent);
    return Scaffold(
      body: Container(
        color: Colors.white,
        height: MediaQuery.of(context).size.height,
        child: SingleChildScrollView(
          child: Column(
            children: <Widget>[
              SizedBox(height: 20),
              Form(
                key: formKey,
                child: Container(
                  height: (MediaQuery.of(context).size.height) / 3.5,
                  child: Stack(
                    children: <Widget>[
                      Center(
                        child: Container(
                          margin: EdgeInsets.all(16.0),
                          child: Column(
                            mainAxisAlignment: MainAxisAlignment.center,
                            crossAxisAlignment: CrossAxisAlignment.center,
                            children: <Widget>[
                              Text(
                                "Gas",
                                style: GoogleFonts.poppins(
                                    fontSize: 28,
                                    fontWeight: FontWeight.w600,
                                    color: Color(0xFF474747)),
                              ),
                              SizedBox(height: 4),
                              Text(
                                "Monitoring App",
                                style: GoogleFonts.poppins(
                                    fontSize: 14,
                                    fontWeight: FontWeight.w600,
                                    color: Color(0xFF6B6B6B)),
                              )
                            ],
                          ),
                        ),
                      )
                    ],
                  ),
                ),
              ),
              Container(
                alignment: Alignment.topRight,
                margin: EdgeInsets.only(right: 45),
                transform: Matrix4.translationValues(0.0, -40.0, 0.0),
              ),
              Padding(
                padding: const EdgeInsets.fromLTRB(16, 0, 16, 0),
                child: TextField(
                  controller: emailController,
                  style: GoogleFonts.poppins(fontSize: 18.0),
                  obscureText: false,
                  decoration: InputDecoration(
                    contentPadding: EdgeInsets.fromLTRB(26, 18, 4, 18),
                    hintText: "Enter Email",
                    filled: true,
                    fillColor: Color(0XFFF5F4F4),
                    enabledBorder: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(40),
                      borderSide: const BorderSide(
                          color: Color(0XFFF5F4F4), width: 0.0),
                    ),
                    focusedBorder: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(40),
                      borderSide: const BorderSide(
                          color: Color(0XFFF5F4F4), width: 0.0),
                    ),
                  ),
                ),
              ),
              SizedBox(height: 16),
              Padding(
                padding: const EdgeInsets.fromLTRB(16, 0, 16, 0),
                child: TextField(
                  controller: passwordController,
                  style: GoogleFonts.poppins(fontSize: 18.0),
                  obscureText: isPassword,
                  decoration: InputDecoration(
                    suffixIcon: new GestureDetector(
                      onTap: () {
                        setState(() {
                          isPassword = !isPassword;
                        });
                      },
                      child: new Icon(
                          isPassword ? Icons.visibility : Icons.visibility_off),
                    ),
                    contentPadding: EdgeInsets.fromLTRB(26, 18, 4, 18),
                    hintText: "Password",
                    filled: true,
                    fillColor: Color(0XFFF5F4F4),
                    enabledBorder: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(40),
                      borderSide: const BorderSide(
                          color: Color(0XFFF5F4F4), width: 0.0),
                    ),
                    focusedBorder: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(40),
                      borderSide: const BorderSide(
                          color: Color(0XFFF5F4F4), width: 0.0),
                    ),
                  ),
                ),
              ),
              SizedBox(height: 14),
              Row(
                mainAxisAlignment: MainAxisAlignment.end,
                crossAxisAlignment: CrossAxisAlignment.end,
                children: [
                  Container(
                    margin: EdgeInsets.only(right: 45),
                    child: text('Forgot Password'),
                  ),
                ],
              ),
              SizedBox(height: 14),
              Padding(
                padding: const EdgeInsets.fromLTRB(16, 0, 16, 0),
                child:
                    auth.loggedInStatus == Status.Authenticating && successful
                        ? loading
                        : AppButton(
                            textContent: 'Sign In',
                            onPressed: () {
                              setState(() {
                                doLogin();
                                /* Navigator.pushReplacementNamed(
                                context, OPBottomNavigationScreen.tag);*/
                              });
                            }),
              ),
              SizedBox(height: 14),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: <Widget>[
                  text('Don\'t have an account', textColor: primaryColor),
                  Container(
                    margin: EdgeInsets.only(left: 4),
                    child: GestureDetector(
                        child: Text('Sign up',
                            style: GoogleFonts.poppins(
                              fontSize: 18.0,
                              decoration: TextDecoration.underline,
                              color: primaryColor,
                            )),
                        onTap: () {
                          ///TODO:
                          ///Change this back ti SignUp.tag
                          Get.to(SignUp());
                        }),
                  )
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }
}
