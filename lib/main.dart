import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'constant.dart';

void main() {
  runApp(SliderTime());
}

class SliderTime extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      theme: ThemeData.dark().copyWith(
        scaffoldBackgroundColor: Color(0XFF0A0D22),
      ),
      home: SafeArea(
        child: Scaffold(
          body: InputPage(),
        ),
      ),
    );
  }
}

class InputPage extends StatefulWidget {
  @override
  _InputPageState createState() => _InputPageState();
}

class _InputPageState extends State<InputPage> {
  int timeValue = 6;
  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.stretch,
      children: <Widget>[
        Expanded(
          flex: 2,
          child: Container(
            margin: EdgeInsets.all(10),
            color: Color(0xFF0A0D22),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: <Widget>[
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  crossAxisAlignment: CrossAxisAlignment.baseline,
                  children: <Widget>[
                    Text(
                      'Num :',
                      style: kNormalTextStyle,
                    ),
                    Text(
                      timeValue.toString(),
                      style: kLargeTextStyle,
                    ),
                  ],
                ),
                SliderTheme(
                  data: SliderTheme.of(context).copyWith(
                      thumbColor: Color(0xFFEB1555),
                      overlayColor: Color(0x29EB1555),
                      activeTrackColor: Color(0xFFFFFFFF),
                      inactiveTrackColor: Color(0xFF7C7D88),
                      thumbShape: RoundSliderThumbShape(enabledThumbRadius: 15),
                      overlayShape: RoundSliderOverlayShape(overlayRadius: 30)),
                  child: Slider(
                    value: timeValue.toDouble(),
                    min: 6,
                    max: 18,
                    divisions: 12,
                    onChanged: (double newValue) {
                      setState(() {
                        timeValue = newValue.round();
                      });
                    },
                  ),
                )
              ],
            ),
          ),
        ),
      ],
    );
  }
}
