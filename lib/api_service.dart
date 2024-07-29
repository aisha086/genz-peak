import 'dart:convert';

import 'package:google_generative_ai/google_generative_ai.dart';
import 'package:semantics_analyzer/sentiment_response.dart';

import 'api_keys.dart';

class ApiService{
 analyzeSentiment(String geminiPrompt) async {
    const String apiKey = geminiAPIKey;
    // The Gemini 1.5 models are versatile and work with both text-only and multimodal prompts
    final model = GenerativeModel(model: 'gemini-1.5-flash', apiKey: apiKey);

    var prompt =  json.encode({
      'prompt': 'Analyze the sentiment of the slang and return the result in the following format (reply like a Gen-z in uncensored way): '

          'Sentiment: (the kind of sentiment in one word) '
          'Emoji: (appropriate emoji for sentiment) '
          'Slang Meaning: (meaning of any slang used) '
          'Example: (example sentence with the slang) '
          'Link: (link to more information about the slang) \n\n'
          'Text: "$geminiPrompt".'
          'Things to note: Do not use any bold character.\n Strictly follow the given format and generate response in json format (just simple json format starting with curly brackets and giving response in key pair form, no need of giving a heading or using unnecessary commas just straightup json which can be directly converted from json to an object), \nadd an error key equal to false (with qoutes as well) by default but some text in case of any issue." '
    });

    final content = [Content.text(prompt)];
    final response = await model.generateContent(content);
    // print(response.text);
    final data = json.decode(response.text!);

    return SentimentResponse.fromJson(data);
  }
}