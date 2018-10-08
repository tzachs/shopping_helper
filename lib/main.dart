import 'package:flutter/material.dart';
import 'dart:developer';

void main() => runApp(new MyApp());

class MyApp extends StatelessWidget {
  final appTitle = 'Shopping Helper';

  @override
  Widget build(BuildContext context) {
    return new MaterialApp(
        title: appTitle,
        home: Scaffold(
          appBar: AppBar(
            title: Text(appTitle),
          ),
          body: CompareForm(),
        ));
  }
}

class CompareForm extends StatefulWidget {
  @override
  _CompareForm createState() => new _CompareForm();
}

class _CompareForm extends State<CompareForm> {
  final _formKey = GlobalKey<FormState>();

  final nameA = TextEditingController(text: "Item A");
  final quantityA = TextEditingController();
  final weightA = TextEditingController();
  final priceA = TextEditingController();
  final discountA = TextEditingController();

  final nameB = TextEditingController(text: "Item B");
  final quantityB = TextEditingController();
  final weightB = TextEditingController();
  final priceB = TextEditingController();
  final discountB = TextEditingController();

  @override
  void dispose() {
    nameA.dispose();
    quantityA.dispose();
    priceA.dispose();
    discountA.dispose();
    weightA.dispose();

    nameB.dispose();
    quantityB.dispose();
    priceB.dispose();
    discountB.dispose();
    weightB.dispose();

    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Form(
        key: _formKey,
        child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: <Widget>[
              TextFormField(
                  controller: nameA,
                  decoration: InputDecoration(hintText: "Item A name"),
                  validator: (value) {
                    if (value.isEmpty) {
                      return 'Please enter name for Item A';
                    }
                  }),
              TextFormField(
                  decoration: InputDecoration(hintText: "Item A weight"),
                  controller: weightA,
                  keyboardType: TextInputType.number,
                  validator: (value) {
                    if (value.isEmpty) {
                      return 'Please enter weight for Item A';
                    }
                  }),
              TextFormField(
                decoration: InputDecoration(hintText: "Item A quantity"),
                controller: quantityA,
                keyboardType: TextInputType.number,
                validator: (value) {
                  if (value.isEmpty) {
                    return 'Please enter quantity for Item A';
                  }
                },
              ),
              TextFormField(
                decoration: InputDecoration(hintText: "Item A price"),
                controller: priceA,
                keyboardType: TextInputType.number,
                validator: (value) {
                  if (value.isEmpty) {
                    return 'Please enter price for Item A';
                  }
                },
              ),
              TextFormField(
                  decoration: InputDecoration(hintText: "Item A discount"),
                  controller: discountA,
                  keyboardType: TextInputType.number),
              TextFormField(
                  controller: nameB,
                  decoration: InputDecoration(hintText: "Item B name"),
                  validator: (value) {
                    if (value.isEmpty) {
                      return 'Please enter name for Item B';
                    }
                  }),
              TextFormField(
                  decoration: InputDecoration(hintText: "Item B weight"),
                  controller: weightB,
                  keyboardType: TextInputType.number,
                  validator: (value) {
                    if (value.isEmpty) {
                      return 'Please enter weight for Item B';
                    }
                  }),
              TextFormField(
                decoration: InputDecoration(hintText: "Item B quantity"),
                controller: quantityB,
                keyboardType: TextInputType.number,
                validator: (value) {
                  if (value.isEmpty) {
                    return 'Please enter quantity for Item B';
                  }
                },
              ),
              TextFormField(
                decoration: InputDecoration(hintText: "Item B price"),
                controller: priceB,
                keyboardType: TextInputType.number,
                validator: (value) {
                  if (value.isEmpty) {
                    return 'Please enter price for Item B';
                  }
                },
              ),
              TextFormField(
                  decoration: InputDecoration(hintText: "Item B discount"),
                  controller: discountB,
                  keyboardType: TextInputType.number),
              Padding(
                  padding: const EdgeInsets.symmetric(vertical: 16.0),
                  child: RaisedButton(
                    onPressed: () {
                      if (_formKey.currentState.validate()) {
                        num _quanA = num.parse(quantityA.text);
                        num _weightA = num.parse(weightA.text);
                        num _totalA = _quanA * _weightA;
                        num _discountA = 100.0;
                        if (discountA.text != null &&
                            discountA.text.isNotEmpty) {
                          _discountA -= num.parse(discountA.text);
                        }
                        _discountA /= 100.0;
                        num _priceA = num.parse(priceA.text) * _discountA;
                        _totalA /= _priceA;

                        num _quanB = num.parse(quantityB.text);
                        num _weightB = num.parse(weightB.text);

                        num _discountB = 100.0;
                        if (discountB.text != null &&
                            discountB.text.isNotEmpty) {
                          _discountB -= num.parse(discountB.text);
                        }
                        _discountB /= 100.0;
                        num _priceB = num.parse(priceB.text) * _discountB;
                        num _totalB = _quanB * _weightB;
                        _totalB /= _priceB;

                        String answer = "Choose item: ";
                        if (_totalA > _totalB) {
                          answer += nameA.text;
                        } else {
                          answer += nameB.text;
                        }

                        Scaffold.of(context)
                            .showSnackBar(SnackBar(content: Text(answer)));
                      }
                    },
                    child: Text('Submit'),
                  ))
            ]));
  }
}
