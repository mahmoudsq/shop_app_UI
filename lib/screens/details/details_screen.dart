import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:shop_app/component/icon_rounded_btn.dart';
import 'package:shop_app/models/Product.dart';
import '../../size_config.dart';
import 'components/body.dart';
import 'components/custom_app_bar.dart';

class DetailsScreen extends StatelessWidget {
  static String routeName= "/details";
  @override
  Widget build(BuildContext context) {
    final ProductDetailsArgument argument = ModalRoute.of(context)!.settings.arguments as ProductDetailsArgument;
    return Scaffold(
      backgroundColor: Color(0xFFF5F6F9),
      appBar: PreferredSize(
        preferredSize: Size.fromHeight(AppBar().preferredSize.height),
        child: SafeArea(
          child: Padding(
            padding: EdgeInsets.symmetric(horizontal: getProportionateScreenWidth(20)),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                RoundedIconBtn(
                  iconData: Icons.arrow_back_ios,
                  press: () => Navigator.pop(context),
                ),
                Container(
                  padding: EdgeInsets.symmetric(horizontal: 15,vertical: 5),
                  decoration: BoxDecoration(
                      color: Colors.white,
                      borderRadius: BorderRadius.circular(15)
                  ),
                  child: Row(
                    children: [
                      Text(argument.product.rating.toString(),
                        style: TextStyle(
                            fontWeight: FontWeight.w600
                        ),),
                      const SizedBox(width: 5,),
                      SvgPicture.asset("assets/icons/Star Icon.svg"),
                    ],
                  ),
                )
              ],
            ),
          ),
        ),
      ),
      body: Body(
        product: argument.product,
      ),
    );
  }
}

//CustomAppBar(argument.product.rating),

class ProductDetailsArgument{
  final Product product;

  ProductDetailsArgument({required this.product});
}