import 'package:flutter/material.dart';

class BasicDemo extends StatelessWidget {
  final Widget child;

  BasicDemo({Key key, this.child}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    //下划线开始得变量表示类里私有得
    return Container(
      // color: Colors.grey[100],
      decoration: BoxDecoration(
          image: DecorationImage(
            image: NetworkImage('https://resources.ninghao.org/images/say-hello-to-barry.jpg'),
            alignment: Alignment.topCenter,
            fit: BoxFit.cover,
            // colorFilter: ColorFilter.mode(Colors.indigoAccent[40], BlendMode.hardLight)
      )),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.center,
        children: <Widget>[
          Container(
            child: Icon(
              Icons.poll,
              size: 32.0,
              color: Colors.white,
            ),
            padding: EdgeInsets.all(10.0),
            margin: EdgeInsets.all(10.0),
            width: 90.0,
            height: 90.0,
            decoration: BoxDecoration(
                color: Colors.indigo,
                border: Border.all(
                  color: Colors.indigoAccent[100],
                  width: 3.0,
                  style: BorderStyle.solid,
                ),
                borderRadius: BorderRadius.circular(16.0),
                boxShadow: [
                  BoxShadow(
                      offset: Offset(6.0, 7.0),
                      color: Color.fromRGBO(16, 20, 188, 1.0),
                      blurRadius: 10, //blurRadius 模糊程度
                      spreadRadius: 1.0 //spreadRadius 阴影扩散成都
                      ) //BoxShadow 阴影
                ],
                shape: BoxShape.rectangle, //shape 形状
                gradient: LinearGradient(
                  colors: [
                    Color.fromRGBO(7, 102, 255, 1.0),
                    Color.fromRGBO(3, 28, 128, 1.0)
                  ],
                  begin: Alignment.topCenter,
                  end: Alignment.bottomCenter,
                )),
          )
        ],
      ),
    );
  }
}

//富文本
class RichTextDemo extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return RichText(
      text: TextSpan(
          text: 'flutter',
          style: TextStyle(
              color: Colors.deepPurpleAccent,
              fontSize: 24.0,
              fontStyle: FontStyle.italic,
              fontWeight: FontWeight.w100),
          children: [
            TextSpan(
                text: 'google',
                style: TextStyle(color: Colors.grey, fontSize: 15.0))
          ]),
    );
  }
}

//普通文本
class TextDemo extends StatelessWidget {
  final TextStyle _textStyle = TextStyle(fontSize: 16.0);
  final String _author = '李白';
  final String _title = "将进酒";
  @override
  Widget build(BuildContext context) {
    return Text(
      '《$_title》--$_author 。君不见，黄河之水天上来，奔流到海不复回。君不见，高堂明镜悲白发，朝如青丝暮成雪。人生得意须尽欢，莫使金樽空对月。天生我材必有用，千金散尽还复来。烹羊宰牛且为乐，会须一饮三百杯。岑夫子，丹丘生，将进酒，杯莫停。与君歌一曲，请君为我倾耳听。钟鼓馔玉不足贵，但愿长醉不复醒。古来圣贤皆寂寞，惟有饮者留其名。陈王昔时宴平乐，斗酒十千恣欢谑。主人何为言少钱，径须沽取对君酌。五花马，千金裘，呼儿将出换美酒，与尔同销万古愁。',
      textAlign: TextAlign.left,
      style: _textStyle,
      maxLines: 4,
      overflow: TextOverflow.ellipsis,
    );
  }
}
