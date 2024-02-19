import 'package:flutter/material.dart';
import 'package:sc/screens/card_page/card_page.dart';

class MenuPage extends StatefulWidget {
  const MenuPage({super.key});

  @override
  State<MenuPage> createState() => _MenuPageState();
}

class _MenuPageState extends State<MenuPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        backgroundColor: Colors.blue,
        title: const Align(
          alignment: Alignment(-0.28, 0.0),
          child: Text(
            "Menu",
            style: TextStyle(
              color: Colors.white,
              fontWeight: FontWeight.w900,
              fontSize: 32.0,
              height: -0.4,
            )
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
        padding: const EdgeInsets.symmetric(horizontal: 100.0 , vertical: 115.0),
        child: Column(
          children: [
            const SizedBox(height: 30.0),
            ElevatedButton(
              onPressed: (){},
              style: ElevatedButton.styleFrom(
                backgroundColor: Colors.black,
                foregroundColor: Colors.red,
                fixedSize: const Size(200.0, 50.0),
              ),
              child: const Text(
                "Profile",
                style: TextStyle(
                  fontSize: 18.0,
                ),
              ),
              
            ),

            const SizedBox(height: 16.0,),

            ElevatedButton(
              onPressed: (){
                Navigator.push(
                  context,
                  MaterialPageRoute(builder: (context) => const CardPage()),
                );
              },
              
              style: ElevatedButton.styleFrom(
                backgroundColor: Colors.black,
                foregroundColor: Colors.red,
                fixedSize: const Size(200.0, 50.0),
              ),
              child: const Text(
                "Donation",
                style: TextStyle(
                  fontSize: 18.0,
                ),
              ),
            ),

            const SizedBox(height: 16.0,),

            ElevatedButton(
              onPressed: (){},
              
              style: ElevatedButton.styleFrom(
                backgroundColor: Colors.black,
                foregroundColor: Colors.red,
                fixedSize: const Size(200.0, 50.0),
              ),
              child: const Text(
                "Nearby Bakers",
                style: TextStyle(
                  fontSize: 18.0,
                ),
              ),
            ),

            const SizedBox(height: 16.0,),

            ElevatedButton(
              onPressed: (){},
              
              style: ElevatedButton.styleFrom(
                backgroundColor: Colors.black,
                foregroundColor: Colors.red,
                fixedSize: const Size(200.0, 50.0),
              ),
              child: const Text(
                "Ranking by Cities",
                style: TextStyle(
                  fontSize: 18.0,
                ),
              ),
            ),

            const SizedBox(height: 16.0,),

            ElevatedButton(
              onPressed: (){},
              
              style: ElevatedButton.styleFrom(
                backgroundColor: Colors.black,
                foregroundColor: Colors.red,
                fixedSize: const Size(200.0, 50.0),
              ),
              child: const Text(
                "Settings",
                style: TextStyle(
                  fontSize: 18.0,
                  
                ),
              ),
            ),
            
          ]
        )
      )
    );
  }
}