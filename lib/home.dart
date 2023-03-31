import 'dart:developer' as developer;

import 'package:brain_wave/helpers.dart';
import 'package:brain_wave/pallet.dart';
import 'package:brain_wave/widgets.dart';
import 'package:flutter/material.dart';
import 'package:speech_to_text/speech_recognition_result.dart';
import 'package:speech_to_text/speech_to_text.dart';

class Home extends StatefulWidget {
  const Home({super.key});

  @override
  State<Home> createState() => _HomeState();
}

class _HomeState extends State<Home> {
  final SpeechToText speechToText = SpeechToText();

  String lastWords = '';

  String? generatedContent;
  String? generatedImageUrl;
  int start = 200;
  int delay = 200;
  @override
  void initState() {
    super.initState();
    initSpeechToText();
  }

  Future<void> initSpeechToText() async {
    await speechToText.initialize();
    setState(() {});
  }

  Future<void> stopListening() async {
    await speechToText.stop();
    setState(() {});
  }

  Future<void> startListening() async {
    await speechToText.listen(onResult: onSpeechResult);
    setState(() {});
  }

  void onSpeechResult(SpeechRecognitionResult result) {
    setState(() {
      lastWords = result.recognizedWords;
      
    });
    developer.log('Speech Recognition Result: ${result.recognizedWords}', name: 'SpeechToText');
  }

  @override
  void dispose() {
    super.dispose();
    speechToText.stop();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        leading: const Icon(Icons.menu),
        title: const Text('Brain Wave'),
        centerTitle: true,
      ),
      body: SingleChildScrollView(
        child: Column(
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
            const BrainCard(
              color: Pallete.firstSuggestionBoxColor,
              text: 'A smarter way to organise and informed with Chat GPT',
              heading: 'ChatGPT',
            ),
            verticalSpacer(25),
            const BrainCard(
              color: Pallete.secondSuggestionBoxColor,
              text:
                  'Get inspried and stay crative with your persnoal assistant powered by DALL-E ',
              heading: 'DALL-E',
            ),
            verticalSpacer(25),
            const BrainCard(
                color: Pallete.thirdSuggestionBoxColor,
                text:
                    'Get the best-of both worlds with a voice assistant powered by DALL-E and ChatGPT',
                heading: 'Smart Voice Assistant'),
          ],
        ),
      ),
      floatingActionButton: FloatingActionButton(
        backgroundColor: Pallete.firstSuggestionBoxColor,
        onPressed: () async {
          if (await speechToText.hasPermission && speechToText.isNotListening) {
            await startListening();
          } else if (speechToText.isListening) {
            await stopListening();
          } else {
             initSpeechToText();
          }
        },
        child: const Icon(Icons.mic),
      ),
    );
  }
}
