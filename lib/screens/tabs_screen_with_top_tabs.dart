// import 'package:flutter/material.dart';
// import 'favorites_screen.dart';
// import 'categories_screen.dart';
//
// class TabsScreen extends StatelessWidget {
//   @override
//   Widget build(BuildContext context) {
//     return DefaultTabController(
//       length: 2,
//       initialIndex: 0, //not a must to be added
//       child: Scaffold(
//         appBar: AppBar(
//           title: Text('Meals'),
//           bottom: TabBar(
//             onTap:
//                 null, //incase i want some extra stuff but not necessary for displaying the screen
//             tabs: [
//               Tab(
//                 icon: Icon(Icons.category),
//                 text: 'Categories',
//               ),
//               Tab(
//                 icon: Icon(Icons.star),
//                 text: 'Favorites',
//               )
//             ],
//           ),
//         ),
//         body: TabBarView(
//           children: [CategoriesScreen(), FavoritesScreen()],
//         ),
//       ),
//     );
//   }
// }
