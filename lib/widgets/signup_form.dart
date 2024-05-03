import "package:flutter/material.dart";
import "package:plantarium/controller/signup_controller.dart";
import "package:plantarium/model/user.dart";
import "package:plantarium/sql_helper.dart";
import "package:http/http.dart" as http;
import "dart:convert";

class SignUpForm extends StatefulWidget {
    @override
    State<SignUpForm> createState() => SignUpFormStep(); 
}

class SignUpFormStep extends State<SignUpForm> {
    TextEditingController emailTEC = TextEditingController();
    TextEditingController passwordTEC = TextEditingController();
    TextEditingController confirmPasswordTEC = TextEditingController();
    TextEditingController firstNameTEC = TextEditingController();
    TextEditingController lastNameTEC = TextEditingController();
    TextEditingController phoneNumberTEC = TextEditingController();
    int _index = 0;
    final double FORM_SPACEMENT = 30.0;
    FocusNode _focusNodeEmail = FocusNode();
    FocusNode _focusNodePhone= FocusNode();
    FocusNode _focusNodePassword = FocusNode();
    FocusNode _focusNodeConfirmPassword = FocusNode();
    FocusNode _focusNodeFirstName = FocusNode();
    FocusNode _focusNodeLastName= FocusNode();
    bool showTopImg = true;

    @override
    Widget build(BuildContext context) {

        _focusNodeEmail.addListener(() {
            setState(() {
                showTopImg = _focusNodeEmail.hasFocus ?  false :  true;
                SignUpController.instance.setShowTopImg(showTopImg);
            });
        });

        _focusNodePassword.addListener(() {
            setState(() {
                showTopImg = _focusNodePassword.hasFocus ?  false :  true;
                SignUpController.instance.setShowTopImg(showTopImg);
            });
        });

        _focusNodeFirstName.addListener(() {
            setState(() {
                showTopImg = _focusNodeFirstName.hasFocus ?  false :  true;
                SignUpController.instance.setShowTopImg(showTopImg);
            });
        });
        _focusNodeLastName.addListener(() {
            setState(() {
                showTopImg = _focusNodeLastName.hasFocus ?  false :  true;
                SignUpController.instance.setShowTopImg(showTopImg);
            });
        });
        _focusNodePhone.addListener(() {
            setState(() {
                showTopImg = _focusNodePhone.hasFocus ?  false :  true;
                SignUpController.instance.setShowTopImg(showTopImg);
            });
        });
        _focusNodeConfirmPassword.addListener(() {
            setState(() {
                showTopImg = _focusNodeConfirmPassword.hasFocus ?  false :  true;
                SignUpController.instance.setShowTopImg(showTopImg);
            });
        });

        return Theme (
        data: ThemeData(
            colorScheme: ColorScheme.light(primary: Color(0xff1b4a3c))
        ),
        child: Stepper(
           type: StepperType.horizontal,
           currentStep: _index,
           onStepCancel: () {onStepCancel();},
           onStepContinue: () {onStepContinue();},
           onStepTapped: (int index) {onStepTapped(index);},
           steps: [
            Step(
              isActive: _index >= 0,
              title: Text(""),
              content: Column(
                  mainAxisAlignment: MainAxisAlignment.start,
                  children: [
                    TextField(
                        controller: firstNameTEC,
                        focusNode: _focusNodeFirstName,
                        decoration: InputDecoration(
                            labelText: "First Name",
                            border: OutlineInputBorder(),
                        )
                    ),
                    SizedBox(height: FORM_SPACEMENT),
                    TextField(
                        controller: lastNameTEC,
                        focusNode: _focusNodeLastName,
                        decoration: InputDecoration(
                            labelText: "Last Name",
                            border: OutlineInputBorder(),
                        )
                    ),
                  ]
               ) 
            ),
            Step(
              isActive: _index >= 1,
              title: Text(""),
              content: Column(
                  mainAxisAlignment: MainAxisAlignment.start,
                  children: [
                    TextField(
                        controller: emailTEC,
                        focusNode: _focusNodeEmail,
                        keyboardType: TextInputType.emailAddress,
                        decoration: InputDecoration(
                            labelText: "Email",
                            border: OutlineInputBorder(),
                        )
                    ),
                    SizedBox(height: FORM_SPACEMENT),
                    TextField(
                        controller: phoneNumberTEC,
                        focusNode: _focusNodePhone,
                        decoration: InputDecoration(
                            labelText: "Phone Number",
                            border: OutlineInputBorder(),
                        )
                    ),
                  ]
               ) 
            ),
            Step(
              isActive: _index >= 2,
              title: Text(""),
              content: Column(
                  mainAxisAlignment: MainAxisAlignment.start,
                  children: [
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
                    TextField(
                        controller: confirmPasswordTEC,
                        focusNode: _focusNodeConfirmPassword,
                        obscureText: true,
                        decoration: InputDecoration(
                            labelText: "Confirm Password",
                            border: OutlineInputBorder(),
                        )
                    ),
                  ]
               ) 

            ),
           ] ,
           controlsBuilder: (BuildContext context, ControlsDetails details) {
                final isLastStep = _index == 2;
                final isFirstStep = _index == 0;
                return Container(
                    margin: EdgeInsets.only(top: 20),
                    child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                           Visibility(
                               visible: !isFirstStep,
                               child: ElevatedButton(
                                    style: ElevatedButton.styleFrom(backgroundColor: Color(0xff4e4e4e)),
                                    onPressed: () {onStepCancel();},
                                    child: Text("Back")
                                )
                           ),
                            ElevatedButton(
                                onPressed: () {isLastStep ? createUser() : onStepContinue();},
                                child: Text(isLastStep ? "Submit" : "Next")
                            ),
                        ]
                    )
                );
           }
           )
        );
    }

    Future createUser() async {
        User user = User(firstNameTEC.text, lastNameTEC.text, emailTEC.text, false, phoneNumberTEC.text, passwordTEC.text);
        //SQLHelper.createUser(user);
        SignUpController.instance.signUp(user);
        //Navigator.of(context).pushNamed("/signin");
    }

    void onStepContinue() {
        setState(() {
            if(_index < 2) {
            _index++;
            }
        });
    }

    void onStepCancel() {
        setState(() {
            if(_index > 0) {
            _index--;
            }
        });
    }

    void onStepTapped(int index) {
        setState(() {
            _index = index;
        });
    }
} 



