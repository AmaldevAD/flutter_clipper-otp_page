import 'package:flutter/material.dart';
import 'package:pin_code_text_field/pin_code_text_field.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      debugShowCheckedModeBanner: false,
      home: Scaffold(
        body: Home(),
      ),
    );
  }
}

class Home extends StatefulWidget {
  @override
  _HomeState createState() => _HomeState();
}

class _HomeState extends State<Home> {
  var _otp;

  TextEditingController _controller;

  @override
  Widget build(BuildContext context) {
    return ListView(
      children: <Widget>[
        Stack(
          children: <Widget>[
            ClipOval(
              clipper: CustomOva(),
              child: Container(
                color: Colors.red,
                width: 300.0,
                height: 300.0,
              ),
            ),
            Padding(
              padding: const EdgeInsets.only(top: 70, left: 90),
              child: Container(
                width: 220,
                height: 220,
                decoration: new BoxDecoration(
                  color: Colors.red,
                  borderRadius:
                      new BorderRadius.all(new Radius.circular(200.0)),
                  border: new Border.all(
                    color: Colors.white,
                    width: 8.0,
                  ),
                ),
                child: Icon(
                  Icons.message,
                  color: Colors.white,
                  size: 80,
                ),
              ),
            ),


            Padding(
              padding: const EdgeInsets.only(top: 300.0),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: <Widget>[
                  Center(
                    child: Text(
                      "Enter OTP",
                      style:
                          TextStyle(fontSize: 25, fontWeight: FontWeight.bold),
                    ),
                  ),
                  Center(
                    child: Padding(
                      padding: const EdgeInsets.only(top: 5.0),
                      child: Text(
                        "We have sent you access code",
                        style: TextStyle(fontSize: 14, color: Colors.black54),
                      ),
                    ),
                  ),
                  Center(
                    child: Padding(
                      padding: const EdgeInsets.only(top: 5.0),
                      child: Text(
                        "Via SMS for mobile number Verification",
                        style: TextStyle(fontSize: 14, color: Colors.black54),
                      ),
                    ),
                  ),
                  Center(
                    child: Padding(
                      padding: EdgeInsets.only(top: 24.0),
                      child: PinCodeTextField(
                        controller: _controller,
                        pinBoxWidth: 55,
                        defaultBorderColor: Colors.red,
                        maxLength: 4,
                        pinTextStyle: TextStyle(fontSize: 18.0),
                        onTextChanged: (text) {
                          setState(() {
                            _otp = text;
                          });
                        },
                      ),
                    ),
                  ),
                  Center(
                    child: Padding(
                      padding: const EdgeInsets.only(top: 43),
                      child: Container(
                        width: 220,
                        height: 49,
                        child: RaisedButton(
                          shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(17)),
                          color: Colors.red,
                          child: Text(
                            "Continue",
                            style: TextStyle(
                                color: Colors.white,
                                backgroundColor: Colors.red,
                                fontSize: 20),
                          ),
                          onPressed: () {
                            showMessage(context, _otp);
                          },
                        ),
                      ),
                    ),
                  ),
                 Padding(
                      padding: const EdgeInsets.only(top: 30.0),
                      child: Text(
                        "Didn't Recieve the OTP ?",
                        style: TextStyle(fontSize: 14, color: Colors.black54),
                      ),
                    ),
                  
                 

                      FlatButton(
                        
                        child: Text("Resend access code",
                            style: TextStyle(
                                fontSize: 14, color: Colors.red[300])),
                        onPressed: () {
                          var dialog = AlertDialog(
                            title: Text("Succesfull"),
                            content: Text("Otp have sended to your phone"),
                            actions: <Widget>[
                              RaisedButton(
                                  child: Text(
                                    "ok",
                                    style: TextStyle(color: Colors.white),
                                  ),
                                  onPressed: () {
                                    Navigator.of(context).pop();
                                  })
                            ],
                          );
                          showDialog(
                              context: context,
                              builder: (context) {
                                return dialog;
                              });
                        },
                      ),
                  
                ],
              ),
            ),
          ],
        ),
      ],
    );
  }
}

showMessage(BuildContext context, var message) {
  var dialog = AlertDialog(
    title: message.toString().length == 4 && message != null
        ? Text("Succesfull")
        : Text("Invalid"),
    content:
        message.toString().length == 4 ? Text("entered otp is $message") : null,
    actions: <Widget>[
      RaisedButton(
          child: Text(
            "ok",
            style: TextStyle(color: Colors.white),
          ),
          onPressed: () {
            Navigator.of(context).pop();
          })
    ],
  );
  showDialog(
      context: context,
      builder: (context) {
        return dialog;
      });
}

class CustomOva extends CustomClipper<Rect> {
  @override
  Rect getClip(Size size) {
    Rect rect = Rect.fromLTRB(-280.0, -1000.0, size.width, size.height);
    return rect;
  }

  @override
  bool shouldReclip(CustomOva oldClipper) => true;
}
