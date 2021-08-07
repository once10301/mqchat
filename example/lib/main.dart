import 'package:flutter/material.dart';
import 'package:mqchat/mqchat.dart';

void main() => runApp(MyApp());

class MyApp extends StatefulWidget {
  @override
  _MyAppState createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  @override
  void initState() {
    super.initState();
    Mqchat.init('a672f6e5d2ad638e3f5f9319ee102de8');
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        appBar: AppBar(
          title: const Text('Plugin example app'),
        ),
        body: Center(
          child: FlatButton(
            child: Text('toChat'),
            onPressed: () => Mqchat.chat({'name': '富坚义博', 'avatar': 'https://s3.cn-north-1.amazonaws.com.cn/pics.meiqia.bucket/1dee88eabfbd7bd4', 'tel': '1300000000'}),
          ),
        ),
      ),
    );
  }
}
