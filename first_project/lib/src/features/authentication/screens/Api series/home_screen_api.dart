// import 'dart:convert';

// import 'package:flutter/material.dart';
// import 'package:http/http.dart' as http;
// import '../../models/post_model.dart';

// class HomeScreenApi extends StatefulWidget {
//   const HomeScreenApi({super.key});

//   @override
//   State<HomeScreenApi> createState() => _HomeScreenApiState();
// }

// class _HomeScreenApiState extends State<HomeScreenApi> {
//   List<ProductModel> postList = [];
//   Future<List<ProductModel>> getPostApi() async {
//     final response =
//         await http.get(Uri.parse('https://jsonplaceholder.typicode.com/posts'));
//     var data = jsonDecode(response.body.toString());
//     if (response.statusCode == 200) {
//       for (Map i in data) {
//         postList.add(ProductModel.fromJson(i));
//       }
//       return postList;
//     } else {
//       return postList;
//     }
//   }

//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       appBar: AppBar(
//         title: const Text('Api Series'),
//       ),
//       body: FutureBuilder(
//         future:
//             getPostApi(), //? this is calling method we made above in fetching data
//         builder: (context, snapshot) {
//           if (snapshot.hasData) {
//             return ListView.builder(
//               itemCount: postList.length,
//               itemBuilder: (context, index) {
//                 return Padding(
//                   padding: const EdgeInsets.all(8.0),
//                   child: Card(
//                     child: ListTile(
//                       leading: Text(postList[index].id.toString()),
//                       title: Text(postList[index].title.toString()),
//                       subtitle: Text(postList[index].body.toString()),
//                     ),
//                   ),
//                 );
//               },
//             );
//           } else {
//             return const Center(
//               child: CircularProgressIndicator(),
//             );
//           }
//         },
//       ),
//     );
//   }
// }
