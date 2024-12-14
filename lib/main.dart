import 'package:ai_retouch/features/enhance_photo/data/data_source/enhance_photo_data_source.dart';
import 'package:ai_retouch/features/enhance_photo/data/repositories/enhance_photo_repository_impl.dart';
import 'package:ai_retouch/features/enhance_photo/domain/repositories/enhance_photo_repository.dart';
import 'package:ai_retouch/features/pro_button/presentation/bloc/cubit/subscription_cubit.dart';
import 'package:ai_retouch/features/remove_object/data/data_source/remove_object_data_source.dart';
import 'package:ai_retouch/features/remove_object/data/repositories/remove_object_repository_impl.dart';
import 'package:ai_retouch/features/remove_object/domain/repositories/remove_object_repository.dart';
import 'package:ai_retouch/features/remove_object/presentation/cubit/cubit/remove_object_cubit.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:provider/provider.dart';
import 'features/enhance_photo/presentation/cubit /cubit/enhance_photo_cubit.dart';
import 'features/home/presentation/screen/home_screen.dart';
import 'features/banner_1/presentation/bloc/cubit/banner_1_cubit.dart';

void main() {
  runApp(
   MultiBlocProvider(
          providers: [
            BlocProvider<SubscriptionCubit>(
              create: (context) => SubscriptionCubit(),
            ),
            BlocProvider<Banner1Cubit>(
              create: (context) => Banner1Cubit(),
            ),
          ],
          child: const MyApp(),
        ),
    );
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MultiBlocProvider(
        providers: [
          Provider<EnhancePhotoRepository>(
              create: (context) => EnhancePhotoRepositoryImpl(mediaDataSource: EnhancePhotoDataSource()),
          ),
          BlocProvider<EnhancePhotoCubit>(
              create: (context) => EnhancePhotoCubit()..fetchAlbums(),
          ),
          Provider<RemoveObjectRepository>(
              create: (context) => RemoveObjectRepositoryImpl(removeObjectDataSource: RemoveObjectDataSource()),
          ),
          BlocProvider<RemoveObjectCubit>(
              create: (context) => RemoveObjectCubit()..fetchAlbums(),
          )
        ],
        child: ScreenUtilInit(
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
        )
    );
  }
}
