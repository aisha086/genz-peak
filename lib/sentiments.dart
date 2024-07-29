import 'package:flutter/material.dart';
import 'dart:html' as html;
import 'package:semantics_analyzer/theme.dart';

import 'api_service.dart';

buildSentimentResults(String text){
  return FutureBuilder<dynamic>(
    future: ApiService().analyzeSentiment(text),
    builder: (context, snapshot) {
      if (snapshot.connectionState == ConnectionState.waiting) {
        return const CircularProgressIndicator();
      } else if (snapshot.hasError) {
        return Text('Error: ${snapshot.error}');
      } else if (snapshot.hasData) {
        // print(snapshot.data);
        final result = snapshot.data!;
        return result.error == "false"?
        Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            buildResponseRow('Sentiment: ', '${result.sentiment}'),
            buildResponseRow('Emoji: ', '${result.emoji}'),
            buildResponseRow('Slang Meaning: ', '${result.slangMeaning}'),
            buildResponseRow('Example:', '${result.example}'),
            InkWell(
              onTap: () {
                html.window.open(result.link, "_blank");
              },
              child: buildResponseRow('Link: ', '${result.link}',isLink: true),
            ),
          ],
        ):Text("Oops! An error occurred\n${result.error}");
      } else {
        return const Text('Enter the slang');
      }
    },
  );
}


buildResponseRow(String title, String response, {bool isLink = false}) {
  return Padding(
    padding: const EdgeInsets.symmetric(vertical: 4.0),
    child: Row(
      mainAxisAlignment: MainAxisAlignment.center,
      crossAxisAlignment: CrossAxisAlignment.center,
      children: [
        Text(title, style: TextStyle(color: MyTheme.indigoColor, fontSize: 20)),
        Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text(
              response,
              style: TextStyle(
                color: isLink ? MyTheme.indigoColor : MyTheme.lightIndigoColor,
                fontSize: 16,
                decoration: isLink ? TextDecoration.underline : TextDecoration.none,
              ),
              softWrap: true,
            ),
          ],
        ),
      ],
    ),
  );
}