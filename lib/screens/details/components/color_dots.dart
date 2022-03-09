import 'package:flutter/material.dart';
import 'package:shop_app/component/icon_rounded_btn.dart';
import 'package:shop_app/models/Product.dart';

import '../../../constants.dart';
import '../../../size_config.dart';

class ColorDots extends StatelessWidget {
  const ColorDots({
    Key? key,
    required this.product,
  }) : super(key: key);

  final Product product;

  @override
  Widget build(BuildContext context) {
    int selectedColor = 3;
    return Padding(
      padding: EdgeInsets.symmetric(horizontal: getProportionateScreenWidth(20)),
      child: Row(
        // mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          ...List.generate(product.colors.length,
                  (index) => ColorDot(color: product.colors[index],
                isSelected: selectedColor==index,)),
          Spacer(),
          RoundedIconBtn(iconData: Icons.remove,
            press: () {

            },),
          SizedBox(width: getProportionateScreenWidth(10),),
          RoundedIconBtn(iconData: Icons.add,
            press: () {

            },),
        ],
      ),
    );
  }
}

class ColorDot extends StatelessWidget {
  const ColorDot({
    Key? key,
    required this.color, this.isSelected = false,
  }) : super(key: key);

  final Color color;
  final bool isSelected;

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.only(right: 2),
      padding: EdgeInsets.all(8),
      height: getProportionateScreenWidth(40),
      width: getProportionateScreenWidth(40),
      decoration: BoxDecoration(
        //color: product.colors[0],
          shape: BoxShape.circle,
          border: Border.all(color: isSelected ? kPrimaryColor : Colors.transparent)
      ),
      child: DecoratedBox(
        decoration: BoxDecoration(
          shape: BoxShape.circle,
          color: color,
        ),
      ),
    );
  }
}

