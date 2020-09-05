import 'dart:convert';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:http/http.dart' as http;
import '../../config/globalvar.dart' as config;

class FormPage extends StatefulWidget {
  static const routeName = '/formpage';

  @override
  _FormPageState createState() => _FormPageState();
}

class _FormPageState extends State<FormPage> {
  final GlobalKey<FormState> _formKey = new GlobalKey<FormState>();
  bool _isLoading = false;

  Map formData = {
    'housetitle': null,
    'numbOfBedRoom': null,
    'imageURL': null,
    'description': null
  };

  Future<void> sendDataToServer() async {
    setState(() {
      _isLoading = true;
    });

      final _encodeData = json.encode(formData);
      final _fetchData = await http.post('${config.baseUrl}house',
          body: _encodeData, headers: {"Content-type": "application/json"});


  
      print(_fetchData.body);

    

    setState(() {
      _isLoading = false;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(),
      body: SingleChildScrollView(
        child: Container(
          child: Column(
            children: [
              Form(
                  key: _formKey,
                  child: Column(
                    children: [
                      Padding(
                        padding: const EdgeInsets.all(8.0),
                        child: TextFormField(
                          keyboardType: TextInputType.text,
                          decoration: InputDecoration(
                            hintText: 'Home Title',
                          ),
                          onSaved: (val) {
                            formData['housetitle'] = val;
                          },
                          onChanged: (val) {},
                        ),
                      ),
                      Padding(
                        padding: const EdgeInsets.all(8.0),
                        child: TextFormField(
                          keyboardType: TextInputType.text,
                          decoration: InputDecoration(
                            hintText: 'Image Url',
                          ),
                          onSaved: (val) {
                            formData['imageURL'] = val;
                          },
                          onChanged: (val) {},
                        ),
                      ),
                      Padding(
                        padding: const EdgeInsets.all(8.0),
                        child: TextFormField(
                          keyboardType: TextInputType.number,
                          inputFormatters: [
                            WhitelistingTextInputFormatter.digitsOnly,
                          ],
                          decoration: InputDecoration(
                            hintText: 'No of bedroom',
                          ),
                          onSaved: (val) {
                            formData['numbOfBedRoom'] = int.parse(val);
                          },
                        ),
                      ),
                      Padding(
                        padding: const EdgeInsets.all(8.0),
                        child: TextFormField(
                          keyboardType: TextInputType.multiline,
                          maxLines: 3,
                          decoration: InputDecoration(
                            hintText: 'description',
                          ),
                          onSaved: (val) {
                            formData['description'] = val;
                          },
                        ),
                      ),
                      _isLoading
                          ? Center(child: CircularProgressIndicator())
                          : RaisedButton(
                              color: Colors.red,
                              textColor: Colors.white,
                              onPressed: () {
                                _formKey.currentState.save();
                                print(formData);
                                sendDataToServer();
                              },
                              child: Text('Continue'),
                            ),
                    ],
                  ))
            ],
          ),
        ),
      ),
    );
  }
}

class CustomTextFeild extends StatelessWidget {
  String hintText;
  Color color;
  Function(String) onSaved;
  Function validator;
  CustomTextFeild({
    @required this.hintText,
    this.color = Colors.green,
    this.onSaved,
    this.validator,
  });

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: TextFormField(
        decoration: InputDecoration(
            hintText: hintText, hintStyle: TextStyle(color: color)),
        onSaved: onSaved,
        validator: validator,
      ),
    );
  }
}
