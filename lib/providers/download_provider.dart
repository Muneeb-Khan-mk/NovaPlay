import 'package:flutter/material.dart';
import '../models/game.dart';

class DownloadProvider extends ChangeNotifier {
  final List<Game> _downloadedGames = [];

  List<Game> get downloadedGames => _downloadedGames;

  bool isDownloaded(Game game) {
    return _downloadedGames.contains(game);
  }

  void addDownload(Game game) {
    if (!_downloadedGames.contains(game)) {
      _downloadedGames.add(game);
      notifyListeners();
    }
  }

  void removeDownload(Game game) {
    _downloadedGames.remove(game);
    notifyListeners();
  }
}