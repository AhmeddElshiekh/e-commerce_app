import 'package:flutter/material.dart';
import 'package:smile_shop/core/models/product_model.dart';
import 'package:smile_shop/core/utils/constant.dart';
import 'package:smile_shop/core/utils/styles.dart';
import 'package:smile_shop/feature/cart/presentation/views/cart_view.dart';
import 'package:smile_shop/feature/search/presentation/views/widgets/search_product_details_view_body.dart';

class SearchProductDetailsView extends StatelessWidget {
  const SearchProductDetailsView({super.key, required this.model});

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
      body: SearchProductDetailsViewBody(
        model: model,
      ),
    );
  }
}
