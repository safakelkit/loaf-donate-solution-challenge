import 'dart:ui';

import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:sc/screens/card_page/constains.dart';

class CardPage extends StatefulWidget {
  const CardPage({super.key});

  @override
  State<CardPage> createState() => _CardPageState();
}

class _CardPageState extends State<CardPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        backgroundColor: Colors.black87,
        title: Center(
          child: Text(
            "Donation",
            style: TextStyle(
              color: Colors.pink,
              fontWeight: FontWeight.w900,
              fontSize: 27.0,
            ),
          ),
        ),
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.vertical(
            bottom: Radius.circular(25.5),
          )
        )
      ),
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: defaultPadding, vertical: 30.0), 
        child: Column(
          children: [
            Form(
              child: Column(
                children: [
                  TextFormField(
                    keyboardType: TextInputType.number,
                    inputFormatters: [
                      FilteringTextInputFormatter.digitsOnly,
                      LengthLimitingTextInputFormatter(16),
                      CardNumberInputFormatter(),
                    ],
                    decoration: InputDecoration(
                      hintText: "Card Number",
                      enabledBorder: OutlineInputBorder(
                        borderSide: const BorderSide(color: Colors.grey),
                        borderRadius: BorderRadius.circular(20),
                      ),
                      prefixIcon: Padding(
                        padding: const EdgeInsets.symmetric(vertical: 10.0),
                        child: Icon(Icons.credit_card),
                      ),
                    ),
                  ),

                  SizedBox(height: 16.0,),
                  Row(
                    children: [
                      Expanded(
                        child: TextFormField(
                          keyboardType: TextInputType.number,
                          inputFormatters: [
                            FilteringTextInputFormatter.digitsOnly,
                            LengthLimitingTextInputFormatter(3),
                          ],
                          decoration: InputDecoration(
                            hintText: "CVV",
                            enabledBorder: OutlineInputBorder(
                              borderSide: const BorderSide(color: Colors.grey),
                              borderRadius: BorderRadius.circular(20),
                            ),
                            prefixIcon: Padding(
                              padding: const EdgeInsets.symmetric(vertical: 10.0),
                              child: Icon(Icons.lock),
                            )
                          ),
                        )
                      ),
                      SizedBox(width: 16.0,),
                      Expanded(
                        child: TextFormField(
                          keyboardType: TextInputType.number,
                          inputFormatters: [
                            FilteringTextInputFormatter.digitsOnly,
                            LengthLimitingTextInputFormatter(4),
                            DateNumberInputFormatter(),
                          ],
                          decoration: InputDecoration(
                            hintText: "Date",
                            enabledBorder: OutlineInputBorder(
                              borderSide: const BorderSide(color: Colors.grey),
                              borderRadius: BorderRadius.circular(20),
                            ),
                            prefixIcon: Padding(
                              padding: const EdgeInsets.symmetric(vertical:10.0),
                              child: Icon(Icons.calendar_today),
                            )
                          ),
                        )
                      )
                    ],
                  )
                ],
              ),
            )
          ]
        )
      )
    );
  }
}

class CardNumberInputFormatter extends TextInputFormatter{

  @override
  TextEditingValue formatEditUpdate(
    TextEditingValue oldValue, TextEditingValue newValue){
      if (newValue.selection.baseOffset == 0){
        return newValue;
      }

      String inputData = newValue.text;
      StringBuffer buffer = StringBuffer();

      for(var i = 0; i < inputData.length; i++){
        buffer.write(inputData[i]);
        int index = i + 1;

        if (index % 4 == 0 && inputData.length != index){
          buffer.write("  ");
        }
      }
      return TextEditingValue(
        text: buffer.toString(),
        selection: TextSelection.collapsed(offset: buffer.toString().length,),
      );
    }
}

class DateNumberInputFormatter extends TextInputFormatter{

  @override
  TextEditingValue formatEditUpdate(
    TextEditingValue oldValue, TextEditingValue newValue){
      if (newValue.selection.baseOffset == 0){
        return newValue;
    }
    String inputData = newValue.text;
    StringBuffer buffer = StringBuffer();

    for(var i = 0; i < inputData.length; i++){
      buffer.write(inputData[i]);
      int index = i + 1;

      if(index % 2 == 0 && inputData.length != index){
        buffer.write("/");
      }
    }
    return TextEditingValue(
      text: buffer.toString(),
      selection: TextSelection.collapsed(offset: buffer.toString().length,),
    );
  }
}

