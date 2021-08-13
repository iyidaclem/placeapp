import 'dart:io';

import 'package:flutter/foundation.dart';
import '../model/place.dart';

class GreatePlaces with ChangeNotifier {
  List<Place> _items = [];

  List<Place> get items {
    return [..._items];
  }

  void addPlace(String title, File image) {
    final newPlace = Place(
        id: DateTime.now().toString(),
        title: title,
        image: image,
        location:
            PlaceLocation(address: "Ikamodo", longitude: 50.9, latitude: 60.0));

    _items.add(newPlace);
    notifyListeners();
  }
}
