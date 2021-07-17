import 'package:book_store_app/utils/country_list.dart';
import 'package:flutter/material.dart';

class CustomTextFormFieldForCountry extends StatefulWidget {
  int countryCode;

  CustomTextFormFieldForCountry({this.countryCode});

  @override
  _CustomTextFormFieldForCountryState createState() =>
      _CustomTextFormFieldForCountryState();
}

class _CustomTextFormFieldForCountryState
    extends State<CustomTextFormFieldForCountry> {
  TextEditingController country = TextEditingController();

  // This list holds the data for the list view
  List<Map<String, dynamic>> _foundCountry = [];

  @override
  initState() {
    // at the beginning
    _foundCountry = [];
    super.initState();
  }

  // This function is called whenever the text field changes
  void _runFilter(String enteredKeyword) {
    List<Map<String, dynamic>> results = [];
    if (enteredKeyword.isEmpty) {
      // if the search field is empty or only contains white-space, we'll display russia
      results = [
        {"code": 643, "shortName": "РОССИЯ", "alpha_3": 'RUS'}
      ];
    } else {
      results = allConutry
          .where((_country) => _country["shortName"]
              .toLowerCase()
              .contains(enteredKeyword.toLowerCase()))
          .toList();
      // we use the toLowerCase() method to make it case-insensitive
    }

    // Refresh the UI
    setState(() {
      _foundCountry = results;
    });
  }

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 250,
      child: Padding(
        padding: const EdgeInsets.all(10),
        child: Column(
          children: [
            SizedBox(
              height: 20,
            ),
            TextFormField(
                controller: country,
                onChanged: (value) => _runFilter(value),
                decoration: InputDecoration(
                  border: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(20.0),
                    borderSide: BorderSide(color: Colors.blue, width: 1.5),
                  ),
                  labelText: 'Country',
                ),
                validator: (String value) {
                  if (value.isEmpty) {
                    return 'Please Enter Country';
                  }
                  return null;
                }),
            SizedBox(
              height: 20,
            ),
            Expanded(
              child: _foundCountry.length > 0
                  ? ListView.builder(
                      itemCount: _foundCountry.length,
                      itemBuilder: (context, index) => InkWell(
                        onTap: () {
                          setState(() {
                            widget.countryCode =
                                _foundCountry[index]["code"].toInt();
                            country.text =
                                _foundCountry[index]["shortName"].toString();
                            _foundCountry = [];
                          });
                        },
                        child: ListTile(
                          title: Text(
                            '${_foundCountry[index]["shortName"].toString()} ( ${_foundCountry[index]["alpha_3"].toString()})',
                            style: TextStyle(fontSize: 12),
                          ),
                        ),
                      ),
                    )
                  // : Text(
                  //     'No results found',
                  //     style: TextStyle(fontSize: 12),
                  //   ),
                  : Container(),
            ),
          ],
        ),
      ),
    );
  }
}
