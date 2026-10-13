import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart' show GoRouter;

class WelcomeScreen extends StatefulWidget{
  const WelcomeScreen({super.key});

  @override
  State<WelcomeScreen> createState()=> _WelcomeScreenState();
}

class _WelcomeScreenState extends State<WelcomeScreen>{

  @override
  Widget build(BuildContext context){
    return Scaffold(
      backgroundColor: Theme.of(context).colorScheme.onSecondary,
      body: Column(
        children: [
          Expanded(
            child: Container(
              width: double.infinity,
                child: ClipRect(
                    child: Transform.scale(
                        scale: 1.3,
                        child: Transform.translate(
                            offset: Offset(0, -50),
                            child: Image.asset(
                                'assets/images/coffee.png',
                                color: Colors.black54,
                                colorBlendMode: BlendMode.overlay,
                                fit: BoxFit.fitWidth
                            )
                        )
                    )
                )
            )
          ),
          Transform.translate(
            offset: Offset(0, -20),
            child: Container(
                decoration: BoxDecoration(
                    gradient: LinearGradient(
                        begin: Alignment.topCenter,
                        end: Alignment.bottomCenter,
                        colors: [
                          Theme.of(context).colorScheme.onSecondary.withAlpha(0),
                          Theme.of(context).colorScheme.onSecondary
                        ],
                        stops: [0.0, 0.1]
                    )
                ),
                padding: EdgeInsets.symmetric(horizontal: 30),
                child: Column(
                  children: [
                    Container(
                      child: Text(
                          'Fall in Love with\nCoffee in Blissful\nDelight!',
                          textAlign: TextAlign.center,
                          style: Theme.of(context).textTheme.headlineLarge?.copyWith(
                              color: Theme.of(context).colorScheme.onPrimary,
                              fontSize: 40,
                              height: 1.3
                          )
                      ),
                    ),
                    Container(
                      margin: EdgeInsets.only(top: 15, bottom: 20),
                      child: Text(
                          'Welcome to our cozy coffee corner, where every cup is a delight for you',
                          textAlign: TextAlign.center,
                          style: Theme.of(context).textTheme.bodyLarge?.copyWith(
                            color: Theme.of(context).colorScheme.onSurfaceVariant.withAlpha(170),
                          )
                      ),
                    ),
                    SizedBox(
                        width: double.infinity,
                        child: TextButton(
                            onPressed: (){
                              GoRouter.of(context).push('/home');
                            },
                            style: Theme.of(context).textButtonTheme.style?.copyWith(
                              padding: WidgetStateProperty.all(EdgeInsets.symmetric(horizontal: 20, vertical: 20)),
                            ),
                            child: Text(
                                'Get Started'
                            )
                        )
                    )
                  ],
                )
            )
          )
        ],
      )
    );
  }
}