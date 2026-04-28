import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import '../providers/theme_provider.dart';
import '../providers/profile_provider.dart';
import 'profile_screen.dart';
import 'beta_screen.dart'; //

class SettingsScreen extends StatelessWidget {
  const SettingsScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final themeProvider = Provider.of<ThemeProvider>(context, listen: false);
    final profile = Provider.of<ProfileProvider>(context);
    return ListView(
      padding: const EdgeInsets.all(16),
      children: [
        const Text('Profile', style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold)),
        const SizedBox(height: 8),
        ListTile(
          leading: CircleAvatar(
            backgroundColor: Theme.of(context).primaryColor,
            child: const Icon(Icons.person, color: Colors.white),
          ),
          title: Text(profile.displayName.isEmpty ? 'Set display name' : profile.displayName),
          trailing: const Icon(Icons.chevron_right),
          onTap: () {
            Navigator.push(
              context,
              MaterialPageRoute(builder: (_) => const ProfileScreen()),
            );
          },
        ),
        const Divider(height: 32),
        const Text('App Theme', style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold)),
        const SizedBox(height: 10),
        DropdownButtonFormField<ThemeMode>(
          value: themeProvider.themeMode,
          decoration: const InputDecoration(
            border: OutlineInputBorder(),
            contentPadding: EdgeInsets.symmetric(horizontal: 12, vertical: 8),
          ),
          items: const [
            DropdownMenuItem(value: ThemeMode.light, child: Text('Light Theme')),
            DropdownMenuItem(value: ThemeMode.dark, child: Text('Dark Theme')),
            DropdownMenuItem(value: ThemeMode.system, child: Text('System Theme')),
          ],
          onChanged: (ThemeMode? newMode) {
            if (newMode != null) themeProvider.setTheme(newMode);
          },
        ),
        const Divider(height: 32),
        ListTile(
          leading: const Icon(Icons.code, color: Colors.blue),
          title: const Text('Beta Features'),
          trailing: const Icon(Icons.chevron_right),
          // onTap: () {
          //   Navigator.push(
          //     context,
          //     MaterialPageRoute(builder: (_) => const BetaScreen()),
          //   );
          // },
        ),
      ],
    );
  }
}