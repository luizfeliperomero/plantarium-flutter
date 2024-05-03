import 'package:flutter/material.dart';

class BackgroundImage extends StatelessWidget{
    final String imageURL;

    BackgroundImage(this.imageURL);

    @override
    Widget build(BuildContext context) {
        return Container(
            width: double.infinity,
            decoration: BoxDecoration(
                image: DecorationImage(
                    image: AssetImage(this.imageURL),
                    fit: BoxFit.cover
                ),
            ),
        );
    }
}
