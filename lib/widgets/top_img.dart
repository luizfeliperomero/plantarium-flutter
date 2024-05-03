import "package:flutter/material.dart";

class TopImg extends StatelessWidget {
    final Color backgroundColor;
    final String image;

    TopImg(this.backgroundColor, this.image);

    @override
    Widget build(BuildContext context) {

        return Expanded(
            flex: 3,
            child: Container(
                color: backgroundColor, 
                child: Expanded(
                    flex: 2,
                    child: Align(
                        child: Container(
                            padding: EdgeInsets.all(15),
                            child: Column(
                                children: [
                                   Expanded(
                                   flex: 3,
                                   child: Container(
                                       alignment: Alignment.bottomRight,
                                       child: Image.asset("images/logo.png", height: 60, width: 60)
                                       )
                                   ),
                                   Expanded(
                                       flex: 7,
                                       child: Container(
                                           alignment: Alignment.topCenter,
                                           child: Image.asset(image, height: 400, width: 400)
                                       ),
                                   )
                                ]
                            )
                        )
                    )
                )
            )
        );
    }
}
