import 'package:flutter/material.dart';
import 'package:smile_shop/core/models/product_model.dart';
import 'package:smile_shop/core/utils/constant.dart';
import 'package:smile_shop/core/utils/styles.dart';
import 'package:smile_shop/feature/cart/presentation/views/cart_view.dart';
import 'package:smile_shop/feature/category/presentation/views/widgets/product_details_view_body.dart';

class ProductDetailsView extends StatelessWidget {
  const ProductDetailsView({super.key, required this.model});

  final DataProduct2 model;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      resizeToAvoidBottomInset: false,
      appBar: AppBar(
        title: const Text(
          'Product Details',
          style: Styles.textStyle30,
        ),
        actions: [
          IconButton(
            onPressed: () {
              Navigator.push(
                context,
                MaterialPageRoute(
                  builder: (context) => const CartView(),
                ),
              );
            },
            icon: const Icon(
              Icons.shopping_cart,
              color: mainColor,
            ),
          ),
        ],
      ),
      body: ProductDetailsViewBody(
        model: model,
      ),
    );
  }
}
