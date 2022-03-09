import 'package:flutter/material.dart';
import 'package:shop_app/component/default_button.dart';
import 'package:shop_app/models/Product.dart';
import 'package:shop_app/screens/details/components/product_description.dart';
import 'package:shop_app/screens/details/components/product_images.dart';
import 'package:shop_app/screens/details/components/top_rounded_container.dart';
import 'package:shop_app/size_config.dart';

import 'color_dots.dart';

class Body extends StatelessWidget {
  final Product product;

  const Body({Key? key, required this.product}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      child: Column(
        children: [
          ProductImages(product: product),
          TopRoundedContainer(
            color: Colors.white,
            child: ProductDescription(product: product,
            pressOnSeeMore: () {

            },),
          ),
          TopRoundedContainer(
              color: Color(0xFFF6F7F9),
              child: Column(
                children: [
                  ColorDots(product: product),
                  TopRoundedContainer(color: Colors.white,
                      child: Padding(
                        padding:  EdgeInsets.only(
                            right: SizeConfig.screenWidth * 0.1,
                          left: SizeConfig.screenWidth * 0.1,
                          top: getProportionateScreenWidth(10),
                          bottom: getProportionateScreenWidth(40)
                        ),
                        child: DefaultButton(
                          text: "Add To Cart",
                          press: (){

                          },
                        ),
                      )),
                ],
              )
          ),
        ],
      ),
    );
  }
}





