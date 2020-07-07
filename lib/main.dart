import 'package:extended_image/extended_image.dart';
import 'package:flutter/material.dart';
import 'package:testextended/register_input_item.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
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
        // This makes the visual density adapt to the platform that you run
        // the app on. For desktop platforms, the controls will be smaller and
        // closer together (more dense) than on mobile platforms.
        visualDensity: VisualDensity.adaptivePlatformDensity,
      ),
      home: MyHomePage(title: 'Flutter Demo Home Page'),
    );
  }
}

class MyHomePage extends StatefulWidget {
  MyHomePage({Key key, this.title}) : super(key: key);

  // This widget is the home page of your application. It is stateful, meaning
  // that it has a State object (defined below) that contains fields that affect
  // how it looks.

  // This class is the configuration for the state. It holds the values (in this
  // case the title) provided by the parent (in this case the App widget) and
  // used by the build method of the State. Fields in a Widget subclass are
  // always marked "final".

  final String title;

  @override
  _MyHomePageState createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(widget.title),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            RegisterInputItem(
//                          focusNode: provider.capthaFocus,
              tip: '请输入图形验证码',
              onChange: onChangeImageCode,
              right: buildCaptureCode(),
            ),
          ],
        ),
      ),
    );
  }
  void onChangeImageCode(String value) {
  }

  String captureCodeNo = DateTime.now().millisecondsSinceEpoch.toString();
  String get getCaptureCodeUrl {
    return 'https://m.kdax.io/exchangeApi/captchar/code?randomKey=$captureCodeNo';
  }


  Widget buildCaptureCode() {
    return Padding(
      padding: EdgeInsets.only(left: getDp(17)),
      child: StatefulBuilder(
        builder:
            (BuildContext context, void Function(void Function()) setState) {
          return GestureDetector(
            onTap: (){

            },
            child: Image(
              image: ExtendedNetworkImageProvider(getCaptureCodeUrl),
              width: getDp(106),
              height: getDp(42),
              gaplessPlayback: true,
              fit: BoxFit.fill,
            ),
          );
        },
      ),
    );
  }
}
