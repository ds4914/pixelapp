import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:pixelapp/constants/app_colors.dart';
import 'package:pixelapp/constants/route_list.dart';
import 'package:pixelapp/constants/strings.dart';

import '../../../../data/models/user_model.dart';

class CustomerCard extends StatelessWidget {
  final dynamic customer;
  void Function()? onDeleteTap;
  CustomerCard({super.key,required this.onDeleteTap, required this.customer});

  @override
  Widget build(BuildContext context) {
    return Card(
        child: Padding(
      padding: const EdgeInsets.all(10.0),
      child: Column(
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Expanded(
                child: Row(
                  children: [
                    const Text(
                      '${Strings.fullName}: ',
                      style: TextStyle(color: AppColors.textBlackColor),
                    ),
                    Text(
                      customer.fullName,
                      style: const TextStyle(color: AppColors.grey),
                    )
                  ],
                ),
              ),
              Row(
                children: [
                  GestureDetector(
                    onTap: () {
                      Navigator.pushNamed(context, RouteList.registrationPage, arguments: customer);
                    },
                    child: Container(
                      height: 28,
                      width: 28,
                      decoration: BoxDecoration(border: Border.all(color: AppColors.appbarBgColor), borderRadius: BorderRadius.all(Radius.circular(8))),
                      child: const Icon(
                        Icons.edit,
                        color: AppColors.appbarBgColor,
                      ),
                    ),
                  ),
                  const SizedBox(width: 5,),
                  GestureDetector(
                    onTap: onDeleteTap,
                    child: Container(
                      height: 28,
                      width: 28,
                      decoration: BoxDecoration(border: Border.all(color: AppColors.appbarBgColor), borderRadius: BorderRadius.all(Radius.circular(8))),
                      child: const Icon(
                        Icons.delete,
                        color: AppColors.appbarBgColor,
                      ),
                    ),
                  ),
                ],
              )
            ],
          ),
          Row(
            children: [
              const Text('${Strings.pan}: '),
              Text(
                customer.panNumber,
                style: const TextStyle(color: AppColors.grey),
              )
            ],
          ),
          Row(
            children: [
              const Text('${Strings.mobileNumber}: '),
              Text(
                customer.mobileNumber,
                style: const TextStyle(color: AppColors.grey),
              )
            ],
          ),
          Row(
            children: [
              const Text('${Strings.email}: '),
              Text(
                customer.email,
                style: const TextStyle(color: AppColors.grey),
              )
            ],
          ),
          Row(
            children: [
              const Text('${Strings.addressLine1}: '),
              Text(
                customer.addressLine1,
                style: const TextStyle(color: AppColors.grey),
              )
            ],
          ),
          Row(
            children: [
              const Text('${Strings.addressLine2}: '),
              Text(
                customer.addressLine2,
                style: const TextStyle(color: AppColors.grey),
              )
            ],
          ),
          Row(
            children: [
              const Text('${Strings.postCode}: '),
              Text(
                customer.postcode,
                style: const TextStyle(color: AppColors.grey),
              )
            ],
          ),
          Row(
            children: [
              const Text('${Strings.state}: '),
              Expanded(
                child: Text(
                  customer.state,
                  style: const TextStyle(color: AppColors.grey),
                ),
              )
            ],
          ),
          Row(
            children: [
              const Text('${Strings.city}: '),
              Text(
                customer.city,
                style: const TextStyle(color: AppColors.grey),
              )
            ],
          ),
        ],
      ),
    ));
  }
}
