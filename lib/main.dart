import 'package:flutter/material.dart';

import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter_svg/flutter_svg.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        // This is the theme of your application.
        //
        // Try running your application with "flutter run". You'll see the
        // application has a blue toolbar. Then, without quitting the app, try
        // changing the primarySwatch below to Colors.green and then invoke
        // "hot reload" (press "r" in the console where you ran "flutter run",
        // or simply save your changes to "hot reload" in a Flutter IDE).
        // Notice that the counter didn't reset back to zero; the application
        // is not restarted.
        primarySwatch: Colors.blue,
      ),
      home: const MyHomePage(title: 'Flutter Demo Home Page'),
    );
  }
}

class MyHomePage extends StatefulWidget {
  const MyHomePage({Key? key, required this.title}) : super(key: key);

  // This widget is the home page of your application. It is stateful, meaning
  // that it has a State object (defined below) that contains fields that affect
  // how it looks.

  // This class is the configuration for the state. It holds the values (in this
  // case the title) provided by the parent (in this case the App widget) and
  // used by the build method of the State. Fields in a Widget subclass are
  // always marked "final".

  final String title;

  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {

  CarouselController buttonCarouselController = CarouselController();

  @override
  Widget build(BuildContext context) {
    // This method is rerun every time setState is called, for instance as done
    // by the _incrementCounter method above.
    //
    // The Flutter framework has been optimized to make rerunning build methods
    // fast, so that you can just rebuild anything that needs updating rather
    // than having to individually change instances of widgets.

    return Scaffold(
        appBar: AppBar(
          // Here we take the value from the MyHomePage object that was created by
          // the App.build method, and use it to set our appbar title.
          title: Text(widget.title),
        ),
        body: Center(
          // Center is a layout widget. It takes a single child and positions it
          // in the middle of the parent.
          child: Container(child:
            CarouselSlider(
              carouselController: buttonCarouselController,
              items: [1,2].map(
                  (idx){
                    return Builder(
                      builder: (context){
                        final Widget svg = idx==1?SvgPicture.asset('images/horse.svg'):
                        SvgPicture.network('https://s3-us-west-2.amazonaws.com/s.cdpn.io/39255/face.svg');
                        return Container(child: Column(children:[
                          Text("Slide ${idx}"),
                          const SizedBox(height: 10),
                          SizedBox(height: 300,width:300, child:svg),
                          const SizedBox(height: 10),
                          OutlinedButton(onPressed: (){
                            buttonCarouselController.nextPage();
                          }, child: Text('Next '))
                        ]));
                      }
                    );
                  }
              ).toList(), options: CarouselOptions(
              height: 400,
            ),
            )
          ),
        ),
                 // This trailing comma makes auto-formatting nicer for build methods.
    );
  }
}
