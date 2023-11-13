import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:smile_shop/core/models/product_model.dart';
import 'package:smile_shop/core/repos/home_repo.dart';
import 'package:smile_shop/core/utils/constant.dart';
import 'package:smile_shop/feature/cart/presentation/manager/post_cart_cubit/post_cart_cubit.dart';
import 'package:smile_shop/feature/search/presentation/views/widgets/search_product_details_image.dart';

class SearchProductDetailsViewBody extends StatelessWidget {
  const SearchProductDetailsViewBody({super.key, required this.model});
  final DataProduct2 model;

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<PostCartCubit, PostCartState>(
      builder: (context, state) {
        var postCubit = BlocProvider.of<PostCartCubit>(context);
        return Padding(
          padding: const EdgeInsets.all(15.0),
          child: Column(
            children: [
              Expanded(
                child: SingleChildScrollView(
                  physics: const BouncingScrollPhysics(),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      SearchProductDetailsImages(model: model),
                      const SizedBox(
                        height: 10,
                      ),
                      Text(
                        model.name ?? '',
                        style: const TextStyle(
                          fontSize: size18,
                          fontWeight: FontWeight.w500,
                        ),
                      ),
                      const SizedBox(
                        height: 10,
                      ),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.end,
                        children: [

                            Text(
                              ' EGP ${model.price!.round()}',
                              style: const TextStyle(
                                color: mainColor,
                                fontWeight: FontWeight.w500,
                                fontSize: size18,
                              ),
                            ),

                        ],
                      ),
                      const SizedBox(
                        height: 10,
                      ),
                      const Text(
                        'Description',
                        style: TextStyle(
                          fontWeight: FontWeight.w400,
                          fontSize: 24,
                        ),
                      ),
                      const SizedBox(
                        height: 10,
                      ),
                      Text(
                        '${model.description}',
                        style: const TextStyle(
                          fontWeight: FontWeight.w400,
                          fontSize: 18,
                        ),
                      ),
                      const SizedBox(
                        height: 20,
                      ),
                    ],
                  ),
                ),
              ),
              Row(
                children: [
                  Column(
                    children: [
                      const Text(
                        'Total Price',
                        style: TextStyle(fontSize: 24, color: mainColor),
                      ),
                      Text(
                        ' EGP ${ model.price!.round()}',
                        style: const TextStyle(
                          fontSize: 24,
                          color: mainColor,
                        ),
                      ),
                    ],
                  ),
                  const Spacer(),
                  InkWell(
                    onTap: () {
                      postCubit.postCart(
                        productId: model.id!.toString(),
                      );
                    },
                    child: Container(
                      width: MediaQuery.of(context).size.width * .55,
                      decoration:  BoxDecoration(
                        borderRadius:
                        const BorderRadiusDirectional.all(Radius.circular(25)),
                        color: HomeRepo.cartId
                            .contains(model.id.toString())
                            ? mainColor
                            : Colors.grey,
                      ),
                      child: const Padding(
                        padding: EdgeInsets.all(8.0),
                        child: Row(
                          children: [
                            SizedBox(
                              width: 10,
                            ),
                            Icon(
                              Icons.add_shopping_cart,
                              size: 35,
                              color: Colors.white,
                            ),
                            SizedBox(
                              width: 10,
                            ),
                            Expanded(
                              child: Text(
                                'Add to cart',
                                style: TextStyle(
                                    color: Colors.white, fontSize: 24),
                              ),
                            ),
                          ],
                        ),
                      ),
                    ),
                  )
                ],
              ),
            ],
          ),
        );
      },
    );
  }
}
