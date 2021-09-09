import 'package:akafitness/screens/tab_screen.dart';
import 'package:flutter/material.dart';
import 'package:auto_size_text/auto_size_text.dart';

import './home_screen.dart';

import '../widgets/custom_text_field.dart';

class AuthScreen extends StatelessWidget {
  static const routeName = '/auth';
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.black,
      body: Column(
        children: [
          Expanded(
            child: Image.asset('assets/aka_logo.png'),
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
                  height: MediaQuery.of(context).size.height / 1.65,
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.stretch,
                    mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                    children: [
                      AutoSizeText(
                        'Login to your account',
                        maxLines: 1,
                        style: TextStyle(
                          fontSize: 15,
                          fontWeight: FontWeight.bold,
                          color: Colors.black.withOpacity(0.5),
                        ),
                      ),
                      CustomTextField(
                        labelText: 'Email',
                        prefixIcon: Icons.email_rounded,
                      ),
                      CustomTextField(
                        labelText: 'Password',
                        prefixIcon: Icons.lock_rounded,
                      ),
                      CheckboxListTile(
                        contentPadding: EdgeInsets.all(0),
                        value: true,
                        onChanged: (value) {},
                        title: Text('Remember Me'),
                        controlAffinity: ListTileControlAffinity.leading,
                      ),
                      Container(
                        height: MediaQuery.of(context).size.height / 15,
                        decoration: BoxDecoration(
                          color: Color.fromRGBO(229, 49, 35, 1),
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
