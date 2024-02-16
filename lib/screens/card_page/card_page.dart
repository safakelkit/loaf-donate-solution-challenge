import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:sc/screens/card_page/constains.dart';

class CardPage extends StatefulWidget {
  const CardPage({super.key});

  @override
  State<CardPage> createState() => _CardPageState();
}

class _CardPageState extends State<CardPage> {
  
  TextEditingController donationAmountbyUser = TextEditingController();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        backgroundColor: Colors.black87,
        title: const Center(
          child: Text(
            "Donation",
            style: TextStyle(
              color: Colors.pink,
              fontWeight: FontWeight.w900,
              fontSize: 30.0,
              height: -0.4,
            ),
          ),
        ),
        toolbarHeight: 80.0,
        shape: const RoundedRectangleBorder(
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
                  const SizedBox(height: 30.0,),
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
                      prefixIcon: const Padding(
                        padding: EdgeInsets.symmetric(vertical: 10.0),
                        child: Icon(Icons.credit_card),
                      ),
                    ),
                  ),

                  const SizedBox(height: 16.0,),

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
                            prefixIcon: const Padding(
                              padding: EdgeInsets.symmetric(vertical: 10.0),
                              child: Icon(Icons.lock),
                            )
                          ),
                        )
                      ),

                      const SizedBox(width: 16.0,),

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
                            prefixIcon: const Padding(
                              padding: EdgeInsets.symmetric(vertical: 10.0),
                              child: Icon(Icons.calendar_month),
                            )
                          ),
                        ),
                      )
                    ],
                  ),

                  const SizedBox(height: 16.0,),

                  TextFormField(
                    keyboardType: TextInputType.number,
                    inputFormatters: [
                      FilteringTextInputFormatter.digitsOnly,
                      LengthLimitingTextInputFormatter(9),
                    ],
                    controller: donationAmountbyUser,
                    decoration: InputDecoration(
                      hintText: "Donation Amount",
                      enabledBorder: OutlineInputBorder(
                        borderSide: const BorderSide(color: Colors.grey),
                        borderRadius: BorderRadius.circular(20),
                      ),
                      prefixIcon: const Padding(
                        padding: EdgeInsets.symmetric(vertical: 10.0),
                        child: Icon(Icons.radio_button_checked),
                      )
                    ),
                  ),

                  const SizedBox(height: 50.0,),

                  ElevatedButton(
                    onPressed: (){
                      String donationAmount = donationAmountbyUser.text.trim();
                      if(donationAmount.isNotEmpty){
                        showDialog(
                          context: context,
                          builder: (BuildContext context){
                            return AlertDialog(
                              title: const Text("Donation Successful!"),
                              content: Text(
                                "The Donation Amount is: $donationAmount\$\nThanks for Donation!",
                                style: const TextStyle(
                                  fontSize: 17.0,
                                ),
                              ),
                              contentPadding: const EdgeInsets.only(left: 28.0, top: 22.0, right: 28.0),
                              actions: [
                                TextButton(
                                  onPressed: (){
                                    Navigator.of(context).pop();
                                  },
                                  child: const Text("Ok"),
                                )
                              ],
                            );
                          }
                        );
                      }
                    },
                    style: ElevatedButton.styleFrom(
                      backgroundColor: Colors.lightBlue, 
                      foregroundColor: Colors.white,
                      padding: const EdgeInsets.symmetric(horizontal: 38, vertical: 16),
                    ),
                    child: const Text(
                      "Donate",
                      style: TextStyle(
                        fontSize: 18.0,
                        fontWeight: FontWeight.w700,
                      ),
                      ),
                  ),
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

