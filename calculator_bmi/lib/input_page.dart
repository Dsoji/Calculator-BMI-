import 'package:calculator_bmi/reusable_card.dart';
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';

import 'icon_content.dart';

const bottomContainerHeight = 80.0;
const activeColourCard = Color(0xFF1D1E33);
const inactiveColourCard = Color(0xFF111328);
const bottomContainerColor = Colors.deepPurpleAccent;

enum Gender {
  male,
  female,
}

class InputPage extends StatefulWidget {
  @override
  _InputPageState createState() => _InputPageState();
}

class _InputPageState extends State<InputPage> {
  //
  Color maleCardColour = inactiveColourCard;
  Color femaleCardColour = inactiveColourCard;
//1= male, 2 = female
  void updateColour(Gender gender) {
    //male card pressed
    if (gender == Gender.male) {
      if (maleCardColour == inactiveColourCard) {
        maleCardColour = activeColourCard;
        femaleCardColour = inactiveColourCard;
      } else {
        maleCardColour = inactiveColourCard;
      }
    }
    //female card pressed
    if (gender == Gender.female) {
      if (femaleCardColour == inactiveColourCard) {
        femaleCardColour = activeColourCard;
        maleCardColour = inactiveColourCard;
      } else {
        femaleCardColour = inactiveColourCard;
      }
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: Text(
            'BMI CALCULATOR',
            style: TextStyle(
              fontWeight: FontWeight.bold,
            ),
          ),
        ),
        body: Column(
          children: <Widget>[
            Expanded(
                child: Row(
              children: <Widget>[
                Expanded(
                  child: GestureDetector(
                    onTap: () {
                      setState(() {
                        updateColour(Gender.male);
                      });
                    },
                    child: ReusableCard(
                      colour: maleCardColour,
                      cardChild: IconContent(
                        ikon: FontAwesomeIcons.mars,
                        label: 'MALE',
                      ),
                    ),
                  ),
                ),
                Expanded(
                  child: GestureDetector(
                    onTap: () {
                      setState(() {
                        updateColour(Gender.female);
                      });
                    },
                    child: ReusableCard(
                      colour: femaleCardColour,
                      cardChild: IconContent(
                        ikon: FontAwesomeIcons.venus,
                        label: 'FEMALE',
                      ),
                    ),
                  ),
                ),
              ],
            )),
            Expanded(
              child: ReusableCard(
                colour: activeColourCard,
                cardChild: IconContent(
                  ikon: FontAwesomeIcons.venus,
                  label: 'FEMALE',
                ),
              ),
            ),
            Expanded(
                child: Row(
              children: <Widget>[
                Expanded(
                  child: ReusableCard(
                    colour: activeColourCard,
                    cardChild: IconContent(
                      ikon: FontAwesomeIcons.venus,
                      label: 'FEMALE',
                    ),
                  ),
                ),
                Expanded(
                  child: ReusableCard(
                    colour: activeColourCard,
                    cardChild: IconContent(
                      ikon: FontAwesomeIcons.venus,
                      label: 'FEMALE',
                    ),
                  ),
                ),
              ],
            )),
            Container(
              color: bottomContainerColor,
              margin: EdgeInsets.only(top: 10.0),
              width: double.infinity,
              height: bottomContainerHeight,
            )
          ],
        ));
  }
}
