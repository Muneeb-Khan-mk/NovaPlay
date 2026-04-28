import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import '../models/game.dart';
import '../providers/download_provider.dart';
import 'buy_screen.dart';

class GameDetailScreen extends StatelessWidget {
  final Game game;
  const GameDetailScreen({super.key, required this.game});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text(game.title)),
      body: SingleChildScrollView(
        padding: const EdgeInsets.all(16),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Center(child: Image.asset(game.image, height: 200, fit: BoxFit.cover)),
            const SizedBox(height: 16),
            Text(game.title, style: const TextStyle(fontSize: 24, fontWeight: FontWeight.bold)),
            const SizedBox(height: 8),
            Text(game.price == 0 ? "FREE" : "\$${game.price}", style: TextStyle(fontSize: 18, color: Theme.of(context).primaryColor)),
            const SizedBox(height: 16),
            const Text("Description", style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold)),
            const SizedBox(height: 4),
            Text(game.description),
            const SizedBox(height: 16),
            const Text("Computer Requirements", style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold)),
            const SizedBox(height: 4),
            const Text("OS: Windows 10\nCPU: Intel i5\nRAM: 8GB\nGPU: GTX 960\nStorage: 20GB"),
            const SizedBox(height: 16),
            const Text("Rating", style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold)),
            const SizedBox(height: 4),
            const Row(children: [Icon(Icons.star, color: Colors.amber), Icon(Icons.star, color: Colors.amber), Icon(Icons.star, color: Colors.amber), Icon(Icons.star, color: Colors.amber), Icon(Icons.star_half, color: Colors.amber), SizedBox(width: 8), Text("4.5/5")]),
            const SizedBox(height: 16),
            const Text("Content Rating", style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold)),
            const SizedBox(height: 4),
            const Text("PEGI 12"),
            const SizedBox(height: 30),
            SizedBox(
              width: double.infinity,
              child: ElevatedButton(
                style: ElevatedButton.styleFrom(backgroundColor: Colors.green, foregroundColor: Colors.white, padding: const EdgeInsets.symmetric(vertical: 14)),
                onPressed: () => Navigator.push(context, MaterialPageRoute(builder: (_) => BuyScreen(game: game))),
                child: const Text("BUY NOW"),
              ),
            ),
          ],
        ),
      ),
    );
  }
}