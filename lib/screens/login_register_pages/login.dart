import 'package:flutter/material.dart';
import '/screens/login_register_pages/register.dart';
import '/screens/menu_page/menu_page.dart';

class Login extends StatefulWidget {
  @override
  State<Login> createState() => _MyAppState();
}

class _MyAppState extends State<Login> {

  var userNameText = TextEditingController();
  var passwordText = TextEditingController();

  @override
  build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.black87,
        title: Center(
          child: Text(
            "Login",
            style: TextStyle(
              color: Colors.white,
              fontWeight: FontWeight.w900,
              fontSize: 32.0,
              height: -0.4,
            ),
          )
        ),
        toolbarHeight: 80.0,
        shape: const RoundedRectangleBorder(
          borderRadius: BorderRadius.vertical(
            bottom: Radius.circular(25.5),
          )
        )
      ),
      body: Padding(
        padding: EdgeInsets.all(30.0),
        child: Column(
          children: <Widget>[
            const SizedBox(height: 40.0),
            userName(),
            SizedBox(height: 18.0,),
            password(),
            SizedBox(height: 70.0),
            saveButton(),
            SizedBox(height: 16.0,),
            toRegister(),
          ],
        ),
      ),
    );
  }

  userName() {
    return TextField(
      decoration: 
        InputDecoration(
          labelText: "User Name",
          enabledBorder: OutlineInputBorder(
            borderSide: const BorderSide(color: Colors.grey),
            borderRadius: BorderRadius.circular(20.0),
          )
        ),
      controller: userNameText,
    );
  }

  password() {
    return TextField(
      decoration: 
        InputDecoration(
          labelText: "Password",
          enabledBorder: OutlineInputBorder(
            borderSide: const BorderSide(color: Colors.grey),
            borderRadius: BorderRadius.circular(20.0),
          )
        ),
      controller: passwordText,
    );
  }

  saveButton() {
    return ElevatedButton(
        onPressed: () {
          Navigator.push(
            context,
            MaterialPageRoute(builder: (context) => MenuPage())
          );
        },
        child: Text("LOGIN")
    );
  }

  toRegister(){
    return GestureDetector(
      onTap: (){
        Navigator.push(
          context,
          MaterialPageRoute(builder: (context) => SignUp()),
        );
      },
      child: Text(
        "Don't have an account, Register!",
        style: TextStyle(
          color: Colors.blue,
          decoration: TextDecoration.underline,
        ),
      )
    );
  }
}
