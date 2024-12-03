import 'package:ai_retouch/features/pro_button/presentation/bloc/cubit/subscription_cubit.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'features/home/presentation/screen/home_screen.dart';
import 'features/banner_1/presentation/bloc/cubit/enhance_photo_cubit.dart';

void main() {
  runApp(
    MultiBlocProvider(
        providers: [
          BlocProvider<SubscriptionCubit>(
            create: (context) => SubscriptionCubit(),
          ),
          BlocProvider<EnhancePhotoCubit>(
              create: (context) => EnhancePhotoCubit()
          )
        ],
        child: const MyApp(),
    )
  );
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return ScreenUtilInit(
      designSize: const Size(375, 812),
      minTextAdapt: true,
      splitScreenMode: true,
      builder: (context,  child){
        return MaterialApp(
          debugShowCheckedModeBanner: false,
          title: 'AI Retouch',
          theme: ThemeData(
            scaffoldBackgroundColor: Color(0xFF1A1A1A),
          ),
          home: HomeScreen(),
        );
      },
    );
  }
}
