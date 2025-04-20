part of 'onboarding_bloc.dart';

abstract class OnboardingEvent extends Equatable {
  const OnboardingEvent();

  @override
  List<Object> get props => [];
}

class LoadOnboardingEvent extends OnboardingEvent {}

class UpdatePageIndexEvent extends OnboardingEvent {
  final int newIndex;

  const UpdatePageIndexEvent(this.newIndex);

  @override
  List<Object> get props => [newIndex];
}

class CompleteOnboardingEvent extends OnboardingEvent {}
