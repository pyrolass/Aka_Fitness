import 'package:flutter/material.dart';
import 'package:auto_size_text/auto_size_text.dart';
import 'package:flutter/widgets.dart';
import './tab_screen.dart';

import '../widgets/custom_text_field.dart';

class AuthScreen extends StatefulWidget {
  static const routeName = '/auth';

  @override
  State<AuthScreen> createState() => _AuthScreenState();
}

class _AuthScreenState extends State<AuthScreen> {
  final emailController = TextEditingController();

  final passController = TextEditingController();

  bool checkBox = false;

  void setCheckBoxValue(bool val) {
    checkBox = !checkBox;
  }

  @override
  void dispose() {
    emailController.dispose();
    passController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.black,
      body: Column(
        children: [
          Expanded(
            child: Image.asset('assets/images/aka_logo.png'),
          ),
          Expanded(
            flex: 2,
            child: Container(
              padding: EdgeInsets.all(20),
              width: MediaQuery.of(context).size.width,
              decoration: BoxDecoration(
                color: Colors.white,
                borderRadius: BorderRadius.only(
                  topLeft: Radius.circular(20),
                  topRight: Radius.circular(20),
                ),
              ),
              child: SingleChildScrollView(
                child: Container(
                  height: MediaQuery.of(context).size.height * 0.6,
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.stretch,
                    mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                    children: [
                      AutoSizeText(
                        'Login to your account',
                        maxLines: 1,
                        textAlign: TextAlign.center,
                        style: TextStyle(
                          fontSize: 15,
                          fontWeight: FontWeight.bold,
                          color: Colors.black.withOpacity(0.5),
                        ),
                      ),
                      CustomTextField(
                        controller: emailController,
                        isPass: false,
                        labelText: 'Email',
                        prefixIcon: Icons.email_rounded,
                        inputAction: TextInputAction.next,
                      ),
                      CustomTextField(
                        controller: passController,
                        labelText: 'Password',
                        prefixIcon: Icons.lock_rounded,
                        inputAction: TextInputAction.done,
                        isPass: true,
                      ),
                      CheckboxListTile(
                        contentPadding: EdgeInsets.all(0),
                        value: checkBox,
                        onChanged: (value) {
                          setState(() {
                            checkBox = value;
                          });
                        },
                        title: Text(
                          'Remember Me',
                          style: TextStyle(
                            fontSize: 17,
                          ),
                        ),
                        controlAffinity: ListTileControlAffinity.leading,
                      ),
                      Container(
                        height: MediaQuery.of(context).size.height / 15,
                        decoration: BoxDecoration(
                          color: Theme.of(context).primaryColor,
                          borderRadius: BorderRadius.circular(10),
                          boxShadow: [
                            BoxShadow(
                              color: Colors.black.withOpacity(0.20),
                              blurRadius: 7.0,
                              offset: Offset(0, 3),
                            ),
                          ],
                        ),
                        child: TextButton(
                          onPressed: () {
                            Navigator.pushReplacementNamed(
                                context, TabScreen.routeName);
                          },
                          child: Text(
                            'Login',
                            style: TextStyle(
                              fontSize: 22,
                              color: Colors.white,
                              fontWeight: FontWeight.bold,
                            ),
                          ),
                        ),
                      )
                    ],
                  ),
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
