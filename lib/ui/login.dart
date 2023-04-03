
import 'package:flutter/material.dart';
import 'package:petmutualaid/models/mymodels.dart';
import 'package:petmutualaid/services/authservice.dart';
import 'package:petmutualaid/services/constants.dart';
import 'package:petmutualaid/ui/home.dart';
import 'package:petmutualaid/ui/signup.dart';

class loginUI extends StatefulWidget {
  const loginUI({Key? key}) : super(key: key);

  @override
  State<loginUI> createState() => _loginUIState();
}

class _loginUIState extends State<loginUI> {
  ///
  final _formKey = GlobalKey<FormState>();
  ///
  TextEditingController emailController = TextEditingController();
  ///
  TextEditingController passwordController = TextEditingController();
  /// Function to Login
  void loginF(){
    ///
    String result = loginFF(emailController.text, passwordController.text);
    ///
    if(result == globalSuccessMsg){
      /// Navigate to Home Page
      Navigator.of(context).pushAndRemoveUntil(MaterialPageRoute(builder: ((context)=> const HomeUI())), (route) => false);
    }
    ///
    ScaffoldMessenger.of(context).showSnackBar(
      SnackBar(content: Text(result)),
    );
    ///
  }
  ///
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("LOGIN"),
        actions: [
          Padding(
              padding: const EdgeInsets.only(right: 20.0),
              child: TextButton(onPressed: () {
                Navigator.of(context).pushAndRemoveUntil(MaterialPageRoute(builder: ((context)=> const signUpUI())), (route) => false);
              },child:const Text("REGISTER",style: TextStyle(color: Colors.white),))
          ),
        ],
      ),
      body: Form(
        key: _formKey,
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 8, vertical: 16),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              Padding(
                padding:
                const EdgeInsets.symmetric(horizontal: 8, vertical: 16),
                child: TextFormField(
                  controller: emailController,
                  decoration: const InputDecoration(
                      border: OutlineInputBorder(), labelText: "Email"),
                  validator: (value) {
                    if (value == null || value.isEmpty) {
                      return 'Please enter your email';
                    }
                    return null;
                  },
                ),
              ),
              Padding(
                padding:
                const EdgeInsets.symmetric(horizontal: 8, vertical: 16),
                child: TextFormField(
                  controller: passwordController,
                  //obscureText: true,
                  decoration: const InputDecoration(
                      border: OutlineInputBorder(), labelText: "Password"),
                  validator: (value) {
                    if (value == null || value.isEmpty) {
                      return 'Please enter your password';
                    }
                    return null;
                  },
                ),
              ),
              Padding(
                padding:
                const EdgeInsets.symmetric(horizontal: 8, vertical: 16.0),
                child: Center(
                  child: ElevatedButton(
                    onPressed: () {
                      if (_formKey.currentState!.validate()) {
                        // Navigate the user to the Home page
                        loginF();
                      } else {
                        ScaffoldMessenger.of(context).showSnackBar(
                          const SnackBar(content: Text('Please fill input')),
                        );
                      }
                    },
                    child: const Text('LOGIN'),
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
