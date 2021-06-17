import 'package:flutter/material.dart';

class DetailScreen extends StatefulWidget {

  final String name;
  final String email;
  final String contactNumber;
  DetailScreen({this.name, this.email, this.contactNumber});

  @override
  _DetailScreenState createState() => _DetailScreenState();
}

class _DetailScreenState extends State<DetailScreen> {

  String _name;
  String _email;
  String _contactNumber;

  @override
  Widget build(BuildContext context) {

    _name = widget.name;
    _email = widget.email;
    _contactNumber = widget.contactNumber;

    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.white,
        leading: IconButton(
          icon: Icon(Icons.arrow_back, color: Colors.black),
          onPressed: () => Navigator.of(context).pop(),
        ),
      ),
      body: SafeArea(
        child: Center(
          child: Row(
            children: [
              Expanded(
                child: Container(
                  child: Text(_name),
                ),
              ),
              Expanded(
                child: Container(
                  child: Text(_email),
                ),
              ),
              Expanded(
                child: Container(
                  child: Text(_contactNumber),
                ),
              ),
              Expanded(
                child: Container(
                  child: RaisedButton(
                    child: Text('Delete'),
                  )
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}