import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:shop_app/screens/home/components/popular_products.dart';
import 'package:shop_app/screens/home/components/special_offers.dart';
import 'package:shop_app/size_config.dart';

import 'categories.dart';
import 'discount_banner.dart';
import 'home_header.dart';

class Body extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return SafeArea(
        child: SingleChildScrollView(
          child: Column(
            children: [
              SizedBox(height: getProportionateScreenHeight(20),),
              HomeHeader(),
              SizedBox(height: getProportionateScreenHeight(30),),
              DiscountBanner(),
              SizedBox(height: getProportionateScreenHeight(20),),
              Categories(),
              SizedBox(height: getProportionateScreenHeight(10),),
              SpecialOffers(),
              SizedBox(height: getProportionateScreenHeight(20),),
              PopularProducts(),
              SizedBox(height: getProportionateScreenHeight(20),),
            ],
          ),
        )
    );
  }
}















