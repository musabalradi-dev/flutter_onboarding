import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_onboarding/feature/onboarding/presentation/bloc/bloc/onboarding_bloc.dart';
import 'package:flutter_onboarding/feature/onboarding/presentation/screen/onboarding.dart';

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MultiBlocProvider(
      providers: [
        BlocProvider(
          create: (context) => OnboardingBloc()..add(LoadOnboardingEvent()),
        ),
      ],
      child: MaterialApp(
        debugShowCheckedModeBanner: false,
        locale: Locale('en'),
        home: OnBoardingScreen(),
      ),
    );
  }
}
