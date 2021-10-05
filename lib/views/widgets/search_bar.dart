import 'package:flutter/material.dart';

class BookSearch extends SearchDelegate<String> {
  // cross-sign to clear seach bar
  @override
  List<Widget> buildActions(BuildContext context) => [
        IconButton(
          icon: Icon(Icons.clear),
          onPressed: () {
            if (query.isEmpty) {
              close(context, null);
            } else {
              query = '';
              showSuggestions(context);
            }
          },
        )
      ];

  @override
  Widget buildLeading(BuildContext context) => IconButton(
        icon: Icon(Icons.arrow_back),
        onPressed: () => close(context, null),
      );

  @override
  Widget buildResults(BuildContext context) {
    return Container();
  }

  // @override
  // Widget buildResults(BuildContext context) => FutureBuilder<Weather>(
  //       future: WeatherApi.getWeather(city: query),
  //       builder: (context, snapshot) {
  //         switch (snapshot.connectionState) {
  //           case ConnectionState.waiting:
  //             return Center(child: CircularProgressIndicator());
  //           default:
  //             if (snapshot.hasError) {
  //               return Container(
  //                 color: Colors.black,
  //                 alignment: Alignment.center,
  //                 child: Text(
  //                   'Something went wrong!',
  //                   style: TextStyle(fontSize: 28, color: Colors.white),
  //                 ),
  //               );
  //             } else {
  //               return buildResultSuccess(snapshot.data);
  //             }
  //         }
  //       },
  //     );

  @override
  Widget buildSuggestions(BuildContext context) => Container(
        color: Colors.black,
        child: FutureBuilder<List<String>>(
          // future: WeatherApi.searchCities(query: query),
          builder: (context, snapshot) {
            if (query.isEmpty) return buildNoSuggestions();

            switch (snapshot.connectionState) {
              case ConnectionState.waiting:
                return Center(child: CircularProgressIndicator());
              default:
                if (snapshot.hasError || snapshot.data.isEmpty) {
                  return buildNoSuggestions();
                } else {
                  return buildSuggestionsSuccess(snapshot.data);
                }
            }
          },
        ),
      );

  Widget buildNoSuggestions() => Center(
        child: Text(
          'No suggestions!',
          style: TextStyle(fontSize: 28, color: Colors.white),
        ),
      );

  Widget buildSuggestionsSuccess(List<String> suggestions) => ListView.builder(
        itemCount: suggestions.length,
        itemBuilder: (context, index) {
          final suggestion = suggestions[index];
          final queryText = suggestion.substring(0, query.length);
          final remainingText = suggestion.substring(query.length);

          return ListTile(
            onTap: () {
              query = suggestion;

              // 1. Show Results
              showResults(context);

              // 2. Close Search & Return Result
              // close(context, suggestion);

              // 3. Navigate to Result Page
              //  Navigator.push(
              //   context,
              //   MaterialPageRoute(
              //     builder: (BuildContext context) => ResultPage(suggestion),
              //   ),
              // );
            },
            leading: Icon(Icons.location_city),
            // title: Text(suggestion),
            title: RichText(
              text: TextSpan(
                text: queryText,
                style: TextStyle(
                  color: Colors.white,
                  fontWeight: FontWeight.bold,
                  fontSize: 18,
                ),
                children: [
                  TextSpan(
                    text: remainingText,
                    style: TextStyle(
                      color: Colors.white54,
                      fontSize: 18,
                    ),
                  ),
                ],
              ),
            ),
          );
        },
      );

// 
  Widget buildResultSuccess() => Container(
  // Widget buildResultSuccess(Weather weather) => Container(
        decoration: BoxDecoration(
          gradient: LinearGradient(
            colors: [Color(0xFF3279e2), Colors.purple],
            begin: Alignment.topCenter,
            end: Alignment.bottomCenter,
          ),
        ),
        child: ListView(
          padding: EdgeInsets.all(64),
          children: [
            // Text(
            //   weather.city,
            //   style: TextStyle(
            //     fontSize: 32,
            //     color: Colors.white,
            //   ),
            //   textAlign: TextAlign.center,
            // ),
            // Icon(
            //   weather.icon,
            //   color: Colors.white,
            //   size: 140,
            // ),
            // const SizedBox(height: 72),
            // Text(
            //   weather.description,
            //   style: TextStyle(
            //     fontSize: 20,
            //     color: Colors.white70,
            //   ),
            //   textAlign: TextAlign.center,
            // ),
            // const SizedBox(height: 32),
          ],
        ),
      );

  // Widget buildDegrees(Weather weather) {
  //   final style = TextStyle(
  //     fontSize: 100,
  //     fontWeight: FontWeight.bold,
  //     color: Colors.white,
  //   );

  //   return Row(
  //     mainAxisAlignment: MainAxisAlignment.center,
  //     children: [
  //       Opacity(
  //         opacity: 0,
  //         child: Text('°', style: style),
  //       ),
  //       Text('${weather.degrees}°', style: style),
  //     ],
  //   );
  // }
}
