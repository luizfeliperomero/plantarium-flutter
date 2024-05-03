import "package:flutter/material.dart";
import "package:plantarium/widgets/top_img.dart";
import "package:plantarium/widgets/signup_form.dart";
import "package:plantarium/controller/signup_controller.dart";

class SignUp extends StatefulWidget {
    @override
    State<SignUp> createState() {
        return SignUpState();
    }
}

class SignUpState extends State<SignUp> {

    @override
    Widget build(BuildContext context) {
        return AnimatedBuilder(
            animation: SignUpController.instance,
            builder: (context, child) {
            return Scaffold(
            resizeToAvoidBottomInset: true,
            appBar: AppBar(
                backgroundColor: Color(0xff1b4a3c),
                automaticallyImplyLeading: SignUpController.instance.showTopImg ? true : false,
             ),
            body: GestureDetector(
                      onTap: () {
                         FocusScope.of(context).requestFocus(new FocusNode());
                      },
                child: Container(
                child: Column(
                    children: [
                        Visibility(
                            visible: SignUpController.instance.showTopImg,
                            child: TopImg(Color(0xff1b4a3c), "images/signUpTopImg.png"),
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
                                                Text("Create Account", style: TextStyle(decoration: TextDecoration.none, fontSize: 36, color: Colors.black)),
                                                Expanded(
                                                    child: SignUpForm(),
                                                )
                                    ]
                                )
                            )
                        )
                    ]
                )
            )
          )
          );
      });
    }
}

