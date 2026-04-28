import 'package:flutter/material.dart';

class OwnedProvider extends ChangeNotifier {
  final Set<int> _ownedIds = {1,2,3};

  Set<int> get ownedIds => _ownedIds;

  bool isOwned(int gameId) => _ownedIds.contains(gameId);

  void addOwned(int gameId) {
    _ownedIds.add(gameId);
    notifyListeners();
  }
}