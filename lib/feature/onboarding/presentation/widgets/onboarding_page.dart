import 'package:flutter/material.dart';
import 'package:flutter_onboarding/feature/onboarding/data/models/onboarding_model.dart';

class OnboardingPage extends StatelessWidget {
  const OnboardingPage({super.key, required this.content});

  final OnboardingContent content;

  @override

  Widget build(BuildContext context) {
        final theme = Theme.of(context);
    final size = MediaQuery.of(context).size;
    return Container(
      decoration: BoxDecoration(
        gradient: LinearGradient(
          begin: Alignment.topCenter,
          end: Alignment.bottomCenter,
          colors: [
            theme.colorScheme.primaryContainer.withValues(alpha: 0.05),
            theme.colorScheme.surface,
          ],
        ),
      ),
      child: SafeArea(
        child: Padding(
          padding: const EdgeInsets.all(10.0),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              // صورة الخلفية مع تأثير Blur
              AnimatedBuilder(
                animation: PageController(),
                builder: (context, child) {
                  return Transform.scale(
                    scale: 1.0,
                    child: Image.asset(
                      content.image,
                      fit: BoxFit.cover,
                      width: size.width * 0.8,
                      height: size.height * 0.4,
                      filterQuality: FilterQuality.high,
                    ),
                  );
                },  
              ), 
              SizedBox(height: 20),
                 // محتوى النص مع تأثيرات حركية
                  AnimatedSwitcher(
                    duration: const Duration(milliseconds: 500),
                    transitionBuilder: (child, animation) {
                      return SlideTransition(
                        position: Tween<Offset>(
                          begin: const Offset(0, 0.2),
                          end: Offset.zero,
                        ).animate(animation),
                        child: FadeTransition(
                          opacity: animation,
                          child: child,
                        ),
                      );
                    },
                    child: Column(
                      key: ValueKey(content.title),
                      children: [
                        // العنوان مع تأثير Typography
                        Text(
                          content.title,
                          style: theme.textTheme.headlineMedium?.copyWith(
                            fontWeight: FontWeight.w800,
                            color: theme.colorScheme.primary,
                            height: 1.3,
                            letterSpacing: 0.5,
                          ),
                          textAlign: TextAlign.center,
                          maxLines: 2,
                          overflow: TextOverflow.ellipsis,
                        ),
          
                        const SizedBox(height: 24),
          
                        // الوصف مع تحسينات للقراءة
                        Padding(
                          padding: const EdgeInsets.symmetric(horizontal: 16.0),
                          child: Text(
                            content.description,
                            style: theme.textTheme.bodyLarge?.copyWith(
                              color: theme.colorScheme.onSurface.withValues(alpha: 0.8),
                              height: 1.6,
                              letterSpacing: 0.2,
                            ),
                            textAlign: TextAlign.center,
                          ),
                        ),
                      ],
                    ),
                  ),
            ],
          ),
        ),
      ),
    );
  }
}
