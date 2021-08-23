import 'package:flushbar/flushbar.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:gas_monitoring/config/data.dart';
import 'package:gas_monitoring/controllers/auth_controller.dart';
import 'package:gas_monitoring/controllers/user_controller.dart';
import 'package:gas_monitoring/models/user_model.dart';
import 'package:gas_monitoring/pages/home_page.dart';
import 'package:gas_monitoring/pages/signin_page.dart';
import 'package:gas_monitoring/widgets/app_button.dart';
import 'package:gas_monitoring/widgets/text.dart';
import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';

class SignUp extends StatefulWidget {
  static var tag = "/SignUp";

  @override
  SignUpState createState() => SignUpState();
}

class SignUpState extends State<SignUp> {
  bool successful = true;
  bool passwordVisible = false;
  bool isRemember = false;
  final formKey = new GlobalKey<FormState>();
  TextEditingController emailController2 = new TextEditingController();
  TextEditingController nameController = new TextEditingController();
  TextEditingController lastNameController = new TextEditingController();
  TextEditingController regController = new TextEditingController();
  TextEditingController passController = new TextEditingController();
  TextEditingController phoneNumberController = new TextEditingController();

  @override
  void initState() {
    super.initState();
    passwordVisible = false;
  }

  @override
  Widget build(BuildContext context) {
    AuthController auth = Get.find<AuthController>();
    UserController userController = Get.find<UserController>();
    var size = MediaQuery.of(context).size;

    var doRegister = () async {
      successful = true;
      //final form = formKey.currentState;
      var response = await auth.register(
              firstName: nameController.text,
              lastName: lastNameController.text,
              password: passController.text,
              email: emailController2.text,
              phoneNumber: phoneNumberController.text);
      if (response['status']) {
        User user = response['data'];
        userController.setUser(user);
        Get.off(HomePage());
      } else {
        setState(() {
          successful = false;
          Flushbar(
            title: "Registration Failed",
            message: response.toString(),
            duration: Duration(seconds: 10),
          ).show(context);
        });
        //auth.setRegisteredInStatus(Status.NotRegistered);
      }
    };

    var loading = Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: <Widget>[
        CircularProgressIndicator(),
        SizedBox(
          width: 20,
        ),
        Text(" Registering ... Please wait")
      ],
    );

    return Scaffold(
      body: Container(
        color: Colors.white,
        height: MediaQuery.of(context).size.height,
        child: SingleChildScrollView(
          child: Column(
            children: <Widget>[
              Container(
                padding: EdgeInsets.only(top: 20),
                height: (MediaQuery.of(context).size.height) / 3.5,
                child: Column(
                  children: <Widget>[
                    SizedBox(height: size.height * 0.05),
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
              Padding(
                padding: const EdgeInsets.fromLTRB(16, 0, 16, 0),
                child: TextField(
                  controller: nameController,
                  style: GoogleFonts.poppins(fontSize: 18.0),
                  obscureText: false,
                  decoration: InputDecoration(
                    contentPadding: EdgeInsets.fromLTRB(26, 18, 4, 18),
                    hintText: "First name",
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
                  controller: lastNameController,
                  style: GoogleFonts.poppins(fontSize: 18.0),
                  obscureText: false,
                  decoration: InputDecoration(
                    contentPadding: EdgeInsets.fromLTRB(26, 18, 4, 18),
                    hintText: "Last name",
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
                  controller: emailController2,
                  style: GoogleFonts.poppins(fontSize: 18.0),
                  obscureText: false,
                  decoration: InputDecoration(
                    contentPadding: EdgeInsets.fromLTRB(26, 18, 4, 18),
                    hintText: "Email",
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
                  controller: phoneNumberController,
                  style: GoogleFonts.poppins(fontSize: 18.0),
                  obscureText: false,
                  keyboardType: TextInputType.phone,
                  decoration: InputDecoration(
                    contentPadding: EdgeInsets.fromLTRB(26, 18, 4, 18),
                    hintText: "Phone number",
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
                  controller: passController,
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
              SizedBox(height: 35),
              Padding(
                padding: const EdgeInsets.fromLTRB(16, 0, 16, 0),
                child:
                    auth.registeredInStatus == Status.Registering && successful
                        ? loading
                        : AppButton(
                            textContent: 'Sign Up',
                            onPressed: () {
                              setState(() {
                               Get.off(HomePage());
                                //doRegister();
                              });
                            }),
              ),
              SizedBox(
                height: 20,
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: <Widget>[
                  text('I already have an account',
                      textColor: primaryColor),
                  Container(
                    margin: EdgeInsets.only(left: 4),
                    child: GestureDetector(
                        child: Text('Sign in',
                            style: GoogleFonts.poppins(
                              fontSize: 18.0,
                              color: primaryColor,
                            )),
                        onTap: () {
                          Navigator.pushReplacementNamed(context, SignIn.tag);
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
