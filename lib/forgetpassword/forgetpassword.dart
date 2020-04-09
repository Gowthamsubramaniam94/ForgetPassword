import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';
import 'package:flutter_forgetpassword/forgetpassword/otpverification.dart';

class ForgetPassword extends StatefulWidget {
  @override
  _ForgetPasswordState createState() => _ForgetPasswordState();
}

class _ForgetPasswordState extends State<ForgetPassword> {
  TextEditingController _controller = new TextEditingController();

  final formKey = GlobalKey<FormState>();
  bool _validate = false;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: _getAppbar,
      body: uiDesign(),
    );
  }

  uiDesign() {
    return Container(
      margin: EdgeInsets.all(10.0),
      child: Form(
        autovalidate: _validate,
        key: formKey,
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          mainAxisAlignment: MainAxisAlignment.start,
          children: <Widget>[
            Padding(
              padding: EdgeInsets.all(10.0),
              child: Text(
                'Forget Password?',
                style: TextStyle(fontSize: 50.0, fontWeight: FontWeight.bold),
              ),
            ),
            Padding(
              padding: EdgeInsets.all(20.0),
              child: Text('Please enter your registered \nEmail ID to get OTP',
                  textAlign: TextAlign.center,
                  style: new TextStyle(
                      fontSize: 18.0,
                      color: Colors.black,
                      fontWeight: FontWeight.w600)),
            ),
            Padding(
              padding: EdgeInsets.all(10.0),
              child: TextFormField(
                validator: validateEmail,
                maxLines: 1,
                textInputAction: TextInputAction.done,
                autocorrect: false,
                controller: _controller,
                decoration: InputDecoration(
                    contentPadding: EdgeInsets.fromLTRB(20.0, 15.0, 20.0, 15.0),
                    hintText: "Email ID",
                    labelText: "Email ID",
                    border: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(30.0))),
              ),
            ),
            Padding(
                padding: EdgeInsets.all(10.0),
                child: Material(
                  elevation: 5.0,
                  color: Colors.black,
                  borderRadius: BorderRadius.circular(30.0),
                  child: MaterialButton(
                    onPressed: () {
                      sendEmail();
                    },
                    minWidth: MediaQuery.of(context).size.width,
                    padding: EdgeInsets.fromLTRB(20.0, 15.0, 20.0, 15.0),
                    child: Text(
                      'Send OTP',
                      textAlign: TextAlign.center,
                      style: TextStyle(
                          fontWeight: FontWeight.bold, color: Colors.white),
                    ),
                  ),
                ))
          ],
        ),
      ),
    );
  }

  // Returns "Appbar"
  get _getAppbar {
    return new AppBar(
      backgroundColor: Colors.transparent,
      elevation: 0.0,
      leading: new InkWell(
        borderRadius: BorderRadius.circular(30.0),
        child: new Icon(
          Icons.arrow_back,
          color: Colors.black54,
        ),
        onTap: () {
          Navigator.pop(context);
        },
      ),
    );
  }

  String validateEmail(String value) {
    Pattern pattern =
        r'^(([^<>()[\]\\.,;:\s@\"]+(\.[^<>()[\]\\.,;:\s@\"]+)*)|(\".+\"))@((\[[0-9]{1,3}\.[0-9]{1,3}\.[0-9]{1,3}\.[0-9]{1,3}\])|(([a-zA-Z\-0-9]+\.)+[a-zA-Z]{2,}))$';
    RegExp regex = new RegExp(pattern);
    if (value.length == 0) {
      return 'Please enter your email id';
    } else if (!regex.hasMatch(value))
      return 'Please enter a valid email id';
    else
      return null;
  }

  sendEmail() {
    if (formKey.currentState.validate()) {
      Navigator.of(context)
          .push(MaterialPageRoute(builder: (context) => OtpVerification()));
    } else {
      setState(() {
        _validate = true;
      });
    }
  }
}
