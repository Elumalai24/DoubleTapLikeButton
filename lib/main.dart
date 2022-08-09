import 'dart:async';

import 'package:flutter/material.dart';

void main(){
  runApp(MaterialApp(home: Like_Button()));
}
class Like_Button extends StatefulWidget {
  const Like_Button({Key? key}) : super(key: key);

  @override
  State<Like_Button> createState() => _Like_ButtonState();
}

class _Like_ButtonState extends State<Like_Button> {
  bool liked=false;
  bool showHeart=false;
  _onpressed(){
    setState((){
      liked=!liked;
    });
  }
  _ondoubleTap(){
    setState((){
      showHeart=true;
      liked=true;
      if(showHeart){
        // showHeart=false;
        Timer(const Duration(milliseconds: 400),() {
          setState((){
            showHeart=false;
          });

        });
      }
    });
  }
  @override
  Widget build(BuildContext context) {
    return Scaffold(

        appBar: AppBar(title: Text('Like Button'),),
        body: Column(
          mainAxisAlignment:MainAxisAlignment.center,children: [
          Container(child: Stack(

              alignment:Alignment.center,children: [GestureDetector(

              onDoubleTap: (){
                _ondoubleTap();
              },child: Image.network('https://c4.wallpaperflare.com/wallpaper/611/838/413/spiderman-hd-4k-superheroes-wallpaper-preview.jpg')),
            showHeart? Icon(Icons.favorite,color: Colors.white,
              size: 80,

            ):Container()

          ]),),
          Row(
            children: [
              IconButton(onPressed: (){
                _onpressed();

              },  icon:Icon(liked?Icons.favorite:Icons.favorite_border,color: liked?Colors.red:Colors.grey), )
            ],
          )
        ],)
    );
  }
}
