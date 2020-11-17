import 'package:doap/Shared/constants.dart';
import 'package:flutter/material.dart';
import 'package:doap/Services/auth.dart';
import 'package:doap/Shared/loading.dart';

class Register extends StatefulWidget {
  final Function toggleView;
  Register({this.toggleView});
  @override
  _RegisterState createState() => _RegisterState();
}

class _RegisterState extends State<Register> {
  final AuthService _auth = AuthService();
  final _formKey = GlobalKey<FormState>();
  bool loading = false;
  // text field state
  String email = '';
  String password = '';
  String name = '';
  String error = '';
  @override
  Widget build(BuildContext context) {
    return loading ? Loading() : Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        backgroundColor: Colors.deepOrange[400],
        elevation: 0.0,
        actions: <Widget>[
          IconButton(
            icon: Icon(Icons.arrow_back),
            onPressed: () {
              widget.toggleView();
            },
          ),
        ],
        title: Text('Sign Up'),
      ),
      body: Container(
        padding: EdgeInsets.symmetric(vertical: 20.0, horizontal: 50.0),
        child: Form(
          key: _formKey,
          child: Column (
            children: <Widget>[
            SizedBox(height: 20.0),
            TextFormField(
              decoration: textInputDecoration.copyWith(hintText: 'Nome'),
              validator: (val) =>val.isEmpty ? 'Digite um nome' : null,
              onChanged: (val) {
                setState(()=> name = val);
              }
            ),
            SizedBox(height: 20.0),
            TextFormField(
              decoration: textInputDecoration.copyWith(hintText: 'Email'),
              validator: (val) =>val.isEmpty ? 'Digite um email' : null,
              onChanged: (val) {
                setState(()=> email = val);
              }
            ),
            SizedBox(height: 20.0),
            TextFormField(
              decoration: textInputDecoration.copyWith(hintText: 'Senha'),
              obscureText: true,
              validator: (val) =>val.length < 6 ? 'A senha deve conter pelo menos 6 caracteres' : null,
              onChanged: (val) {
                setState(()=> password = val);
              }
            ),
            SizedBox(height: 20.0),
            RaisedButton(
              color: Colors.pink,
              child: Text(
                'REGISTER',
                style: TextStyle(color: Colors.white),
                ),
                onPressed: () async {
                  if (_formKey.currentState.validate()) {
                    setState(() => loading = true);
                    dynamic result = await _auth.registerWithEmailAndPassword(name, email, password);
                    if (result == null) {
                      setState(() { 
                        error = 'Digite um email válido';
                        loading = false;
                      });
                    }
                  }
                }
            ),
            SizedBox(height: 12.0),
            Text(
              error,
              style: TextStyle(color: Colors.red, fontSize: 14.0),
            ),
            ],
          ),
        ),
        ),
    );
  }
}