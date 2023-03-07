import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'home_page.dart';
import 'login_page.dart';

class WelcomePage extends StatelessWidget {
  const WelcomePage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        padding: const EdgeInsets.all(10),
        color: Colors.red,
        child: Column(
          children: [
            const Spacer(),
            Center(child: Image.asset('assets/logo.png')),
            const Spacer(),
            Container(
              height: 50,
              width: double.infinity,
              child: TextButton(
                onPressed: () {
                  getapi(context: context);
                  /*Navigator.of(context)
                      .pushReplacementNamed(LoginPage.routeName);*/
                },
                style:ButtonStyle(
                  backgroundColor: MaterialStateProperty.all<Color>(Colors.white),
                  shape: MaterialStateProperty.all<RoundedRectangleBorder>(
                    RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(10),),
                  ),
                ),
                child: const Text('Get Started',
                  style: TextStyle(
                      fontSize: 17,
                      fontWeight: FontWeight.w500,
                      color: Colors.red),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }

  getapi({required BuildContext context}) async {
    final sharedPreferences = await SharedPreferences.getInstance();

    final apitoken = sharedPreferences.getString('token');
    if (apitoken == null || apitoken.isEmpty) {
      Navigator.push(context, MaterialPageRoute(
        builder: (context) {
          return LoginPage(uvalue: 'admin_user', pvalue: '123admin789',);
        },
      ));
    } else {
      Navigator.push(context, MaterialPageRoute(
        builder: (context) {
          return HomePage();
        },
      ));
    }
  }
}