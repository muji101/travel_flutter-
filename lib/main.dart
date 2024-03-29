import 'package:airplane/cubit/destination_cubit.dart';
import 'package:airplane/cubit/page_cubit.dart';
import 'package:airplane/cubit/seat_cubit.dart';
import 'package:airplane/cubit/transaction_cubit.dart';
import 'package:airplane/ui/pages/bonus_page.dart';
import 'package:airplane/ui/pages/get_started_page.dart';
import 'package:airplane/ui/pages/main_page.dart';
import 'package:airplane/ui/pages/sign_in_page.dart';
import 'package:airplane/ui/pages/sign_up_page.dart';
import 'package:airplane/ui/pages/splash_page.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import 'cubit/auth_cubit.dart';


void main() async{
  // WidgetsFlutterBinding.ensureInitialized();
  // await Firebase.initializeApp(
    
  // );
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp();

  runApp(MyApp());
}
// options: FirebaseOptions(
//       apiKey: "AIzaSyAukP6WU_SSTsQFmmOGf1ZOEqLB28FmKG4", // Your apiKey
//       appId: "1:915255702344:android:bb8ec47d381328d2b9397d", // Your appId
//       messagingSenderId: "915255702344", // Your messagingSenderId
//       projectId: "airplane-f11f1", // Your projectId
//     ),


class MyApp extends StatelessWidget {
  const MyApp({ Key? key }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MultiBlocProvider(
      providers: [
        BlocProvider(
          create: (context) => PageCubit(),
        ),
        BlocProvider(
          create: (context) => AuthCubit(),
        ),
        BlocProvider(
          create: (context) => DestinationCubit(),
        ),
        BlocProvider(
          create: (context) => SeatCubit(),
        ),
        BlocProvider(
          create: (context) => TransactionCubit(),
        ),
      ],
      child: MaterialApp(
        debugShowCheckedModeBanner: false,
        routes: {
          '/' : (context) => SplashPage(),
          '/get-started' : (context) => GetStartedPage(),
          '/sign-up' :(context) => SignUpPage(),
          '/sign-in' :(context) => SignInPage(),
          '/bonus' :(context) => BonusPage(),
          '/main' :(context) => MainPage(),
        },
      ),
    );
  }
}