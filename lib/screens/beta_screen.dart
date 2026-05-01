import 'package:flutter/material.dart';
import '../models/game.dart';
import 'home_screen.dart';
import 'game_detail_screen.dart';

class BetaScreen extends StatelessWidget {
  const BetaScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('Beta Features - Game Carousel')),
      body: Column(
        children: [
          // Carousel
          SizedBox(
            height: 300,
            child: PageView.builder(
              itemCount: games.length,
              itemBuilder: (context, index) {
                final game = games[index];
                return GestureDetector(
                  onTap: () {
                    Navigator.push(
                      context,
                      MaterialPageRoute(
                        builder: (_) => GameDetailScreen(game: game),
                      ),
                    );
                  },
                  child: Container(
                    margin: const EdgeInsets.symmetric(horizontal: 10),
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(12),
                      image: DecorationImage(
                        image: AssetImage(game.image),
                        fit: BoxFit.cover,
                      ),
                    ),
                    child: Align(
                      alignment: Alignment.bottomCenter,
                      child: Container(
                        width: double.infinity,
                        color: Colors.black54,
                        padding: const EdgeInsets.all(8),
                        child: Text(
                          game.title,
                          style: const TextStyle(color: Colors.white, fontSize: 18),
                          textAlign: TextAlign.center,
                        ),
                      ),
                    ),
                  ),
                );
              },
            ),
          ),
          const SizedBox(height: 16),
          // Section title
          const Padding(
            padding: EdgeInsets.symmetric(horizontal: 16),
            child: Align(
              alignment: Alignment.centerLeft,
              child: Text(
                'All Games',
                style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
              ),
            ),
          ),
          const SizedBox(height: 8),
          // Full game list – same as HomeScreen
          Expanded(
            child: ListView.builder(
              itemCount: games.length,
              itemBuilder: (context, index) {
                final game = games[index];
                return GestureDetector(
                  onTap: () {
                    Navigator.push(
                      context,
                      MaterialPageRoute(
                        builder: (_) => GameDetailScreen(game: game),
                      ),
                    );
                  },
                  child: Card(
                    margin: const EdgeInsets.all(8),
                    child: Row(
                      children: [
                        Image.asset(game.image, width: 80, height: 80, fit: BoxFit.cover),
                        Expanded(
                          child: Padding(
                            padding: const EdgeInsets.all(8.0),
                            child: Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Text(
                                  game.title,
                                  style: const TextStyle(fontWeight: FontWeight.bold),
                                ),
                                const SizedBox(height: 4),
                                Text(
                                  game.description,
                                  maxLines: 2,
                                  overflow: TextOverflow.ellipsis,
                                  style: const TextStyle(fontSize: 12, color: Colors.grey),
                                ),
                                const SizedBox(height: 4),
                                Text(
                                  game.price == 0 ? "FREE" : "\$${game.price}",
                                  style: TextStyle(
                                    color: Theme.of(context).primaryColor,
                                    fontWeight: FontWeight.bold,
                                  ),
                                ),
                              ],
                            ),
                          ),
                        ),
                      ],
                    ),
                  ),
                );
              },
            ),
          ),
        ],
      ),
    );
  }
}