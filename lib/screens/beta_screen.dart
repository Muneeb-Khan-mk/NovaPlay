// import 'package:flutter/material.dart';
// import 'package:carousel_slider/carousel_slider.dart';
// import '../models/game.dart';
// import 'home_screen.dart';
// import 'game_detail_screen.dart';
//
// class BetaScreen extends StatelessWidget {
//   const BetaScreen({super.key});
//
//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       appBar: AppBar(title: const Text('Beta Features - Game Carousel')),
//       body: Column(
//         children: [
//           const Padding(
//             padding: EdgeInsets.all(16),
//             child: Text(
//               'Swipe to explore games',
//               style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
//             ),
//           ),
//           CarouselSlider(
//             options: CarouselOptions(
//               height: 300,
//               autoPlay: true,
//               enlargeCenterPage: true,
//               viewportFraction: 0.8,
//             ),
//             items: games.map((game) {
//               return Builder(
//                 builder: (BuildContext context) {
//                   return GestureDetector(
//                     onTap: () {
//                       Navigator.push(
//                         context,
//                         MaterialPageRoute(
//                           builder: (_) => GameDetailScreen(game: game),
//                         ),
//                       );
//                     },
//                     child: Container(
//                       width: MediaQuery.of(context).size.width,
//                       margin: const EdgeInsets.symmetric(horizontal: 5),
//                       decoration: BoxDecoration(
//                         color: Colors.grey.shade200,
//                         borderRadius: BorderRadius.circular(12),
//                         image: DecorationImage(
//                           image: AssetImage(game.image),
//                           fit: BoxFit.cover,
//                         ),
//                       ),
//                       child: Align(
//                         alignment: Alignment.bottomCenter,
//                         child: Container(
//                           width: double.infinity,
//                           color: Colors.black54,
//                           padding: const EdgeInsets.all(8),
//                           child: Text(
//                             game.title,
//                             style: const TextStyle(color: Colors.white, fontSize: 18),
//                             textAlign: TextAlign.center,
//                           ),
//                         ),
//                       ),
//                     ),
//                   );
//                 },
//               );
//             }).toList(),
//           ),
//           const SizedBox(height: 20),
//           const Text('Tap any game to see details', style: TextStyle(fontSize: 14)),
//         ],
//       ),
//     );
//   }
// }