import 'package:flutter/material.dart';
import 'package:get_storage/get_storage.dart';
import 'package:pixelapp/constants/strings.dart';
import 'package:pixelapp/presentation/ui/customer_list_page/widgets/customer_card.dart';

import '../../../constants/app_colors.dart';
import '../../../constants/route_list.dart';
import '../../../data/models/user_model.dart';

class CustomerListPage extends StatefulWidget {
  const CustomerListPage({super.key});

  @override
  State<CustomerListPage> createState() => _CustomerListPageState();
}

class _CustomerListPageState extends State<CustomerListPage> {
  List<dynamic> customerList = [];
  @override
  void initState() {
    customerList = GetStorage().read(Strings.dbKey) ?? [];
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    print(customerList.length);
    return PopScope(
      canPop: false,
      child: Scaffold(
        backgroundColor: AppColors.bgColor,
        appBar: AppBar(
          title: const Text(
            Strings.customerListScreen,
            style: TextStyle(color: AppColors.white),
          ),
          centerTitle: true,
          backgroundColor: AppColors.appbarBgColor,leading: const Text(""),
          actions: [
            GestureDetector(
              onTap: () {
                Navigator.pushNamed(context, RouteList.registrationPage);
              },
              child: Container(
                height: 28,
                width: 28,
                margin: const EdgeInsets.all(10),
                decoration: BoxDecoration(border: Border.all(color: AppColors.white), borderRadius: const BorderRadius.all(Radius.circular(8))),
                child: const Icon(
                  Icons.add,
                  color: AppColors.white,
                ),
              ),
            ),
          ],
        ),
        body: Padding(
          padding: const EdgeInsets.all(10.0),
          child: Column(
            children: [
              Expanded(
                child: customerList.isEmpty
                    ? const Center(
                        child: Padding(
                          padding: EdgeInsets.symmetric(horizontal: 20.0),
                          child: Text("No Customers!!!! please add by clicking plus icon at the top"),
                        ),
                      )
                    : ListView.builder(
                        itemCount: customerList.length,
                        itemBuilder: (context, index) {
                          return CustomerCard(
                            customer: customerList[index],
                            onDeleteTap: () {
                              customerList.remove(customerList[index]);
                              GetStorage().write(Strings.dbKey, customerList);
                              setState(() {});
                            },
                          );
                        }),
              )
            ],
          ),
        ),
      ),
    );
  }
}
