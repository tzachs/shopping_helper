import 'package:flutter/material.dart';

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
                        double _quanA = double.parse(quantityA.text);
                        double _weightA = double.parse(weightA.text);
                        double _discountA = 100.0;
                        if (discountA.text != null) {
                          _discountA -= double.parse(discountA.text);
                        }
                        _discountA /= 100.0;
                        double _priceA = double.parse(priceA.text) * _discountA;

                        double _quanB = double.parse(quantityB.text);
                        double _weightB = double.parse(weightB.text);
                        double _discountB = 100.0;
                        if (discountB.text != null) {
                          _discountB -= double.parse(discountB.text);
                        }
                        _discountB /= 100.0;
                        double _priceB = double.parse(priceB.text) * _discountB;

                        String answer = "Choose item: ";
                        if (_priceA < _priceB) {
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
