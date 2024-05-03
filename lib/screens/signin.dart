import "package:flutter/material.dart";
import "package:plantarium/widgets/top_img.dart";
import "package:plantarium/controller/auth_controller.dart";

class SignIn extends StatefulWidget {
    @override
    State<SignIn> createState() {
        return SignInState();
    }
}

class SignInState extends State<SignIn>{
    final double FORM_SPACEMENT = 30.0;
    FocusNode _focusNodeEmail = FocusNode();
    FocusNode _focusNodePassword = FocusNode();
    bool showTopImg = true;
    TextEditingController emailTEC = TextEditingController();
    TextEditingController passwordTEC = TextEditingController();

    @override
    Widget build(BuildContext context) {

        _focusNodeEmail.addListener(() {
            setState(() {
                showTopImg = _focusNodeEmail.hasFocus ?  false :  true;
            });
        });

        _focusNodePassword.addListener(() {
            setState(() {
                showTopImg = _focusNodePassword.hasFocus ?  false :  true;
            });
        });

        return Material(
            child: Scaffold(
                    resizeToAvoidBottomInset: true,
                    appBar: AppBar(
                        backgroundColor: Color(0xff115f22),
                        automaticallyImplyLeading: showTopImg ? true : false,
                    ),
                    body: GestureDetector(
                      onTap: () {
                         FocusScope.of(context).requestFocus(new FocusNode());
                      },
                      child: Container(
                        child: Column( 
                            children: [
                                Visibility(
                                    visible: showTopImg,
                                    child: TopImg(Color(0xff0b7522), "images/signInIMG.png"),
                                ),
                                Expanded(
                                    flex: 7,
                                    child: Container(
                                        color: Colors.white,
                                        width: double.infinity,
                                        height: double.infinity,
                                        padding: EdgeInsets.all(50),
                                        child: Column(
                                            mainAxisAlignment: MainAxisAlignment.start,
                                            children: [
                                                Text("Sign in", style: TextStyle(decoration: TextDecoration.none, fontSize: 36, color: Colors.black)),
                                                SizedBox(height: FORM_SPACEMENT),
                                                TextField(
                                                    controller: emailTEC,
                                                    focusNode: _focusNodeEmail,
                                                    keyboardType: TextInputType.emailAddress,
                                                    decoration: InputDecoration(
                                                        labelText: "Email/Phone",
                                                        border: OutlineInputBorder(),
                                                    )
                                                ),
                                                SizedBox(height: FORM_SPACEMENT),
                                                TextField(
                                                    controller: passwordTEC,
                                                    focusNode: _focusNodePassword,
                                                    obscureText: true,
                                                    decoration: InputDecoration(
                                                        labelText: "Password",
                                                        border: OutlineInputBorder(),
                                                    )
                                                ),
                                                SizedBox(height: FORM_SPACEMENT),
                                                SizedBox(
                                                    width: double.infinity,
                                                    height: 50.0,
                                                    child: ElevatedButton(
                                                        style: ElevatedButton.styleFrom(),
                                                        onPressed: () {
                                                            auth(emailTEC.text, passwordTEC.text, this.context);
                                                        },
                                                        child: Text("Sign in", style: TextStyle(fontSize: 28))
                                                    )
                                                ),
                                                SizedBox(height: FORM_SPACEMENT),
                                            ]
                                        )
                                    )
                                )    
                            ]
                        )
                    )
                )
            )
        );
    }
}

