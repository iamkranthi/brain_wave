import 'package:brain_wave/helpers.dart';
import 'package:brain_wave/pallet.dart';
import 'package:brain_wave/widgets.dart';
import 'package:flutter/material.dart';

class Home extends StatelessWidget {
  const Home({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        leading: const Icon(Icons.menu),
        title: const Text('Brain Wave'),
        centerTitle: true,
      ),
      body: Column(
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          verticalSpacer(10),
          const CircleAvatar(
            backgroundColor: Colors.red,
            radius: 75,
            backgroundImage: AssetImage('assets/images/assistant.png'),
          ),
          verticalSpacer(20),
          Container(
            padding: const EdgeInsets.symmetric(vertical: 10, horizontal: 20),
            margin: const EdgeInsets.symmetric(horizontal: 15),
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(15),
              border: Border.all(color: Pallete.blackColor),
            ),
            child: const Brainheading(
              brainText: 'Good morning, What I can do for you?',
              fontColor: Pallete.mainFontColor,
              fontSize: 20,
              fontWeight: FontWeight.w400,
            ),
          ),
          verticalSpacer(20),
          const Padding(
            padding: EdgeInsets.symmetric(horizontal: 20.0),
            child: Align(
              alignment: Alignment.centerLeft,
              child: Brainheading(
                brainText: 'Here are few feartures',
                fontWeight: FontWeight.bold,
                fontSize: 20,
              ),
            ),
          ),
          verticalSpacer(10),
          const BrainCard(color: Pallete.firstSuggestionBoxColor,)
        ],
      ),
    );
  }
}
