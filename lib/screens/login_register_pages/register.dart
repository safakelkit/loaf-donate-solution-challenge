import 'package:flutter/material.dart';

class SignUp extends StatefulWidget {
  @override
  State<SignUp> createState() => _MyAppState();
}

class _MyAppState extends State<SignUp> {

  var nameText = TextEditingController();
  var surNameText = TextEditingController();
  var mailText = TextEditingController();
  var passwordText = TextEditingController();

  @override
  build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.black87,
        title: Align(
          alignment: Alignment(-0.32, 0.0),
          child: Text(
            "Sign Up",
            style: TextStyle(
              color: Colors.pink,
              fontWeight: FontWeight.w900,
              fontSize: 32.0,
              height: -0.4,
            ),
          ),
        ),
        toolbarHeight: 80.0,
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.vertical(
            bottom: Radius.circular(25.5),
          )
        ),
      ),
      body: Padding(
        padding: EdgeInsets.all(30.0),
        child: Column(
          children: <Widget>[
            name(),
            surName(),
            mail(),
            password(),
            SizedBox(height: 50),
            Text("User Type"),
            userType(),
            SizedBox(height: 50),
            saveButton(),
          ],
        ),
      ),
    );
  }

  name() {
    return TextField(
      decoration: InputDecoration(labelText: "Name"),
      controller: nameText,
    );
  }

  surName() {
    return TextField(
      decoration: InputDecoration(labelText: "Surname"),
      controller: surNameText,
    );
  }

  mail() {
    return TextField(
      decoration: InputDecoration(labelText: "Mail"),
      controller: mailText,
    );
  }

  password() {
    return TextField(
      decoration: InputDecoration(labelText: "Password"),
      controller: passwordText,
    );
  }

  userType(){
    return DropdownButton(
      items: const [
        DropdownMenuItem(child: Text("Baker"), value: "Baker"),
        DropdownMenuItem(child: Text("Donor"), value: "Donor"),
        DropdownMenuItem(child: Text("User"), value: "User"),
      ], onChanged: (value) {},
    );
  }

  saveButton() {
    return ElevatedButton(
        onPressed: () {
  
        },
        child: Text("SIGN UP")
    );
  }
}