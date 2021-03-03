import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:supervisionconsole/login.dart';
import 'package:supervisionconsole/login_option.dart';
import 'package:supervisionconsole/signup.dart';
import 'package:supervisionconsole/signup_option.dart';


void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        primarySwatch: Colors.blue,
        visualDensity: VisualDensity.adaptivePlatformDensity,
        textTheme: GoogleFonts.muktaVaaniTextTheme(),
      ),
      debugShowCheckedModeBanner: false,
      home: HomePage(),
    );
  }
}

class HomePage extends StatefulWidget{
  @override
  _HomePageState createState() => _HomePageState();
}
class _HomePageState extends State<HomePage>{

  bool login = true;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Color(0xFF1C1C1C),
      body: SingleChildScrollView(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            GestureDetector(
              onTap: (){
                setState(() {
                  login = true;
                });
              },
              child: AnimatedContainer(
                duration: Duration(milliseconds: 800),
                curve: Curves.ease,
                height: login ? MediaQuery.of(context).size.height * 0.6 : MediaQuery.of(context).size.height * 0.4,
                decoration: BoxDecoration(
                  color: Colors.yellow[700],
                  borderRadius: BorderRadius.only(bottomRight: Radius.circular(130), bottomLeft: Radius.circular(130)),
                ),
                child: Container(
                  padding: EdgeInsets.only(bottom: login ? 0 : 55),
                  child: Center(
                    child: SingleChildScrollView(
                      child: Padding(
                        padding: EdgeInsets.symmetric(vertical: 16, horizontal: 32),
                        child: login
                          ? LoginPage()
                            : LoginOption(),
                      ),
                    ),
                  ),
                ),
              ),
            ),
            GestureDetector(
              onTap: (){
                setState(() {
                  login = false;
                });
              },
              child: AnimatedContainer(
                duration: Duration(milliseconds: 800),
                curve: Curves.ease,
                height: login ? MediaQuery.of(context).size.height * 0.4 : MediaQuery.of(context).size.height * 0.6,
                child: Container(
                  color: Colors.transparent,
                  child: Center(
                    child: SingleChildScrollView(
                      child: Padding(
                          padding: EdgeInsets.symmetric(horizontal: 32, vertical: 16),
                        child: !login
                          ? SignUp()
                            : SignUpOption(),
                      ),
                    ),
                  )
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }

}


