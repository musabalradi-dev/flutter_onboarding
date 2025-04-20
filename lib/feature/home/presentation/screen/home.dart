import 'package:flutter/material.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text('Home')),
      body: SizedBox(
        width: double.infinity,
        child: Padding(
          padding: EdgeInsets.all(24.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              // صورة الخلفية مع تأثير Blur
              AnimatedBuilder(
                animation: PageController(),
                builder: (context, child) {
                  return Transform.scale(
                    scale: 1.0,
                    child: Image.asset(
                      'assets/images/welcome.png',
                      fit: BoxFit.cover,
                      width: MediaQuery.of(context).size.width * 0.8,
                      height: MediaQuery.of(context).size.height * 0.4,
                      filterQuality: FilterQuality.high,
                    ),
                  );
                },
              ),
              SizedBox(height: 20),
              Text(
                'Welcome to the working clinic application. How can we serve you?',
                style: Theme.of(context).textTheme.bodyMedium,
                textAlign: TextAlign.center,
                maxLines: 3,
              ),
              SizedBox(height: 20),
              ElevatedButton(
                onPressed: () {
                  // Show a dialog or navigate to the details screen
                  showDialog(
                    context: context,
                    builder: (context) {
                      return AlertDialog(
                        title: Text(
                          'Congratulations',
                          textAlign: TextAlign.center,
                        ),
                        content: Text(
                          'You have successfully completed the onboarding process.',
                          textAlign: TextAlign.center,
                        ),
                        titlePadding: EdgeInsets.all(20),
                        contentTextStyle: TextStyle(
                          fontSize: 16,
                          color: Colors.black,
                        ),
                        titleTextStyle: TextStyle(
                          fontSize: 20,
                          fontWeight: FontWeight.bold,
                          color: Theme.of(context).colorScheme.primary,
                        ),
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(20),
                        ),
                        backgroundColor: Colors.white,
                        contentPadding: EdgeInsets.all(20),
                        actionsPadding: EdgeInsets.all(10),
                        actionsAlignment: MainAxisAlignment.center,
                        actionsOverflowButtonSpacing: 10,
                        actions: [
                          TextButton(
                            onPressed: () {
                              Navigator.of(context).pop();
                            },
                            child: Text('Close', textAlign: TextAlign.center),
                          ),
                        ],
                      );
                    },
                  );
                },
                child: Text('Go to Details'),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
