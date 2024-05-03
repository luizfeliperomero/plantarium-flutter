import 'package:flutter/material.dart';
import 'package:plantarium/widgets/background_img.dart';
import 'package:plantarium/screens/signin.dart';
import 'package:flutter_signin_button/flutter_signin_button.dart';
import 'package:google_sign_in/google_sign_in.dart';
import 'dart:developer';

class Welcome extends StatelessWidget {
    final GoogleSignIn _googleSignIn = GoogleSignIn();

    @override
    Widget build(BuildContext context) {
        return Scaffold(
            body: Stack(
                children: <Widget> [ 
                    BackgroundImage("images/welcome.png"),
                    Center(
                        child: Container(
                            width: double.infinity,
                            height: double.infinity,
                            child: Column(
                                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                children: [
                                    Expanded(
                                        flex: 6,
                                        child: Container(
                                            width: double.infinity,
                                            child: Column(
                                                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                                                children: [
                                                    Image.asset("images/logo.png", height: 200, width: 200),
                                                    Text("Keeping your garden alive!", style: TextStyle(color: Colors.white, fontSize: 28))
                                                ],
                                            ),
                                        )
                                    ),
                                    Expanded(
                                        flex: 4,
                                        child: Container(
                                            width: double.infinity,
                                            padding: EdgeInsets.all(20),
                                            child: Column(
                                                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                                                children: [
                                                    SizedBox(
                                                        width: double.infinity,
                                                        child: EnterButton("Sign In", Colors.white ,Color(0xff115f22), "/signin"),
                                                    ),
                                                    SizedBox(
                                                        width: double.infinity,
                                                        child: EnterButton("Sign Up", Colors.white ,Color(0xff1B4A3C), "/signup"),
                                                    ),
                                                    SizedBox(
                                                        width: double.infinity,
                                                        child: SignInButton(
                                                            Buttons.Google,
                                                            onPressed: () {
                                                                _googleSignIn.signIn().then((result){
                                                                  if(result != null) {
                                                                      result.authentication.then((googleKey){
                                                                          var token = googleKey.idToken;
                                                                          if(token != null) {
                                                                              log(token);
                                                                              print(token);
                                                                          } 
                                                                  }).catchError((err){
                                                                    print('inner error');
                                                                  });
                                                              }}).catchError((err){
                                                                  print('error occured');
                                                              });
                                                            }
                                                        )
                                                    ),
                                                ],
                                            )
                                        )
                                    )
                                ]
                            )
                        )
                    )
                ],
            )
        );
    }
}

class EnterButton extends StatelessWidget {
    final String text;
    final Color textColor;
    final Color backgroundColor;
    final String route;

    EnterButton(this.text, this.textColor, this.backgroundColor, this.route);

    @override
    Widget build(BuildContext context) {
        return ElevatedButton(
            style: ElevatedButton.styleFrom(
                padding: EdgeInsets.all(10)
            ),
            onPressed: () { 
                Navigator.of(context).pushNamed(route);
            },
            child: Text(this.text, style: TextStyle(fontSize: 28))
        );
    }

}

