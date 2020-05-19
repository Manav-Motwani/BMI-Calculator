import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:bmi_calculator/components/ReusableCard.dart';
import 'package:bmi_calculator/components/icon_content.dart';
import 'package:bmi_calculator/constants.dart';
import 'package:bmi_calculator/components/bottom_button.dart';
import 'package:bmi_calculator/components/round_button.dart';
import 'package:bmi_calculator/calculate_brain.dart';
import 'result_page.dart';

class InputPage extends StatefulWidget {
  @override
  _InputPageState createState() => _InputPageState();
}

enum Gender { male, female }

class _InputPageState extends State<InputPage> {
  Gender selectedGender;
  int fheight = 5;
  int inheight = 6;
  int weight = 60;
  int age = 21;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        title: Text('BMI CALCULATOR'),
      ),
      body: Column(
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: <Widget>[
          Expanded(
            child: Row(
              children: <Widget>[
                Expanded(
                  child: ReusableCard(
                    onPress: () {
                      setState(() {
                        selectedGender = Gender.male;
                      });
                    },
                    color: selectedGender == Gender.male
                        ? kActiveCardColor
                        : kInactiveCardColor,
                    childCard:
                        IconContent(icon: FontAwesomeIcons.mars, text: 'MALE'),
                  ),
                ),
                Expanded(
                  child: ReusableCard(
                    onPress: () {
                      setState(() {
                        selectedGender = Gender.female;
                      });
                    },
                    color: selectedGender == Gender.female
                        ? kActiveCardColor
                        : kInactiveCardColor,
                    childCard: IconContent(
                        icon: FontAwesomeIcons.venus, text: 'FEMALE'),
                  ),
                ),
              ],
            ),
          ),
          Expanded(
            child: ReusableCard(
              color: kActiveCardColor,
              childCard: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: <Widget>[
                  Text(
                    'HEIGHT',
                    style: kLabelTextStyle,
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    crossAxisAlignment: CrossAxisAlignment.baseline,
                    textBaseline: TextBaseline.alphabetic,
                    children: <Widget>[
                      Text(
                        fheight.toString(),
                        style: kNumberTextStyle,
                      ),
                      Text(
                        ' ft ',
                        style: kLabelTextStyle,
                      ),
                      Text(
                        inheight.toString(),
                        style: kNumberTextStyle,
                      ),
                      Text(
                        ' in',
                        style: kLabelTextStyle,
                      )
                    ],
                  ),
                  Column(
                    children: <Widget>[
                      SliderTheme(
                        data: SliderTheme.of(context).copyWith(
                            thumbColor: Color(0xFFEB1555),
                            activeTrackColor: Colors.white,
                            thumbShape:
                                RoundSliderThumbShape(enabledThumbRadius: 12.0),
                            overlayShape:
                                RoundSliderOverlayShape(overlayRadius: 19.0),
                            overlayColor: Color(0x29EB1555)),
                        child: Slider(
                          value: fheight.toDouble(),
                          min: 1.0,
                          max: 10.0,
                          inactiveColor: Color(0xFF808E98),
                          onChanged: (double newValue) {
                            setState(() {
                              fheight = newValue.round();
                            });
                          },
                        ),
                      ),
                      SliderTheme(
                        data: SliderTheme.of(context).copyWith(
                            thumbColor: Color(0xFFEB1555),
                            activeTrackColor: Colors.white,
                            thumbShape:
                                RoundSliderThumbShape(enabledThumbRadius: 12.0),
                            overlayShape:
                                RoundSliderOverlayShape(overlayRadius: 19.0),
                            overlayColor: Color(0x29EB1555)),
                        child: Slider(
                          value: inheight.toDouble(),
                          min: 0.0,
                          max: 11.0,
                          inactiveColor: Color(0xFF808E98),
                          onChanged: (double newValue) {
                            setState(() {
                              inheight = newValue.round();
                            });
                          },
                        ),
                      ),
                    ],
                  )
                ],
              ),
            ),
          ),
          Expanded(
            child: Row(
              children: <Widget>[
                Expanded(
                  child: ReusableCard(
                    color: kActiveCardColor,
                    childCard: Column(
                      children: <Widget>[
                        Text(
                          'WEIGHT',
                          style: kLabelTextStyle,
                        ),
                        Text(
                          weight.toString(),
                          style: TextStyle(
                              fontSize: 50.0, fontWeight: FontWeight.w900),
                        ),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: <Widget>[
                            RoundIconButton(icon: FontAwesomeIcons.minus,onPress: (){
                              setState(() {
                                weight--;
                              });
                              },
                            ),
                            SizedBox(width: 15.0,),
                            RoundIconButton(icon: FontAwesomeIcons.plus,onPress: (){
                              setState(() {
                                weight++;
                              });
                            },)
                          ],
                        ),
                      ],
                    ),
                  ),
                ),
                Expanded(
                  child: ReusableCard(
                    color: kActiveCardColor,
                    childCard: Column(
                      children: <Widget>[
                        Text(
                          'AGE',
                          style: kLabelTextStyle,
                        ),
                        Text(
                          age.toString(),
                          style: TextStyle(
                              fontSize: 50.0, fontWeight: FontWeight.w900),
                        ),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: <Widget>[
                            RoundIconButton(icon: FontAwesomeIcons.minus,onPress: (){
                              setState(() {
                                age--;
                              });
                            },
                            ),
                            SizedBox(width: 15.0,),
                            RoundIconButton(icon: FontAwesomeIcons.plus,onPress: (){
                              setState(() {
                                age++;
                              });
                            },)
                          ],
                        ),
                      ],
                    ),
                  ),
                ),
              ],
            ),
          ),
          BottomButton(ontap: (){

            CalculateBrain calc = CalculateBrain(fheight: fheight,inheight: inheight,weight: weight);

            Navigator.push(
              context,
              MaterialPageRoute(
                builder: (context) => ResultPage(
                  bmiResults: calc.calculateBMI(),
                  resultText: calc.getResults(),
                  interpretation: calc.getInterpretation(),
                ),
              ),
            );
          },
          buttonTitle: 'CALCULATE',),
        ],
      ),
    );
  }
}


