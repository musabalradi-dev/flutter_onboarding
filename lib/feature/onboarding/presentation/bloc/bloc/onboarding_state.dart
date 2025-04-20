part of 'onboarding_bloc.dart';

abstract class OnboardingState extends Equatable {
  const OnboardingState();

  @override
  List<Object> get props => [];
}

class OnboardingInitialState extends OnboardingState {}

class OnBoardingLoadedState extends OnboardingState {
  final List<OnboardingContent> contents;
  final int currentPage;

  const OnBoardingLoadedState({required this.contents, this.currentPage = 0});

  OnBoardingLoadedState copyWith({
    List<OnboardingContent>? contents,
    int? currentPage,
  }) {
    return OnBoardingLoadedState(
      contents: contents ?? this.contents,
      currentPage: currentPage ?? this.currentPage,
    );
  }

  @override
  List<Object> get props => [contents, currentPage];
}

class OnboardingCompletedState extends OnboardingState {}
