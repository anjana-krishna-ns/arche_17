// import 'package:flutter/material.dart';
//
// import '../test_all/real_time.dart';
// import 'Cart/cart_screen.dart';
// import 'Wish_list/wishPage.dart';
// class Pro extends StatefulWidget {
//   const Pro({Key? key}) : super(key: key);
//
//   @override
//   State<Pro> createState() => _ProState();
// }
//
// class _ProState extends State<Pro> {
//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       body: ListView(
//         children: [
//           Text('Name',
//                 style: TextStyle(
//                   color: Colors.white,
//                 ),
//                 softWrap: true),
//           ListTile(
//             title: const Text('date of '),
//             leading: Icon((Icons.person), size: 20, color: Colors.black54),
//             onTap: () {
//               Navigator.push(
//                   context, MaterialPageRoute(builder: (_) => Pro()));
//
//             },
//           ),
//           ListTile(
//             title: const Text('My cart'),
//             leading: Icon((Icons.shopping_cart_outlined),
//                 size: 20, color: Colors.black54),
//             onTap: () {
//               Navigator.push(
//                   context, MaterialPageRoute(builder: (_) => CartPage()));
//             },
//           ),
//           ListTile(
//             leading: Icon((Icons.favorite), size: 20, color: Colors.black54),
//             title: const Text('My wishlist'),
//             onTap: () {
//               Navigator.push(
//                   context, MaterialPageRoute(builder: (_) => Wish()));
//             },
//           ),
//           ListTile(
//             title: const Text('My orders'),
//             leading: Icon(
//               (Icons.shopping_bag),
//               size: 20,
//               color: Colors.black54,
//             ),
//             onTap: () {
//               Navigator.push(
//                   context, MaterialPageRoute(builder: (_) => CartPage()));
//             }, //look this<3
//           ),
//           ListTile(
//             title: const Text('log out'),
//             leading: Icon(
//               (Icons.logout),
//               size: 20,
//               color: Colors.black54,
//             ),
//             onTap: () {
//               Navigator.push(
//                   context, MaterialPageRoute(builder: (_) => logIn1()));
//             }, //look this<3
//           ),
//         ],
//       ),
//     );
//   }
// }
