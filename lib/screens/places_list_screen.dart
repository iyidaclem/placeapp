import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../screens/add_place_screen.dart';
import '../providers/great_places.dart';

class PlaceListScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Your Places"),
        actions: [
          IconButton(
              onPressed: () {
                Navigator.of(context).pushNamed(AddPlaceScreen.routeName);
              },
              icon: Icon(Icons.add))
        ],
      ),
      body: Consumer<GreatePlaces>(
          child: Center(
            child: const Text("Got no places yet, start adding some!"),
          ),
          builder: (ctx, greatPlaces, ch) => greatPlaces.items.length <= 0
              ? ch!
              : ListView.builder(
                  itemBuilder: (ctx, i) => ListTile(
                    leading: CircleAvatar(backgroundImage: FileImage(greatPlaces.items[i].image),),
                    title: Text(greatPlaces.items[i].title),
                    onTap: (){
                      // Go to detal page
                    },
                  ),
                  itemCount: greatPlaces.items.length,
                )),
    );
  }
}
