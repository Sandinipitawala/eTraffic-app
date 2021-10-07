import 'package:etraffic/homepage.dart';
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';


class FeedBackPage extends StatefulWidget {
  @override
  _FeedBackPageState createState() => _FeedBackPageState();
}

class _FeedBackPageState extends State<FeedBackPage> {
  var myFeedbackText = "COULD BE BETTER";
  var sliderValue = 0.0;
  IconData myFeedback = FontAwesomeIcons.sadTear;
  Color myFeedbackColor = Colors.red;

  @override
  Widget build(BuildContext context) {
    return SafeArea(
        child: Scaffold(
          appBar: AppBar(
          title: Text('User Feedback'),
          centerTitle: true,
          foregroundColor: Colors.white,
          backwardsCompatibility: false,
      ),
        body: Stack(
          children: <Widget>[
            new Container(
              constraints: BoxConstraints.expand(),
                decoration: BoxDecoration(
                    image: DecorationImage(
                        image: AssetImage("images/background.png"),
                        fit: BoxFit.cover)),   
          ),    
        SingleChildScrollView(
        child: Column(
          children: <Widget>[
            Container(child:Padding(
              padding: const EdgeInsets.all(16.0),
              child: Container(child: Text("On a scale of 1 to 10, how happy are you at work?",
                style: TextStyle(color: Colors.black, fontSize: 22.0,fontWeight:FontWeight.bold),)),
            ),),
            Container(
              child: Align(
                child: Material(
                  color: Colors.white,
                  elevation: 14.0,
                  borderRadius: BorderRadius.circular(24.0),
                  shadowColor: Color(0x802196F3),
                  child: Container(
                      width: 350.0,
                      height: 400.0,
                      child: Column(children: <Widget>[
                        Padding(
                          padding: const EdgeInsets.all(8.0),
                          child: Container(child: Text(myFeedbackText,
                            style: TextStyle(color: Colors.black, fontSize: 22.0),)),
                        ),
                        Padding(
                          padding: const EdgeInsets.all(8.0),
                          child: Container(child: Icon(
                            myFeedback, color: myFeedbackColor, size: 100.0,)),
                        ),
                        Padding(
                          padding: const EdgeInsets.all(8.0),
                          child: Container(child: Slider(
                            min: 0.0,
                            max: 10.0,
                            divisions: 5,
                            value: sliderValue,
                            activeColor: Color(0xffe05f2c),
                            inactiveColor: Colors.blueGrey,
                            onChanged: (newValue) {
                              setState(() {
                                sliderValue = newValue;
                                if (sliderValue >= 0.0 && sliderValue <= 2.0) {
                                  myFeedback = FontAwesomeIcons.sadTear;
                                  myFeedbackColor = Colors.red;
                                  myFeedbackText = "COULD BE BETTER";
                                }
                                if (sliderValue >= 2.1 && sliderValue <= 4.0) {
                                  myFeedback = FontAwesomeIcons.frown;
                                  myFeedbackColor = Colors.yellow;
                                  myFeedbackText = "BELOW AVERAGE";
                                }
                                if (sliderValue >= 4.1 && sliderValue <= 6.0) {
                                  myFeedback = FontAwesomeIcons.meh;
                                  myFeedbackColor = Colors.amber;
                                  myFeedbackText = "NORMAL";
                                }
                                if (sliderValue >= 6.1 && sliderValue <= 8.0) {
                                  myFeedback = FontAwesomeIcons.smile;
                                  myFeedbackColor = Colors.green;
                                  myFeedbackText = "GOOD";
                                }
                                if (sliderValue >= 8.1 && sliderValue <= 10.0) {
                                  myFeedback = FontAwesomeIcons.laugh;
                                  myFeedbackColor = Colors.pink;
                                  myFeedbackText = "EXCELLENT";
                                }
                              });
                            },
                          ),),
                        ),
                        Padding(
                          padding: const EdgeInsets.all(12.0),
                          child: Container(child: TextField(
                            decoration: new InputDecoration(
                              border: new OutlineInputBorder(
                                  borderSide: new BorderSide(color: Colors.blueGrey)),
                              hintText: 'Add Comment',
                            ),
                            style: TextStyle(height: 3.0),
                          ),
                          ),
                        ),
                        Padding(
                          padding: const EdgeInsets.all(8.0),
                          child: Container(child: Align(
                            alignment: Alignment.bottomRight,
                            child: RaisedButton(
                              shape:RoundedRectangleBorder(borderRadius: new BorderRadius.circular(30.0)),
                              color: Color(0xffe05f2c),
                              child: Text('Submit',
                                style: TextStyle(color: Color(0xffffffff)),),
                              onPressed: () => Navigator.of(context).push(
                                 MaterialPageRoute(builder: (context) => HomePage()),
                              ),
                            ),
                          )),
                        ),
                      ],)
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
    ]),));
  }
}