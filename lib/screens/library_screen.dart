import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import '../models/game.dart';
import 'home_screen.dart';
import '../providers/download_provider.dart';
import '../providers/owned_provider.dart';

class LibraryScreen extends StatefulWidget {
  final Function(Game) onStartDownload;
  const LibraryScreen({super.key, required this.onStartDownload});

  @override
  State<LibraryScreen> createState() => _LibraryScreenState();
}

class _LibraryScreenState extends State<LibraryScreen> {
  String _selectedFilter = 'All';

  @override
  Widget build(BuildContext context) {
    final ownedProvider = context.watch<OwnedProvider>();
    final downloadProvider = context.watch<DownloadProvider>();
    final List<Game> ownedGames = games.where((game) => ownedProvider.isOwned(game.id)).toList();

    if (ownedGames.isEmpty) {
      return const Center(
        child: Text('No purchased games yet. Go to store and buy some!'),
      );
    }

    return Column(
      children: [
        Padding(
          padding: const EdgeInsets.all(8.0),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.end,
            children: [
              const Text('Filter: '),
              DropdownButton<String>(
                value: _selectedFilter,
                items: const [
                  DropdownMenuItem(value: 'All', child: Text('All Games')),
                  DropdownMenuItem(value: 'Alphabetical', child: Text('A-Z')),
                  DropdownMenuItem(value: 'Installed', child: Text('Installed')),
                  DropdownMenuItem(value: 'Size', child: Text('Size')),
                ],
                onChanged: (value) {
                  setState(() {
                    _selectedFilter = value!;
                  });
                },
              ),
            ],
          ),
        ),
        Expanded(
          child: ListView.builder(
            itemCount: ownedGames.length,
            itemBuilder: (context, index) {
              final game = ownedGames[index];
              final isDownloaded = downloadProvider.downloadedGames.contains(game);
              return Card(
                margin: const EdgeInsets.all(8),
                child: ListTile(
                  leading: Image.asset(game.image, width: 50, height: 50, fit: BoxFit.cover),
                  title: Text(game.title),
                  subtitle: Text(game.description),
                  trailing: isDownloaded
                      ? ElevatedButton(
                    style: ElevatedButton.styleFrom(
                      foregroundColor: Colors.white,
                      backgroundColor: Colors.green,
                    ),
                    onPressed: () {
                      ScaffoldMessenger.of(context).showSnackBar(
                        const SnackBar(content: Text('Playing game... (demo)')),
                      );
                    },
                    child: const Text('Play'),
                  )
                      : ElevatedButton(
                    style: ElevatedButton.styleFrom(
                      foregroundColor: Colors.white,
                      backgroundColor: Theme.of(context).primaryColor,
                    ),
                    onPressed: () => widget.onStartDownload(game),
                    child: const Text('Download'),
                  ),
                ),
              );
            },
          ),
        ),
      ],
    );
  }
}