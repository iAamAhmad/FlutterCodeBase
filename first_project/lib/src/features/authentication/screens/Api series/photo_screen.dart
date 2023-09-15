import 'package:first_project/services/product_api_service.dart';

import 'package:first_project/src/features/authentication/models/user_model.dart';

import 'package:flutter/material.dart';

class PhotoScreenApi extends StatefulWidget {
  const PhotoScreenApi({super.key});

  @override
  State<PhotoScreenApi> createState() => _PhotoScreenApiState();
}

class _PhotoScreenApiState extends State<PhotoScreenApi> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Testing'),
      ),
      body: FutureBuilder(
        future: getPosts(),
        builder: (BuildContext context, AsyncSnapshot snapshot) {
          if (!snapshot.hasData) {
            return Center(
              child: CircularProgressIndicator(),
            );
          } else {
            List<Product> product = snapshot.data;
            return ListView.builder(
              itemCount: product.length,
              itemBuilder: (BuildContext context, int index) {
                return ListTile(
                  title: Text(product[index].title),
                  subtitle: Text(product[index].price.toString()),
                  leading: Image.network(product[index].thumbnail),
                );
              },
            );
          }
        },
      ),
    );
  }
}
