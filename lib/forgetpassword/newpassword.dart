import 'package:flutter/material.dart';

class NewPassword extends StatefulWidget {
  @override
  _NewPasswordState createState() => _NewPasswordState();
}

class _NewPasswordState extends State<NewPassword> {
  TextEditingController _newPasswordcontroller = new TextEditingController();
  TextEditingController _confirmPasswordcontroller =
      new TextEditingController();

  final formKey = GlobalKey<FormState>();
  bool _validate = false;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: _getAppbar,
      body: uiDesign(),
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

  uiDesign() {
    return Container(
        margin: EdgeInsets.all(10.0),
        child: Form(
          autovalidate: _validate,
          key: formKey,
          child: Column(
            mainAxisAlignment: MainAxisAlignment.start,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: <Widget>[
              Padding(
                padding: EdgeInsets.all(10.0),
                child: Text(
                  'New \nPassword',
                  style: TextStyle(fontSize: 50.0, fontWeight: FontWeight.bold),
                ),
              ),
              Padding(
                padding: EdgeInsets.all(10.0),
                child: TextFormField(
                  validator: validateNewPwd,
                  maxLines: 1,
                  obscureText: true,
                  textInputAction: TextInputAction.done,
                  autocorrect: false,
                  controller: _newPasswordcontroller,
                  decoration: InputDecoration(
                      contentPadding:
                          EdgeInsets.fromLTRB(20.0, 15.0, 20.0, 15.0),
                      hintText: "New password",
                      labelText: "New password",
                      border: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(30.0))),
                ),
              ),
              Padding(
                padding: EdgeInsets.all(10.0),
                child: TextFormField(
                  validator: validateConfirmPwd,
                  maxLines: 1,
                  obscureText: true,
                  textInputAction: TextInputAction.done,
                  autocorrect: false,
                  controller: _confirmPasswordcontroller,
                  decoration: InputDecoration(
                      contentPadding:
                          EdgeInsets.fromLTRB(20.0, 15.0, 20.0, 15.0),
                      hintText: "Confirm password",
                      labelText: "Confirm password",
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
                        submit();
                      },
                      minWidth: MediaQuery.of(context).size.width,
                      padding: EdgeInsets.fromLTRB(20.0, 15.0, 20.0, 15.0),
                      child: Text(
                        'Submit',
                        textAlign: TextAlign.center,
                        style: TextStyle(
                            fontWeight: FontWeight.bold, color: Colors.white),
                      ),
                    ),
                  ))
            ],
          ),
        ));
  }

  String validateNewPwd(String value) {
    if (value.length == 0) {
      return 'Please enter new password';
    } else if (value.length < 5) {
      return 'Password must be 6 characters';
    } else
      return null;
  }

  String validateConfirmPwd(String value) {
    if (value.length == 0) {
      return 'Please enter confirm password';
    } else if (value.length < 5) {
      return 'Password must be 6 characters';
    } else if (_newPasswordcontroller.text != value) {
      return 'Password not matched';
    } else
      return null;
  }

  void submit() {
    if (formKey.currentState.validate()) {
      print('Successfully verified');
    } else {
      setState(() {
        _validate = true;
      });
    }
  }
}
