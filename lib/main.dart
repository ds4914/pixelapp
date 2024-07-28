import 'package:flutter/material.dart';
import 'package:pixelapp/constants/route_list.dart';
import 'package:pixelapp/presentation/ui/customer_list_page/customer_list_page.dart';
import 'package:pixelapp/presentation/ui/registration_page/registration_page.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Pixel App',
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple),
        useMaterial3: true,
      ),
      initialRoute: RouteList.registrationPage,
      routes: {RouteList.customerListPage: (context) => const CustomerListPage(), RouteList.registrationPage: (context) => RegistrationPage()},
      home: RegistrationPage(),
    );
  }
}
