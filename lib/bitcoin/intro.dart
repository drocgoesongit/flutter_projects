import 'package:flutter/material.dart';
import 'package:mi_card/bitcoin/bitcoin_const.dart';
import 'package:mi_card/bitcoin/price_screen.dart';

class IntroScreen extends StatelessWidget {
  const IntroScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Material(
      type: MaterialType.transparency,
      child: Container(
        color: kBackgroundDarkBlue,
          child: Column(
            children: [
              Expanded(
                  child: Padding(
                    padding: const EdgeInsets.all(20.0),
                    child: Image.asset('assets/images/foregroundImageIntro.png'
                    ,
                    fit: BoxFit.fill,),
                  )
              ),
              Container(
                height: 300.0,
                width: double.infinity,
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(20.0),
                  color: kNotWhite,
                  boxShadow: kElevationToShadow[4],
                ),
                margin: const EdgeInsets.all(20.0),
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    const Padding(
                      padding:  EdgeInsets.fromLTRB(10.0, 0.0, 10.0, 10.0),
                      child:  Text("Convert crypto to your currency", style: kTitleBoldTextStyle, textAlign: TextAlign.center,),
                    ),
                    const Padding(
                      padding:  EdgeInsets.fromLTRB(10.0, 0.0, 10.0, 20.0),
                      child: Text("Instantly convert BTC, ETH, LTC in your local currencies.", style: kSmallBitcoinText, textAlign: TextAlign.center,),
                    ),
                    RawMaterialButton(
                      fillColor: kBitcoinAccentBlue,
                      textStyle: kActionButtonTextStyle,
                      constraints: const BoxConstraints(
                        minHeight: 50.0,
                        minWidth: 150.0,
                      ),
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(8.0),
                      ),
                      onPressed: () {
                        Navigator.push(
                          context,
                          MaterialPageRoute(builder: (context) => PriceScreen())
                        );
                      },
                      child: const Text("Get started", style: kActionButtonTextStyle,),
                    ),


                  ],
                ),
              )
            ],
          )
      ),
    );

  }
}
