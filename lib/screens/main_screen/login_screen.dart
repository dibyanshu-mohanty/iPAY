import 'package:flutter/material.dart';
import 'package:otp_text_field/otp_field_style.dart';
import 'package:payments_app/constants/constants.dart';
import 'package:payments_app/screens/mainframe.dart';
import 'package:otp_text_field/otp_field.dart';
import 'package:otp_text_field/style.dart';

class LoginScreen extends StatelessWidget {
  static const routeName = "/LoginScreen";
  LoginScreen({Key? key}) : super(key: key);

  final phoneNumberController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: Column(
        mainAxisAlignment: MainAxisAlignment.spaceAround,
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: [
          Column(
            children: const [
              Text("Welcome to",
                style: TextStyle(fontSize: 30.0, color: Colors.white),
                textAlign: TextAlign.center,),
              kSizedBox,
              Text("iPAY",style: TextStyle(fontSize: 60.0, color: Colors.white),
                textAlign: TextAlign.center,),
            ],
          ),
          Column(
            children: [
              Container(
                padding: const EdgeInsets.symmetric(horizontal: 10.0),
                margin: const EdgeInsets.all(10.0),
                child: TextField(
                  decoration: InputDecoration(
                      prefixIcon: Icon(
                      Icons.phone,
                      color: Theme.of(context).primaryColorDark,
                        size: 32.0,
                    ),
                    hintText: "Enter Phone Number",
                    hintStyle:
                        TextStyle(color: Theme.of(context).primaryColorDark,fontSize: 16.0),
                    border: InputBorder.none
                  ),
                style: TextStyle(fontSize: 22.0),
                keyboardType: TextInputType.phone,
                controller: phoneNumberController,
                cursorHeight: 25.0,
                cursorColor: Colors.white,
              ),
            ),
            kSizedBox,
            ElevatedButton(
              onPressed: () {
                if(phoneNumberController.text.length<10){
                  return;
                }
                showDialog(
                    context: context,
                    builder: (context) =>
                        Dialog(
                          backgroundColor: Colors.white,
                          insetAnimationCurve: Curves.slowMiddle,
                          insetAnimationDuration: Duration(seconds: 2),
                          child: Container(
                            height: MediaQuery.of(context).size.height * 0.45,
                            child: Column(
                              mainAxisAlignment: MainAxisAlignment.spaceAround,
                              children: [
                                Padding(
                                  padding: const EdgeInsets.all(8.0),
                                  child: OTPTextField(
                                    length: 5,
                                    width: MediaQuery.of(context).size.width,
                                    fieldWidth: 40,
                                    style: TextStyle(
                                        fontSize: 17,
                                      color: Colors.black
                                    ),
                                    textFieldAlignment: MainAxisAlignment.spaceAround,
                                    fieldStyle: FieldStyle.underline,
                                    onChanged: (pin){
                                      print("Completed: " + pin);
                                    },
                                    onCompleted: (pin) {
                                      print("Completed: " + pin);
                                    },
                                  ),
                                ),
                                TextButton(onPressed: (){
                                  Navigator.pushReplacement(context, MaterialPageRoute(builder: (context) => MainFrame()));
                                }, child: Text("Confirm OTP",style: TextStyle(color: Theme.of(context).primaryColorDark),))
                              ],
                            ),
                          ),
                        )
                );
              },
              child: const Padding(
                padding: EdgeInsets.symmetric(horizontal: 30.0, vertical: 10.0),
                child: Text(
                  "Get Code",
                  style: TextStyle(fontSize: 16.0),
                ),
              ),
              style: ButtonStyle(
                  backgroundColor:
                      MaterialStateProperty.all(Theme.of(context).primaryColorDark),
                  shape: MaterialStateProperty.all(RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(20.0),
                  ))),
            )
          ],
        ),
      ],
    ));
  }
}

