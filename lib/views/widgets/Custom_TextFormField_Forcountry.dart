import 'package:book_store_app/utils/country_list.dart';
import 'package:book_store_app/views/pages/Registration/registration.dart';
import 'package:flutter/material.dart';

class CustomTextFormFieldForCountry extends StatefulWidget {
  @override
  _CustomTextFormFieldForCountryState createState() =>
      _CustomTextFormFieldForCountryState();
}

class _CustomTextFormFieldForCountryState
    extends State<CustomTextFormFieldForCountry> {
  TextEditingController country = TextEditingController();
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
    return ListView(
      scrollDirection: Axis.vertical,
      shrinkWrap: true,
      children: [
        Padding(
          padding: const EdgeInsets.only(bottom: 15, left: 10, right: 10),
          child: TextFormField(
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
                // todo: validation for selected country is from classifired
                // } else if (value.isNotEmpty) {
                //   return 'Please Enter Select Country';
                // }
                return null;
              }),
        ),
        Container(
          height: _foundCountry.length > 0 ? 200 : 0,
          child: _foundCountry.length > 0
              ? ListView.builder(
                  itemCount: _foundCountry.length,
                  itemBuilder: (context, index) => InkWell(
                    onTap: () {
                      setState(() {
                        // Registration.of(context).countryCode =
                        //     _foundCountry[index]["code"].toInt();
                        // country.text =
                        //     _foundCountry[index]["shortName"].toString();
                        // _foundCountry = [];
                      });
                    },
                    child: ListTile(
                      title: Text(
                        '${_foundCountry[index]["shortName"].toString()} (${_foundCountry[index]["alpha_3"].toString()})',
                        style: TextStyle(fontSize: 12),
                      ),
                    ),
                  ),
                )
              : Container(
                  height: 0,
                  width: 0,
                ),
        ),
      ],
    );
  }
}
