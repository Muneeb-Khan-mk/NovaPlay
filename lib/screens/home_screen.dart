import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'auth/login_screen.dart';
import 'settings_screen.dart';
import 'library_screen.dart';
import 'downloads_screen.dart';
import 'game_detail_screen.dart';
import '../providers/profile_provider.dart';
import '../models/game.dart';

final List<Game> games = const [
  Game(id: 1, title: "Among Us", image: "assets/images/amongus.jpg", description: "Find the impostor before it's too late.", price: 4.99),
  Game(id: 2, title: "Fortnite", image: "assets/images/fortnite.jpg", description: "Battle royale survival shooter.", price: 0.00),
  Game(id: 3, title: "Minecraft", image: "assets/images/minecraft.jpg", description: "Build and explore endless worlds.", price: 9.99),
  Game(id: 4, title: "Forza Horizon 4", image: "assets/images/forzahorizon4.jpg", description: "Open-world racing adventure.", price: 19.99),
  Game(id: 5, title: "View Finder", image: "assets/images/viewfinder.jpg", description: "Reality-bending puzzle game.", price: 14.99),
  Game(id: 6, title: "War Thunder", image: "assets/images/warthunder.jpg", description: "Air, land, and sea combat.", price: 0.00),
];

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  int _selectedIndex = 0;
  final List<String> _titles = const ["Home", "Library", "Downloads", "Settings"];
  Game? _gameToDownload;

  void _startDownloadFromLibrary(Game game) {
    setState(() {
      _selectedIndex = 2;
      _gameToDownload = game;
    });
  }

  void _onDownloadStarted() {
    setState(() {
      _gameToDownload = null;
    });
  }

  Widget _buildHome() {
    return ListView.builder(
      itemCount: games.length,
      itemBuilder: (context, index) {
        final game = games[index];
        return GestureDetector(
          onTap: () {
            Navigator.push(
              context,
              MaterialPageRoute(builder: (_) => GameDetailScreen(game: game)),
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
                        Text(game.title, style: const TextStyle(fontWeight: FontWeight.bold)),
                        const SizedBox(height: 4),
                        Text(game.description, maxLines: 2, overflow: TextOverflow.ellipsis, style: const TextStyle(fontSize: 12, color: Colors.grey)),
                        const SizedBox(height: 4),
                        Text(game.price == 0 ? "FREE" : "\$${game.price}", style: TextStyle(color: Theme.of(context).primaryColor, fontWeight: FontWeight.bold)),
                      ],
                    ),
                  ),
                ),
              ],
            ),
          ),
        );
      },
    );
  }

  Widget _getScreen() {
    switch (_selectedIndex) {
      case 0:
        return _buildHome();
      case 1:
        return LibraryScreen(onStartDownload: _startDownloadFromLibrary);
      case 2:
        return DownloadsScreen(
          gameToDownload: _gameToDownload,
          onDownloadStarted: _onDownloadStarted,
        );
      case 3:
        return const SettingsScreen();
      default:
        return _buildHome();
    }
  }

  void _showLogoutDialog(BuildContext context) {
    showDialog(
      context: context,
      builder: (BuildContext context) {
        return AlertDialog(
          title: const Text("Logout"),
          content: const Text("Are you sure you want to logout?"),
          actions: [
            TextButton(onPressed: () => Navigator.pop(context), child: const Text("Cancel")),
            TextButton(
              onPressed: () {
                Navigator.pop(context);
                _handleLogout();
              },
              style: TextButton.styleFrom(foregroundColor: Colors.red),
              child: const Text("Logout"),
            ),
          ],
        );
      },
    );
  }

  void _handleLogout() {
    Navigator.pushReplacement(context, MaterialPageRoute(builder: (_) => const LoginScreen()));
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text(_titles[_selectedIndex])),
      drawer: Drawer(
        child: ListView(
          padding: EdgeInsets.zero,
          children: [
            DrawerHeader(
              decoration: BoxDecoration(color: Theme.of(context).primaryColor),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                mainAxisAlignment: MainAxisAlignment.end,
                children: [
                  const Text("NovaPlay", style: TextStyle(fontSize: 24, color: Colors.white, fontWeight: FontWeight.bold)),
                  const SizedBox(height: 4),
                  Text(context.watch<ProfileProvider>().displayName, style: const TextStyle(color: Colors.white70, fontSize: 14)),
                ],
              ),
            ),
            _drawerItem(Icons.home, "Home", 0),
            _drawerItem(Icons.library_books, "Library", 1),
            _drawerItem(Icons.download, "Downloads", 2),
            _drawerItem(Icons.settings, "Settings", 3),
            ListTile(
              leading: const Icon(Icons.logout, color: Colors.red),
              title: const Text("Logout", style: TextStyle(color: Colors.red)),
              onTap: () {
                Navigator.pop(context);
                _showLogoutDialog(context);
              },
            ),
          ],
        ),
      ),
      body: _getScreen(),
    );
  }

  Widget _drawerItem(IconData icon, String title, int index) {
    return ListTile(
      leading: Icon(icon),
      title: Text(title),
      selected: _selectedIndex == index,
      onTap: () {
        setState(() => _selectedIndex = index);
        Navigator.pop(context);
      },
    );
  }
}