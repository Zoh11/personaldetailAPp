import 'package:flutter/material.dart';
import 'package:practice_app_firebasee/ui/PersonalDetail.dart';
import 'package:practice_app_firebasee/widgets/roundedbutton.dart';

class loginScreen extends StatefulWidget {
  const loginScreen({super.key});

  @override
  State<loginScreen> createState() => _loginScreenState();
}

class _loginScreenState extends State<loginScreen> {
  @override
  void dispose() {
    emailcontroller.dispose();
    passwordcontroller.dispose();
    super.dispose();
  }


  final _formkey = GlobalKey<FormState>();
  bool loading = false;
  final emailcontroller = TextEditingController();
  final passwordcontroller = TextEditingController();
  
  void personal() {
    setState(() {
      loading = true;
    });
    Navigator.push(
        context,
        MaterialPageRoute(
          builder: (context) =>  PersonaldetailScren(),
        ));
  }
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Login  screen'),
      ),
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 30),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Form(
                key: _formkey,
                child: Column(
                  children: [
                    TextFormField(
                      controller: emailcontroller,
                      decoration: InputDecoration(
                        hintText: 'Email',
                        border: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(34),
                        ),
                      ),
                      validator: (value) {
                        if (value!.isEmpty) {
                          return 'enter the Emial';
                        }else{
                          return null;
                        }
                       
                      },
                    ),
                    SizedBox(
                      height: 10,
                    ),
                    TextFormField(
                      controller: passwordcontroller,
                      decoration: InputDecoration(
                        hintText: 'Password',
                        border: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(34),
                        ),
                      ),
                      validator: (value) {
                        if (value!.isEmpty) {
                          return 'Enter the Password';
                        } else if (value.length < 6) {
                          return 'please enter 6 or more character password';
                        } else if (!RegExp(
                                r'^(?=.*[A-Z])(?=.*[a-z])(?=.*\d)(?=.*[!@#\$&*~]).{6,}$')
                            .hasMatch(value)) {
                          return 'Password must include upper, lower,\n digit, and special character';
                        } else {
                          return null;
                        }
                      },
                    )
                  ],
                )),
            SizedBox(
              height: 30,
            ),
            roundedButton(
              title: 'Login',
              loading: loading,
              onTap: () {
                if (_formkey.currentState!.validate()) {
                  personal();
                }
              },
            )
          ],
        ),
      ),
    );
  }
}
