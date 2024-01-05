import 'package:app/providers/products.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class ProductDetailPage extends StatelessWidget {
  static const route = "/detail";

  @override
  Widget build(BuildContext context) {
    String detailprod_Id = ModalRoute.of(context)!.settings.arguments as String;

    var prod = Provider.of<Products>(context, listen: false);
    var selectedProduct = prod.selectById(detailprod_Id);
    return Scaffold(
      appBar: AppBar(
        title: Text('Product Details'),
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              selectedProduct.title,
              style: TextStyle(fontSize: 24, fontWeight: FontWeight.bold),
            ),
            SizedBox(height: 16),
            SizedBox(height: 8),
            Text(
              'Last Edited: ${selectedProduct.createdAt}',
              style: TextStyle(fontSize: 16),
            ),
            SizedBox(height: 16),
            Card(
              shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(5)),
              child: Padding(
                padding: const EdgeInsets.all(16.0),
                child: Text(
                  'Rp: ${selectedProduct.price}',
                  style: TextStyle(fontSize: 16),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
