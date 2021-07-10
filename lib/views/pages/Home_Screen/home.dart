import 'package:book_store_app/views/pages/Book_Details/book_details.dart';
import 'package:flutter/material.dart';

class Home extends StatefulWidget {
  @override
  _HomeState createState() => _HomeState();
}

class _HomeState extends State<Home> {
  @override
  void initState() {
    super.initState();
  }

  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Container(
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(15),
          ),
          child: TextField(
            textInputAction: TextInputAction.search,
            decoration: InputDecoration(
              enabledBorder: InputBorder.none,
              focusedBorder: InputBorder.none,
              hintText: "Search Book",
              prefixIcon: Icon(Icons.search),
            ),
            onSubmitted: null,
          ),
        ),
        actions: [
          TextButton(
            onPressed: () {},
            child: Icon(
              Icons.shopping_cart,
              color: Colors.white,
            ),
          ),
        ],
      ),
      drawer: Drawer(),
      body: Column(
        children: [
          Card(
            clipBehavior: Clip.antiAlias,
            child: Column(
              children: [
                InkWell(
                  child: Container(
                    width: 170,
                    height: 190,
                    child: Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.stretch,
                        children: [
                          // Image.network(src)
                          Image(
                            image: AssetImage('assets/images/image.jpg'),
                          ),
                          Text('book name'),
                          Text('author name'),
                          Text('price'),
                        ],
                      ),
                    ),
                  ),
                  onTap: () {
                    Navigator.push(
                      context,
                      MaterialPageRoute(
                        builder: (context) => BookDetails(),
                      ),
                    );
                  },
                )
              ],
            ),
          ),
        ],
      ),
    );
  }
}
