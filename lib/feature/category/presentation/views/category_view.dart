import 'package:flutter/material.dart';
import 'package:smile_shop/generated/assets.dart';

class CategoryView extends StatelessWidget {
  const CategoryView({super.key});

  @override
  Widget build(BuildContext context) {
    return  Expanded(
      child: Padding(
        padding: const EdgeInsetsDirectional.only(top: 20),
        child: Row(
          children: [
            Expanded(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Expanded(
                    child: ClipRRect(
                      borderRadius: BorderRadius.circular(5.0),
                      child: Container(
                        width: MediaQuery.of(context).size.width *.33,
                        margin: const EdgeInsetsDirectional.only(top: 6.0,start: 6.0,bottom: 6.0 ),
                        decoration: const BoxDecoration(
                          borderRadius: BorderRadiusDirectional.only(topStart: Radius.circular(10.0),bottomStart:Radius.circular(10.0) ),
                          color: Colors.white,
                          boxShadow: [
                            BoxShadow(
                              color: Colors.deepPurple,
                              spreadRadius: 1,
                            ),
                          ],
                        ),
                        child: ListView.builder(itemBuilder: (context, index) => const CategoryName(),
                          itemCount: 10,
                        ),
                      ),
                    ),
                  ),
                ],
              ),
            ),
            const CategoryComponent()
          ],
        ),
      ),
    );
  }
}


class CategoryName extends StatelessWidget {
  const CategoryName({super.key});

  @override
  Widget build(BuildContext context) {
    return const SizedBox(
      height: 80,
      child: Center(
        child: Text('Man Clothes',style: TextStyle(
          fontSize: 20
        ),),
      ),
    );
  }
}

class CategoryComponent extends StatelessWidget {
  const CategoryComponent({super.key});

  @override
  Widget build(BuildContext context) {
    return Expanded(
      child: SingleChildScrollView(
        child: Column(
          children: [
            Stack(
              alignment: const Alignment(-.8, -.8),
              children: [
                Card(
                  clipBehavior: Clip.hardEdge,
                  child: Image.asset(Assets.imagesSmileShop,height: 180,width: MediaQuery.of(context).size.width ,fit: BoxFit.cover),
                ),
                const Text('Man \n Clothes',style: TextStyle(
                  color: Colors.white,
                  fontSize: 28
                ),)

              ],
            ),
            GridView.builder(
                shrinkWrap: true,
                physics: const NeverScrollableScrollPhysics(),
                itemCount: 100,
                gridDelegate:   const SliverGridDelegateWithFixedCrossAxisCount(
                  crossAxisCount: 3,
                  mainAxisSpacing: 20.0,
                ),
                itemBuilder: (context, index) {
                  return Card(
                    clipBehavior: Clip.hardEdge,
                    child: Image.asset(Assets.imagesSmileShop,fit: BoxFit.cover),
                  );
                }
            ),
          ],
        ),
      ),
    );
  }
}
