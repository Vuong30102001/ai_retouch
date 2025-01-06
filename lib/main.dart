import 'dart:async';

import 'package:ai_retouch/features/enhance_photo/data/data_source/enhance_photo_data_source.dart';
import 'package:ai_retouch/features/enhance_photo/data/repositories/enhance_photo_repository_impl.dart';
import 'package:ai_retouch/features/enhance_photo/domain/repositories/enhance_photo_repository.dart';
import 'package:ai_retouch/features/pro_button/presentation/widget/pro_button_widget.dart';
import 'package:ai_retouch/features/remove_object/data/data_source/remove_object_data_source.dart';
import 'package:ai_retouch/features/remove_object/data/repositories/remove_object_repository_impl.dart';
import 'package:ai_retouch/features/remove_object/domain/repositories/remove_object_repository.dart';
import 'package:ai_retouch/features/remove_object/presentation/cubit/cubit/remove_object_cubit.dart';
import 'package:ai_retouch/features/restore_old_picture/data/data_source/restore_old_picture_data_source.dart';
import 'package:ai_retouch/features/restore_old_picture/data/repositories/restore_old_picture_repository_impl.dart';
import 'package:ai_retouch/features/restore_old_picture/domain/repositories/restore_old_picture_repository.dart';
import 'package:ai_retouch/features/restore_old_picture/domain/use_case/restore_old_picture_use_case.dart';
import 'package:ai_retouch/features/restore_old_picture/presentation/cubit/cubit/done_popup_cubit.dart';
import 'package:ai_retouch/features/restore_old_picture/presentation/cubit/cubit/restore_old_picture_cubit.dart';
import 'package:ai_retouch/features/restore_old_picture/presentation/widget/done_popup_widget.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:google_mobile_ads/google_mobile_ads.dart';
import 'package:provider/provider.dart';
import 'features/enhance_photo/presentation/cubit /cubit/enhance_photo_cubit.dart';
import 'features/home/presentation/screen/home_screen.dart';
import 'features/banner_1/presentation/bloc/cubit/banner_1_cubit.dart';
import 'features/subscription/presentation/cubit/cubit/subscription_cubit.dart';

void main() async {

  WidgetsFlutterBinding.ensureInitialized();
  MobileAds.instance.updateRequestConfiguration(
      RequestConfiguration(testDeviceIds: ['ca-app-pub-3940256099942544~3347511713'])
  );
  unawaited(MobileAds.instance.initialize());
  runApp(
   MultiBlocProvider(
          providers: [
            BlocProvider<Banner1Cubit>(
              create: (context) => Banner1Cubit(),
            ),

          ],
          child: const MyApp(),
        ),
    );
}


class MyApp extends StatefulWidget {
  const MyApp({super.key});

  @override
  State<MyApp> createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {

  @override
  Widget build(BuildContext context) {
    return MultiBlocProvider(
        providers: [
          Provider<EnhancePhotoRepository>(
              create: (context) => EnhancePhotoRepositoryImpl(mediaDataSource: EnhancePhotoDataSource()),
          ),
          BlocProvider<EnhancePhotoCubit>(
              create: (context) => EnhancePhotoCubit(
                repository: context.read<EnhancePhotoRepository>(),
              )..fetchAlbums(),
          ),
          Provider<RestoreOldPictureRepository>(
            create: (context) => RestoreOldPictureRepositoryImpl(RestoreOldPictureDataSource()),
          ),
          Provider<RestoreOldPictureUseCase>(
              create: (context) => RestoreOldPictureUseCase(
                context.read<RestoreOldPictureRepository>(),
              )
          ),
          BlocProvider<RestoreOldPictureCubit>(
            create: (context) => RestoreOldPictureCubit(
              repository: context.read<RestoreOldPictureRepository>(),
            )..fetchAlbums()
          ),
          Provider<RemoveObjectRepository>(
              create: (context) => RemoveObjectRepositoryImpl(removeObjectDataSource: RemoveObjectDataSource()),
          ),
          BlocProvider<RemoveObjectCubit>(
              create: (context) => RemoveObjectCubit()..fetchAlbums(),
          ),

          Provider<SubscriptionCubit>(
              create: (_) => SubscriptionCubit(),
            child: const ProButtonWidget(),
          ),
          BlocProvider<DonePopupCubit>(
            create: (_) => DonePopupCubit(),
            child: const DonePopupWidget(),
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
              home: HomeScreen(

              ),
            );
          },
        )
    );
  }
}
