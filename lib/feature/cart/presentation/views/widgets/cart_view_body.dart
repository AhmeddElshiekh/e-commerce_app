import 'package:flutter/material.dart';
import 'package:smile_shop/core/utils/constant.dart';
import 'package:smile_shop/feature/cart/presentation/views/widgets/list_view_cart.dart';
import 'package:smile_shop/feature/cart/presentation/views/widgets/total_price_card.dart';

class CartViewBody extends StatelessWidget {
  const CartViewBody({super.key});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsetsDirectional.only(
          start: 5, end: 5, bottom: 25, top: 5),
      child: Column(
        children: [
          const ListViewCart(),
          const Spacer(),
          Column(
            children: [
              Row(
                children: [
                  const Column(
                    children: [
                      Text(
                        'Total Price',
                        style: TextStyle(
                          fontSize: 24,
                          color: mainColor,
                        ),
                      ),
                      TotalPriceCard(),
                    ],
                  ),
                  const Spacer(),
                  Container(
                    width: MediaQuery.of(context).size.width * .5,
                    decoration: const BoxDecoration(
                      borderRadius:
                          BorderRadiusDirectional.all(Radius.circular(25)),
                      color: mainColor,
                    ),
                    child: const Padding(
                      padding: EdgeInsets.all(8.0),
                      child: Row(
                        children: [
                          SizedBox(
                            width: 10,
                          ),
                          Expanded(
                            flex: 0,
                            child: Text(
                              'Check Out',
                              style: TextStyle(
                                color: Colors.white,
                                fontSize: 24,
                              ),
                            ),
                          ),
                          SizedBox(
                            width: 15,
                          ),
                          Icon(
                            Icons.arrow_forward,
                            size: 35,
                            color: Colors.white,
                          ),
                        ],
                      ),
                    ),
                  )
                ],
              ),
            ],
          ),
        ],
      ),
    );
  }
}

