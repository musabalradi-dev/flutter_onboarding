import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_onboarding/feature/home/presentation/screen/home.dart';
import 'package:flutter_onboarding/feature/onboarding/presentation/bloc/bloc/onboarding_bloc.dart';
import 'package:flutter_onboarding/feature/onboarding/presentation/widgets/get_started_button.dart';
import 'package:flutter_onboarding/feature/onboarding/presentation/widgets/next_button.dart';
import 'package:flutter_onboarding/feature/onboarding/presentation/widgets/onboarding_page.dart';
import 'package:flutter_onboarding/feature/onboarding/presentation/widgets/skip_button.dart';
import 'package:smooth_page_indicator/smooth_page_indicator.dart';

class OnBoardingScreen extends StatelessWidget {
  OnBoardingScreen({super.key});

  final PageController _pageController = PageController();
  final Duration _pageTransitionDuration = const Duration(milliseconds: 500);
  final Curve _pageTransitionCurve = Curves.fastOutSlowIn;

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    final isLastPage = context.select<OnboardingBloc, bool>(
      (bloc) => bloc.state is OnBoardingLoadedState 
        ? (bloc.state as OnBoardingLoadedState).currentPage == 
          (bloc.state as OnBoardingLoadedState).contents.length - 1
        : false,
    );

    return Scaffold(
      body: BlocListener<OnboardingBloc, OnboardingState>(
        listener: (context, state) {
          if (state is OnboardingCompletedState) {
            Navigator.pushReplacement(
              context,
              MaterialPageRoute(builder: (context) => HomeScreen()),
            );
          }
        },
        child: BlocBuilder<OnboardingBloc, OnboardingState>(
          builder: (context, state) {
            if (state is OnBoardingLoadedState) {
              return Stack(
                children: [
                  // الصفحات الرئيسية
                  PageView.builder(
                    controller: _pageController,
                    itemCount: state.contents.length,
                    onPageChanged: (index) {
                      context.read<OnboardingBloc>().add(
                        UpdatePageIndexEvent(index),
                      );
                    },
                    itemBuilder: (context, index) {
                      final content = state.contents[index];
                      return OnboardingPage(content: content);
                    },
                  ),

                  // زر التخطي
                  Positioned(
                    top: MediaQuery.of(context).padding.top + 16,
                    right: 24,
                    child: AnimatedOpacity(
                      opacity: isLastPage ? 0 : 1,
                      duration: const Duration(milliseconds: 300),
                      child: SkipButton(theme: theme),
                    ),
                  ),

                  // مؤشر الصفحات
                  Positioned(
                    bottom: 120,
                    left: 0,
                    right: 0,
                    child: Center(
                      child: SmoothPageIndicator(
                        controller: _pageController,
                        count: state.contents.length,
                        effect: ExpandingDotsEffect(
                          dotWidth: 8,
                          dotHeight: 8,
                          activeDotColor: theme.colorScheme.primary,
                          dotColor: theme.colorScheme.onSurface.withValues(alpha:  0.2),
                          spacing: 8,
                          expansionFactor: 3,
                        ),
                      ),
                    ),
                  ),

                  Positioned(
                    bottom: 40,
                    left: 24,
                    right: 24,
                    child: state.currentPage == state.contents.length - 1
                          ? GetStartedButton(theme: theme, state: state)
                          : NextButton(
                              theme: theme,
                              pageController: _pageController,
                              duration: _pageTransitionDuration,
                              curve: _pageTransitionCurve,
                            ),)
                
                ],
              );
            }
            return const Center(child: CircularProgressIndicator());
          },
        ),
      ),
    );
  }
}