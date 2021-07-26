import 'package:flutter/material.dart';

class CartCard extends StatelessWidget {

  @override
  Widget build(BuildContext context) {
    return Card(
      clipBehavior: Clip.antiAlias,
      child: Column(
        children: [
          const ListTile(
            leading: Image(
              image: AssetImage('assets/images/image.jpg'),
            ),
            title: Text('The Enchanted Nightingale'),
            subtitle: Text('Music by Julie Gable. Lyrics by Sidney Stein.'),
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.end,
            children: <Widget>[
              TextButton(
                child: const Text('BUY TICKETS'),
                onPressed: () { /* ... */ },
              ),
              const SizedBox(width: 8),
              TextButton(
                child: const Text('LISTEN'),
                onPressed: () { /* ... */ },
              ),
              const SizedBox(width: 8),
            ],
          ),
        ],
      ),
    );
  }
}
