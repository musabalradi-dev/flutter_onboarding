import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:flutter_onboarding/feature/onboarding/data/models/onboarding_model.dart';

part 'onboarding_event.dart';
part 'onboarding_state.dart';

class OnboardingBloc extends Bloc<OnboardingEvent, OnboardingState> {
  OnboardingBloc() : super(OnboardingInitialState()) {
    on<LoadOnboardingEvent>(_onLoadOnBoarding);
    on<UpdatePageIndexEvent>(_onUpdatePageIndex);
    on<CompleteOnboardingEvent>(_onCompleteOnboarding);
  }

  void _onLoadOnBoarding(
    LoadOnboardingEvent event,
    Emitter<OnboardingState> emit,
  ) {
    final contents = [
      OnboardingContent(
        image: 'assets/images/onboarding1.png',
        title: 'Your healthcare starts here',
        description:
            'We offer smart medical solutions to make it easier to monitor your health, easily connect with doctors, and get medical advice anytime!',
      ),

      OnboardingContent(
        image: 'assets/images/onboarding2.png',
        title: 'Your health is our priority',
        description:
            'An integrated medical application that provides you with virtual appointments, medical tests, and instant consultations with the best specialized doctors.',
      ),

      OnboardingContent(
        image: 'assets/images/onboarding3.png',
        title: 'Your doctor is at your fingertips',
        description:
            'No need to wait! Get instant medical advice, medication reminders, and accurate health monitoring wherever you are.',
      ),
    ];
    emit(OnBoardingLoadedState(contents: contents));
  }

  void _onUpdatePageIndex(
    UpdatePageIndexEvent event,
    Emitter<OnboardingState> emit,
  ) {
    if (state is OnBoardingLoadedState) {
      final currentState = state as OnBoardingLoadedState;
      emit(currentState.copyWith(currentPage: event.newIndex));
    }
  }

  void _onCompleteOnboarding(
    CompleteOnboardingEvent event,
    Emitter<OnboardingState> emit,
  ) {
    emit(OnboardingCompletedState());
  }
}
