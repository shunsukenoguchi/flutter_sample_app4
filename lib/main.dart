import 'package:flutter/material.dart';
import 'package:flutter_sample_app4/main_model.dart';
import 'package:provider/provider.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {

  final String kboyText = 'kboyさんじゃないよ';

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      home: ChangeNotifierProvider<MainModel>(
        create: (_) => MainModel(),
        child: Scaffold(
          appBar: AppBar(
              centerTitle: true,
            title: Text('Flutter App'),
          ),
          body: Consumer<MainModel>(builder: (context, model, child) {
              return Center(
                child: Column(
                  children: <Widget>[
                    Text(
                      model.kboyText,
                      style: TextStyle(
                        fontSize: 30,
                      ),
                    ),
                    RaisedButton(
                      child: Text(
                        'ボタン',
                      ),
                      onPressed: (){
                        model.changeKboyText();
                      },
                    ),
                  ],
                ),
                );
            }
          ),
          ),
        ),
      );
  }
}