import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:wordpress_app/blocs/config_bloc.dart';
import 'package:wordpress_app/blocs/user_bloc.dart';
import 'package:wordpress_app/pages/home.dart';
import 'package:wordpress_app/pages/welcome.dart';
import 'package:wordpress_app/utils/next_screen.dart';
import 'package:wordpress_app/widgets/loading_indicator_widget.dart';
import '../config/config.dart';
import 'no_internet.dart';

class SplashPage extends StatefulWidget {
  const SplashPage({super.key});

  @override
  State<SplashPage> createState() => _SplashPageState();
}

class _SplashPageState extends State<SplashPage> {
  Future _afterSplash() async {
    final UserBloc ub = context.read<UserBloc>();
    final configs = context
        .read<ConfigBloc>()
        .configs!;
    Future.delayed(const Duration(milliseconds: 0)).then((value) {
      if (ub.isSignedIn == true || ub.guestUser == true ||
          !configs.welcomeScreenEnabled) {
        _gotoHomePage();
      } else {
        _gotoWelcomePage();
      }
    });
  }

  void _gotoHomePage() {
    nextScreenReplaceAnimation(context, const HomePage());
  }

  void _gotoWelcomePage() {
    nextScreenReplaceAnimation(context, const WelcomePage());
  }

  @override
  void initState() {
    Future.microtask(() =>
        context.read<ConfigBloc>().getConfigsData().then((bool hasData) {
          if (hasData) {
            _afterSplash();
          } else {
            debugPrint('No configs data found');
            nextScreenReplaceAnimation(context, const NoInternet());
          }
        }));
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return  Scaffold(
      bottomNavigationBar: SafeArea(child: LoadingIndicatorWidget()),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Image(
              height: 120,
              width: 120,
              image: AssetImage(Config.splash),
              fit: BoxFit.contain,
            ),

            SizedBox(height: 90), // Add some space between the text and image
            Image(
              height: 80,
              width: 80,
              image: AssetImage(Config.dev),
              // Add your image path here
              fit: BoxFit.contain,
            ),
            SizedBox(height: 10), // Add some space between the text and image
            Text(
              'পরিকল্পনা ও বাস্তবায়ন', // Add your text here
              style: TextStyle(
                fontSize: 18,
                fontWeight: FontWeight.bold,
              ),
            ),
            SizedBox(height: 5),
            Container(
              width: 200, // Set the width of the divider
              child: Divider(
                color: Colors.blue, // Change the color of the divider
                thickness: 2, // Change the thickness of the divider
              ),
            ),

            SizedBox(height: 5), // Add some space between the text and image
            Text(
              'মো ইমতিয়াজুল ইসলাম', // Add your text here
              style: TextStyle(
                fontSize: 18,
                fontWeight: FontWeight.bold,
              ),
            ),



          ],
        ),
      ),
    );
  }
}
