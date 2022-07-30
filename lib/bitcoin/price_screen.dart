import 'package:animated_text_kit/animated_text_kit.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:mi_card/bitcoin/Network/NetworkHelper.dart';
import 'package:mi_card/bitcoin/coin_data.dart';

import 'bitcoin_const.dart';

class PriceScreen extends StatefulWidget {
  @override
  _PriceScreenState createState() => _PriceScreenState();
}

class _PriceScreenState extends State<PriceScreen> {
  String selectedCurrency = "USD";
  String bitCoinRate = '';
  String completeText = '1 BTC = ? USD';
  String completeTextETH = '1 ETH = ? USD';
  String completeTextLTC = '1 LTC = ? USD';
  List<String> bitcoinCurrencyList = CoinData().getCurrenciesList();

  Future<String> getData(String selectedCurrency, String cryptoCurrency) async {
    double rate = await NetworkHelperForCurrency(countryCurrency: selectedCurrency, crypto: cryptoCurrency).getData();
    bitCoinRate = rate.round().toString();
    print(bitCoinRate);

    setState(() {
      if(cryptoCurrency == "BTC"){
        completeText = '$bitCoinRate $selectedCurrency';
      } else if(cryptoCurrency == "ETH"){
        completeTextETH = "$bitCoinRate $selectedCurrency";
      } else {
        completeTextLTC = "$bitCoinRate $selectedCurrency";
      }
    });
    return bitCoinRate;
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: kNotWhite,
      appBar: AppBar(
        leading: GestureDetector(
          onTap: () {
            Navigator.pop(context);
          },
          child: const
          Icon(
            Icons.arrow_back_ios_new_rounded,
            color: kDarkTextBlue,
          ),
        ),
        title: const Text('Rates', style: kAppBarTextStyleBitcoin,),
        centerTitle: true,
        backgroundColor: kNotWhite,
      ),
      body: Column(
        mainAxisAlignment: MainAxisAlignment.start,
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: <Widget>[
          Container(
            margin: const EdgeInsets.only(left: 20.0, top: 20.0, right: 20.0),
            decoration: BoxDecoration(
              color: Colors.white,
              borderRadius: BorderRadius.circular(8.0),
            ),
            constraints: const BoxConstraints(
              minHeight: 80.0,
            ),

            child: Row(
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                Container(
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(16.0),
                    border: Border.all(color: kBitcoinStrokeColor),
                    color: kBitcoinLightColor,
                  ),
                  margin: const EdgeInsets.symmetric(horizontal: 15.0),
                  constraints: const BoxConstraints(
                    minHeight: 60.0,
                    maxHeight: 60.0,
                    minWidth: 60.0,
                    maxWidth: 60.0
                  ),
                  child: Image.asset('assets/images/bitcoin.png'),
                ),
                Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    const Text("1 Bitcoin", style: kSmallBitcoinText,),
                    DefaultTextStyle(
                      style: kTitleBoldTextStyle,
                      child: AnimatedTextKit(
                        key: ValueKey(completeTextLTC),
                        isRepeatingAnimation: false,
                        animatedTexts: [
                          TypewriterAnimatedText(completeText,
                              speed: const Duration(milliseconds: 100))
                        ],
                      ),
                    )
                  ],
                )
              ],
            ),
          ),
          Container(
            margin: const EdgeInsets.only(left: 20.0, top: 10.0, right: 20.0),
            decoration: BoxDecoration(
              color: Colors.white,
              borderRadius: BorderRadius.circular(8.0),
            ),
            constraints: const BoxConstraints(
              minHeight: 80.0,
            ),

            child: Row(
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                Container(
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(16.0),
                    border: Border.all(color: kEthereumStrokeColor),
                    color: kEthereumLightColor,
                  ),
                  margin: const EdgeInsets.symmetric(horizontal: 15.0),
                  constraints: const BoxConstraints(
                      minHeight: 60.0,
                      maxHeight: 60.0,
                      minWidth: 60.0,
                      maxWidth: 60.0
                  ),
                  child: Image.asset('assets/images/ethereum.png'),
                ),
                Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    const Text("1 Ethereum", style: kSmallBitcoinText,),
                    DefaultTextStyle(
                      style: kTitleBoldTextStyle,
                      child: AnimatedTextKit(
                        key: ValueKey(completeTextLTC),
                        isRepeatingAnimation: false,
                        animatedTexts: [
                          TypewriterAnimatedText(completeTextETH,
                              speed: const Duration(milliseconds: 100))
                        ],
                      ),
                    )
                  ],
                )
              ],
            ),
          ),
          Container(
            margin: const EdgeInsets.only(left: 20.0, top: 10.0, right: 20.0),
            decoration: BoxDecoration(
              color: Colors.white,
              borderRadius: BorderRadius.circular(8.0),
            ),
            constraints: const BoxConstraints(
              minHeight: 80.0,
            ),

            child: Row(
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                Container(
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(16.0),
                    border: Border.all(color: kLiteCoinStrokeColor),
                    color: kLiteCoinLightColor,
                  ),
                  margin: const EdgeInsets.symmetric(horizontal: 15.0),
                  constraints: const BoxConstraints(
                      minHeight: 60.0,
                      maxHeight: 60.0,
                      minWidth: 60.0,
                      maxWidth: 60.0
                  ),
                  child: Image.asset('assets/images/litecoin.png'),
                ),
                Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    const Text("1 Litecoin", style: kSmallBitcoinText,),
                    DefaultTextStyle(
                        style: kTitleBoldTextStyle,
                        child: AnimatedTextKit(
                          key: ValueKey(completeTextLTC),
                          isRepeatingAnimation: false,
                          animatedTexts: [
                            TypewriterAnimatedText(completeTextLTC,
                            speed: const Duration(milliseconds: 100))
                          ],
                        ),
                    )
                  ],
                )
              ],
            ),
          ),
          Expanded(child: Container()),
          Container(
              height: 100.0,
              alignment: Alignment.center,
              decoration: const BoxDecoration(
                borderRadius: BorderRadius.only(topLeft: Radius.circular(20.0), topRight: Radius.circular(20.0)),
                color: Colors.white,
                boxShadow: [
                  BoxShadow(
                  color: Color(0xFFB7B8DF),
                  blurRadius: 10.0,
                  ),
                ]
              ),
              padding: const EdgeInsets.only(left: 20.0, right: 20.0, bottom: 20.0),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  const Text("Selected currency", style: kActionButtonTextStyleBlue,),
                  DropdownButton(
                    menuMaxHeight: 300.0,
                    borderRadius: BorderRadius.circular(8.0),
                    value: selectedCurrency,
                    dropdownColor: kEthereumLightColor,
                    alignment: Alignment.topLeft,
                    items: CoinData().getCurrenciesList().map<DropdownMenuItem<String>>((
                        String stringValue) {
                      return DropdownMenuItem<String>(
                        value: stringValue,
                        child: Text(stringValue, style: kDropDownTextStyle,),
                      );
                    }).toList(),
                    onChanged: (Object? value)  {
                      setState(()  {
                        selectedCurrency = value.toString();
                        getData(selectedCurrency, "BTC");
                        getData(selectedCurrency, "ETH");
                        getData(selectedCurrency, "LTC");
                      });
                    },
                  ),
                ],
              )
          ),
        ],
      ),
    );
  }
}

// IOS picker code.
// Widget getIosPicker() {
//   List<Widget> getAllCupertinoItemsForThePicker() {
//     List<Widget> itemsListForPicker = [];
//     for (String currency in bitcoinCurrencyList) {
//       itemsListForPicker.add(Text(currency));
//     }
//     return itemsListForPicker;
//   }
//
//   return CupertinoPicker(
//     onSelectedItemChanged: (selectedItem) {
//       print(selectedItem);
//     },
//     itemExtent: 32.0,
//     backgroundColor: Colors.lightBlue,
//     children: getAllCupertinoItemsForThePicker(),
//   );
// }