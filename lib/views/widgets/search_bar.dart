import 'package:book_store_app/models/Book.dart';
import 'package:book_store_app/services/book_provider.dart';
import 'package:book_store_app/views/widgets/book_card.dart';
import 'package:flutter/material.dart';

class BookSearch extends SearchDelegate<String> {
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
  Widget buildSuggestions(BuildContext context) {
    return FutureBuilder<List<Book>>(
        future: BookProvider().getSearchBooks(query),
        builder: (context, AsyncSnapshot<List<Book>> snapshot) {
          if (snapshot.hasData) {
            return snapshot.data.isEmpty
                ? Center(child: Text('No Books'))
                : GridView.builder(
                    physics: ScrollPhysics(),
                    shrinkWrap: true,
                    itemCount: snapshot.data.length,
                    gridDelegate: SliverGridDelegateWithMaxCrossAxisExtent(
                      maxCrossAxisExtent: 300.0,
                      mainAxisExtent: 210,
                      crossAxisSpacing: 0.5,
                      mainAxisSpacing: 0.5,
                    ),
                    itemBuilder: (BuildContext context, index) {
                      return bookCard(snapshot.data, index);
                    },
                  );
          } else {
            return query == '' ? Container() : CircularProgressIndicator();
          }
        });
  }

  Widget buildResults(BuildContext context) {
    return FutureBuilder<List<Book>>(
        future: BookProvider().getSearchBooks(query),
        builder: (context, AsyncSnapshot<List<Book>> snapshot) {
          if (snapshot.hasData) {
            return snapshot.data.isEmpty
                ? Center(child: Text('No Books'))
                : GridView.builder(
                    physics: ScrollPhysics(),
                    shrinkWrap: true,
                    itemCount: snapshot.data.length,
                    gridDelegate: SliverGridDelegateWithMaxCrossAxisExtent(
                      maxCrossAxisExtent: 300.0,
                      mainAxisExtent: 210,
                      crossAxisSpacing: 0.5,
                      mainAxisSpacing: 0.5,
                    ),
                    itemBuilder: (BuildContext context, index) {
                      return bookCard(snapshot.data, index);
                    },
                  );
          } else {
            return CircularProgressIndicator();
          }
        });
  }
}
