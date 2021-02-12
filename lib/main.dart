import 'package:flutter/material.dart';

void main(){
  runApp(
    MaterialApp(
      home: Home(),
      debugShowCheckedModeBanner: false,
    )
  );
}

class Home extends StatefulWidget {
  @override
  _HomeState createState() => _HomeState();
}

class _HomeState extends State<Home> {

  static final colorTween = ColorTween(begin: Colors.white, end: Colors.orange);
  double _valorAdp = 0;
  Color _novaCor = Colors.red;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Padding(
        padding: const EdgeInsets.only(top: 25.0),
        child: Column(
          children: [
            Center(
              child: TweenAnimationBuilder(
                  child: Image.asset('imagens/sun.png'),
                  tween: ColorTween(begin: Colors.white, end: _novaCor),
                  duration: Duration(seconds: 3),
                  onEnd: (){
                    setState(() {
                      _novaCor = _novaCor == Colors.red ? Colors.white : Colors.red;
                    });
                  },
                  builder: (_,Color color, Widget meuchild){
                    return ColorFiltered(
                        child: meuchild,
                        colorFilter: ColorFilter.mode(color, BlendMode.modulate)
                    );
                  }
              ),
            ),
          ],
        ),
      ),
    );
  }
}
