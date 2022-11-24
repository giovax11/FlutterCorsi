import 'package:flutter/material.dart';

class DescrptionPlace extends StatelessWidget{
  String nameplace;
      DescrptionPlace(this.nameplace);

  @override
  Widget build(BuildContext context) {
    final star=Container(
      margin:const EdgeInsets.only(
        top:323.0,
        right:3.0
      ),
      child: const Icon(
        Icons.star,
        color: Colors.yellow
      ),
    );
    final title_stars=Row(
      children: [
        Container(
          margin:const EdgeInsets.only(
            top: 320.0,
            left: 20.0,
            right: 20.0
          ),
          child:Text(nameplace,
          style:TextStyle(
            fontSize: 30.0,
            fontWeight:FontWeight.w300
          ),
             textAlign:TextAlign.left,
          ),
        ),
Row(
  children: [
    star,
    star,
    star
  ],
)
      ],
    );
    return title_stars;
  }

}