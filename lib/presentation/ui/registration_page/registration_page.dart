import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:get_storage/get_storage.dart';
import 'package:pixelapp/common_widgets/common_search_textfield.dart';
import 'package:pixelapp/common_widgets/exts.dart';
import 'package:pixelapp/constants/app_colors.dart';
import 'package:pixelapp/common_widgets/common_textfield.dart';
import 'package:pixelapp/constants/route_list.dart';
import 'package:pixelapp/constants/strings.dart';
import 'package:pixelapp/data/models/user_model.dart';
import 'package:pixelapp/presentation/bloc/api_bloc.dart';
import 'package:textfield_search/textfield_search.dart';

class RegistrationPage extends StatelessWidget {
  RegistrationPage({super.key});

  TextEditingController panController = TextEditingController();
  TextEditingController fullNameController = TextEditingController();
  TextEditingController mobileNumberController = TextEditingController();
  TextEditingController emailController = TextEditingController();
  TextEditingController addressLine1Controller = TextEditingController();
  TextEditingController addressLine2Controller = TextEditingController();
  TextEditingController stateController = TextEditingController();
  TextEditingController cityController = TextEditingController();
  TextEditingController postCodeController = TextEditingController();

  ApiBloc panCardBloc = ApiBloc();
  ApiBloc postalCodeBloc = ApiBloc();

  @override
  Widget build(BuildContext context) {
    if (ModalRoute.of(context)!.settings.arguments != null) {
      UserModel args = ModalRoute.of(context)!.settings.arguments as UserModel;
      panController.text = args.panNumber;
      fullNameController.text = args.fullName;
      mobileNumberController.text = args.mobileNumber;
      emailController.text = args.email;
      addressLine1Controller.text = args.addressLine1;
      addressLine2Controller.text = args.addressLine2;
      postCodeController.text = args.postcode;
      stateController.text = args.state;
      cityController.text = args.city;
    }
    return PopScope(
      canPop: false,
      child: Scaffold(
        backgroundColor: AppColors.bgColor,
        appBar: AppBar(
          title: const Text(
            Strings.registrationScreen,
            style: TextStyle(color: AppColors.white),
          ),
          leading: const Text(""),
          backgroundColor: AppColors.appbarBgColor,
          centerTitle: true,
        ),
        resizeToAvoidBottomInset: true,
        body: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 10.0),
          child: SingleChildScrollView(
            child: Column(
              children: [
                const SizedBox(
                  height: 10,
                ),
                CommonTextField(
                  labelText: Strings.pan,
                  controller: panController,
                  maxLength: 10,
                  prefixIcon: Icons.person,
                  validator: (value) {
                    if (value.toString().isValidPanCardNo()) {
                      panCardBloc.add(VerifyPanCardDetailsEvent(value.toString()));
                    }
                    return value.toString().isValidPanCardNo() ? null : Strings.pleaseEnterValidPanNumber;
                  },
                  suffix: BlocBuilder<ApiBloc, ApiState>(
                    bloc: panCardBloc,
                    builder: (context, state) {
                      return (state is VerifyPanCardDetailsLoadingState) ? circularProgressIndicator() : const SizedBox.shrink();
                    },
                  ),
                ),
                BlocBuilder<ApiBloc, ApiState>(
                  bloc: panCardBloc,
                  builder: (context, state) {
                    if (state is VerifyPanCardDetailsLoadedState) {
                      fullNameController.text = state.responseModel.fullName.toString();
                    }
                    return CommonTextField(
                      labelText: Strings.fullName,
                      prefixIcon: Icons.drive_file_rename_outline,
                      maxLength: 140,
                      controller: fullNameController,
                      readOnly: true,
                    );
                  },
                ),
                CommonTextField(
                    keyboardType: TextInputType.number,
                    labelText: Strings.mobileNumber,
                    maxLength: 10,
                    prefixText: "+91 ",
                    prefixIcon: Icons.numbers,
                    validator: (value) => value.toString().isValidMobileNumber() ? null : Strings.pleaseEnterValidMobileNumber,
                    inputFormatters: [FilteringTextInputFormatter.digitsOnly],
                    controller: mobileNumberController),
                CommonTextField(
                  labelText: Strings.email,
                  maxLength: 255,
                  controller: emailController,
                  prefixIcon: Icons.email,
                  validator: (value) => value.toString().isEmailValid() ? null : Strings.pleaseEnterValidEmail,
                ),
                CommonTextField(labelText: Strings.addressLine1, controller: addressLine1Controller,prefixIcon: Icons.location_city,),
                CommonTextField(labelText: Strings.addressLine2, controller: addressLine2Controller,prefixIcon: Icons.cell_tower,),
                CommonTextField(
                    labelText: Strings.postCode,
                    maxLength: 6,
                    prefixIcon: Icons.post_add_outlined,
                    suffix: BlocBuilder<ApiBloc, ApiState>(
                      bloc: postalCodeBloc,
                      builder: (context, state) {
                        return (state is PostalCodeDetailsLoadingState) ? circularProgressIndicator() : const SizedBox.shrink();
                      },
                    ),
                    keyboardType: TextInputType.number,
                    validator: (value) {
                      if (value.toString().isValidPostalCode()) {
                        postalCodeBloc.add(VerifyPostalCodeDetailsEvent(int.tryParse(value.toString()) ?? 0));
                      }
                      return value.toString().isValidPostalCode() ? null : Strings.pleaseEnterValidPostalCode;
                    },
                    controller: postCodeController),
                BlocBuilder<ApiBloc, ApiState>(
                  bloc: postalCodeBloc,
                  builder: (context, state) {
                    if(state is PostalCodeDetailsLoadedState){
                      stateController.text = state.responseModel.state!.first.name.toString();
                    }
                    return CommonSearchTextField(
                      controller: stateController,
                      prefixIcon: Icons.location_city_outlined,
                      initialList: (state is PostalCodeDetailsLoadedState) ? state.state : [],
                      labelText: Strings.state,
                    );
                  },
                ),
                BlocBuilder<ApiBloc, ApiState>(
                  bloc: postalCodeBloc,
                  builder: (context, state) {
                    if(state is PostalCodeDetailsLoadedState){
                      cityController.text = state.responseModel.city!.first.name.toString();
                    }
                    return Padding(
                      padding: const EdgeInsets.only(bottom: 50),
                      child: CommonSearchTextField(
                        prefixIcon: Icons.location_city,
                          labelText: Strings.city, controller: cityController, initialList: (state is PostalCodeDetailsLoadedState) ? state.city : []),
                    );
                  },
                ),
                const SizedBox(height: 10),
              ],
            ),
          ),
        ),
        bottomNavigationBar: GestureDetector(
          onTap: () {
            if (panController.text.isEmpty || !panController.text.toString().isValidPanCardNo()) {
              ScaffoldMessenger.of(context).showSnackBar(const SnackBar(content: Text(Strings.pleaseEnterValidPanNumber)));
            } else if (mobileNumberController.text.isEmpty || mobileNumberController.text.length<10) {
              ScaffoldMessenger.of(context).showSnackBar(const SnackBar(content: Text(Strings.pleaseEnterValidMobileNumber)));
            } else if (emailController.text.isEmpty || !emailController.text.isEmailValid()) {
              ScaffoldMessenger.of(context).showSnackBar(const SnackBar(content: Text(Strings.pleaseEnterValidEmail)));
            } else if (addressLine1Controller.text.isEmpty) {
              ScaffoldMessenger.of(context).showSnackBar(const SnackBar(content: Text(Strings.addressLine1IsRequired)));
            } else if (postCodeController.text.isEmpty || postCodeController.text.length < 6) {
              ScaffoldMessenger.of(context).showSnackBar(const SnackBar(content: Text(Strings.pleaseEnterValidPostalCode)));
            } else if (stateController.text.isEmpty) {
              ScaffoldMessenger.of(context).showSnackBar(const SnackBar(content: Text(Strings.stateIsRequired)));
            } else if (cityController.text.isEmpty) {
              ScaffoldMessenger.of(context).showSnackBar(const SnackBar(content: Text(Strings.cityIsRequired)));
            } else {

              UserModel userModel =  UserModel(
                  panNumber: panController.text,
                  fullName: fullNameController.text,
                  mobileNumber: mobileNumberController.text,
                  email: emailController.text,
                  addressLine1: addressLine1Controller.text,
                  addressLine2: addressLine2Controller.text,
                  postcode: postCodeController.text,
                  state: stateController.text,
                  city: cityController.text);
                Navigator.pushNamed(context, RouteList.customerListPage,arguments: userModel);
            }
          },
          child: Container(
            margin: const EdgeInsets.all(10),
            width: double.infinity,
            height: 50,
            decoration: const BoxDecoration(color: AppColors.appbarBgColor, borderRadius: BorderRadius.all(Radius.circular(15))),
            child: const Center(
                child: Text(
              'Register',
              style: TextStyle(color: AppColors.white),
            )),
          ),
        ),
      ),
    );
  }

  Widget circularProgressIndicator() {
    return const SizedBox(
        height: 20,
        width: 20,
        child: CircularProgressIndicator(
          strokeWidth: 2.0,
        ));
  }
}
