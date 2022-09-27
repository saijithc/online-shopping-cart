import 'package:flutter/material.dart';
import 'package:machinetask/details/provider/provider.dart';
import 'package:machinetask/helper_function/helper_function.dart';
import 'package:machinetask/home/view/home_screen.dart';
import 'package:machinetask/home/provider/provider.dart';
import 'package:machinetask/login/provider/provider.dart';
import 'package:machinetask/login/view/login_screen.dart';

import 'package:provider/provider.dart';

Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();
  final islogged =
      await HelperFuction().getUserSignInSharedpreference() ?? false;
  runApp(MyApp(
    islogged: islogged,
  ));
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key, required this.islogged}) : super(key: key);
  final bool islogged;
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MultiProvider(
      providers: [
        ChangeNotifierProvider(create: (_) => LoginProvider()),
        ChangeNotifierProvider(create: (_) => DetailProvider()),
        ChangeNotifierProvider(create: (_) => HomeProvider()),
      ],
      child: MaterialApp(
        debugShowCheckedModeBanner: false,
        title: 'Flutter Demo',
        theme: ThemeData(
          primarySwatch: Colors.blue,
        ),
        home: islogged == true ? const HomeScreen() : const LoginScreen(),
      ),
    );
  }
}
