import 'package:flutter/material.dart';
import 'package:shop_app/component/default_button.dart';
import 'package:shop_app/component/form_error.dart';
import 'package:shop_app/component/svg_surfix_icon.dart';
import 'package:shop_app/screens/OTP/otp_screen.dart';

import '../../../constants.dart';
import '../../../size_config.dart';

class CompleteProfileForm extends StatefulWidget {
  @override
  _CompleteProfileFormState createState() => _CompleteProfileFormState();
}

class _CompleteProfileFormState extends State<CompleteProfileForm> {
  final _formKey = GlobalKey<FormState>();
  final List<String> errors = [];
  String firstName = '';
  String lastName = '';
  String phoneNumber = '';
  String address = '';

  void addError({required String error}){
    if(!errors.contains(error)){
      setState(() {
        errors.add(error);
      });
    }
  }

  void removeError({required String error}){
    if(errors.contains(error)){
      setState(() {
        errors.remove(error);
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    return Form(
      key: _formKey,
      child: Column(
        children: [
          SizedBox(height: getProportionateScreenHeight(20),),
          buildFirstNameFormField(),
          SizedBox(height: getProportionateScreenHeight(20),),
          buildLastNameFormField(),
          SizedBox(height: getProportionateScreenHeight(20),),
          buildPhoneFormField(),
          SizedBox(height: getProportionateScreenHeight(20),),
          buildAddressFormField(),
          FormError(errors: errors),
          SizedBox(height: getProportionateScreenHeight(40),),
          DefaultButton(
            text: "Continue",
            press: (){
              if(_formKey.currentState!.validate()){
                Navigator.pushNamed(context, OTPScreen.routeName);
              }
            },
          )
        ],
      ),
    );
  }

  TextFormField buildFirstNameFormField() {
    return TextFormField(
      onSaved: (newValue) => firstName = newValue!,
      onChanged: (value) {
        if(value.isNotEmpty){
          removeError(error: kNamelNullError);
        }
        return null;
      },
      validator: (value) {
        if(value!.isEmpty){
          addError(error: kNamelNullError);
          return "";
        }
        return null;
      },
      decoration: InputDecoration(
          hintText: "Enter your first name",
          labelText: "First Name",
          floatingLabelBehavior: FloatingLabelBehavior.always,
          suffixIcon: CustomSurffixIcon(svgIcon: "assets/icons/User.svg",)
      ),
    );
  }
  TextFormField buildLastNameFormField() {
    return TextFormField(
      onSaved: (newValue) => lastName = newValue!,

      decoration: InputDecoration(
          hintText: "Enter your last name",
          labelText: "Last Name",
          floatingLabelBehavior: FloatingLabelBehavior.always,
          suffixIcon: CustomSurffixIcon(svgIcon: "assets/icons/User.svg",)
      ),
    );
  }
  TextFormField buildPhoneFormField() {
    return TextFormField(
      keyboardType: TextInputType.number,
      onSaved: (newValue) => phoneNumber = newValue!,
      onChanged: (value) {
        if(value.isNotEmpty){
          removeError(error: kPhoneNumberNullError);
        }
        return null;
      },
      validator: (value) {
        if(value!.isEmpty){
          addError(error: kPhoneNumberNullError);
          return "";
        }
        return null;
      },
      decoration: InputDecoration(
          hintText: "Enter your phone number",
          labelText: "Phone Number",
          floatingLabelBehavior: FloatingLabelBehavior.always,
          suffixIcon: CustomSurffixIcon(svgIcon: "assets/icons/Phone.svg",)
      ),
    );
  }
  TextFormField buildAddressFormField() {
    return TextFormField(
      onSaved: (newValue) => address = newValue!,
      onChanged: (value) {
        if(value.isNotEmpty){
          removeError(error: kAddressNullError);
        }
        return null;
      },
      validator: (value) {
        if(value!.isEmpty){
          addError(error: kAddressNullError);
          return "";
        }
        return null;
      },
      decoration: InputDecoration(
          hintText: "Enter your address",
          labelText: "Address",
          floatingLabelBehavior: FloatingLabelBehavior.always,
          suffixIcon: CustomSurffixIcon(svgIcon: "assets/icons/Location point.svg",)
      ),
    );
  }
}
