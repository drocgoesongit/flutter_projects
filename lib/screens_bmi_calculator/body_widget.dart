import 'package:flutter/material.dart';
import 'package:mi_card/screens_bmi_calculator/bmi_results.dart';
import 'basic_card_children.dart';
import 'reusable_widget.dart';
import '../const/const.dart';
import 'calculating_bmi.dart';

enum GenderType { male, female, nullType }

class BodyWidget extends StatefulWidget {
  const BodyWidget({Key? key}) : super(key: key);

  @override
  State<BodyWidget> createState() => _BodyWidgetState();
}

class _BodyWidgetState extends State<BodyWidget> {
  GenderType selectedGender = GenderType.male;
  int height = 180;
  int weight = 60;
  int age = 20;

  @override
  Widget build(BuildContext context) {
    return Column(children: [
      Expanded(
        child: Row(
          children: [
            Expanded(
                child: GestureDetector(
              onTap: () {
                setState(() {
                  selectedGender = GenderType.male;
                });
                ScaffoldMessenger.of(context).showSnackBar(const SnackBar(
                  content: Text("Selected gender male"),
                  duration: Duration(milliseconds: 400),
                ));
              },
              child: ReusableWidget(
                colour: selectedGender == GenderType.male
                    ? kActiveColor
                    : kInactiveColor,
                child: BasicCardChildren(icon: Icons.male, text: 'MALE'),
              ),
            )),
            Expanded(
                child: GestureDetector(
              onTap: () {
                setState(() {
                  selectedGender = GenderType.female;
                });
                ScaffoldMessenger.of(context).showSnackBar(const SnackBar(
                  content: Text("Selected gender female"),
                  duration: Duration(milliseconds: 400),
                ));
              },
              child: ReusableWidget(
                colour: selectedGender == GenderType.female
                    ? kActiveColor
                    : kInactiveColor,
                child: BasicCardChildren(icon: Icons.female, text: 'FEMALE'),
              ),
            ))
          ],
        ),
      ),
      Expanded(
          child: ReusableWidget(
        colour: kColorForContainers,
        child: Column(mainAxisAlignment: MainAxisAlignment.center, children: [
          const Text("HEIGHT",
              style: TextStyle(fontSize: 18.0, color: kFontColorCard)),
          const SizedBox(
            height: 10.0,
          ),
          Row(
            textBaseline: TextBaseline.alphabetic,
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.baseline,
            children: [
              Text(
                height.toString(),
                style: kThickNumberStyle,
              ),
              const SizedBox(
                width: 4.0,
              ),
              const Text("cm")
            ],
          ),
          SliderTheme(
            data: SliderTheme.of(context).copyWith(),
            child: Slider(
              value: height.toDouble(),
              label: height.toString(),
              min: 100.0,
              max: 220.0,
              activeColor: Color(0xFFEB1555),
              inactiveColor: Color(0xFF8D8E98),
              onChanged: (newValue) {
                setState(() {
                  height = newValue.round();
                });
              },
            ),
          ),
        ]),
      )),
      Expanded(
        child: Row(
          children: [
            Expanded(
                child: ReusableWidget(
              colour: kColorForContainers,
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  const Text("WEIGHT",
                      style: TextStyle(
                        fontSize: 18.0,
                        color: kFontColorCard,
                      )),
                  const SizedBox(
                    height: 8.0,
                  ),
                  Text(
                    weight.toString(),
                    style: kThickNumberStyle,
                  ),
                  const SizedBox(
                    height: 8.0,
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      RoundIconButton(
                        icon: Icons.remove,
                        changeWeight: () {
                          setState(() {
                            weight--;
                          });
                        },
                      ),
                      const SizedBox(
                        width: 10.0,
                      ),
                      RoundIconButton(
                          icon: Icons.add,
                          changeWeight: () {
                            setState(() {
                              weight++;
                            });
                          }),
                    ],
                  )
                ],
              ),
            )),
            Expanded(
                child: ReusableWidget(
              colour: kColorForContainers,
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  const Text("AGE",
                      style: TextStyle(
                        fontSize: 18.0,
                        color: kFontColorCard,
                      )),
                  const SizedBox(
                    height: 8.0,
                  ),
                  Text(
                    age.toString(),
                    style: kThickNumberStyle,
                  ),
                  const SizedBox(
                    height: 8.0,
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      RoundIconButton(
                        icon: Icons.remove,
                        changeWeight: () {
                          setState(() {
                            age--;
                          });
                        },
                      ),
                      const SizedBox(
                        width: 10.0,
                      ),
                      RoundIconButton(
                          icon: Icons.add,
                          changeWeight: () {
                            setState(() {
                              age++;
                            });
                          }),
                    ],
                  )
                ],
              ),
            ))
          ],
        ),
      ),
      // button to calculate BMI in the end.
      MaterialButton(
        onPressed: () {
          CalculatorBrain brain = CalculatorBrain(height: height, weight: weight);

          Navigator.push(context,
              MaterialPageRoute(builder: (context) => BMIResults(
                bmi1: brain.CalculateBmi(),
                resultOutcome: brain.getResult(),
                interpretation: brain.GetInterpretation(),
              )));
        },
        child: Container(
          margin: const EdgeInsets.fromLTRB(15.0, 10.0, 15.0, 15.0),
          height: kBottomContainerHeight,
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(10.0),
            color: kBottomContainerColor,
          ),
          child: const Center(
            child: Text(
              "Calculate",
              style: TextStyle(fontSize: 18.0),
            ),
          ),
        ),
      )
    ]);
  }
}

class RoundIconButton extends StatelessWidget {
  RoundIconButton({required this.icon, required this.changeWeight});

  final IconData icon;
  final Function changeWeight;

  @override
  Widget build(BuildContext context) {
    return RawMaterialButton(
      constraints: const BoxConstraints(
        minHeight: 56.0,
        minWidth: 56.0,
      ),
      onPressed: () {
        changeWeight();
      },
      shape: const CircleBorder(),
      fillColor: const Color(0xFF4C4F5E),
      child: Icon(
        icon,
      ),
    );
  }
}
