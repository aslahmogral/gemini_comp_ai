import 'package:google_generative_ai/google_generative_ai.dart';

// Future<List> sendPromptMessage(String message) async {
//     // setState(() {
//     //   _messages.add({'role': 'user', 'content': message});
//     // });

//     final prompt = [Content.text(message)];
//     try {
//       final response = await model.generateContent(prompt);
//       // setState(() {
//       //   _messages.add({'role': 'assistant', 'content': response.text});
//       // });
//     } catch (error) {
//       print('Error generating response: $error');
//     }
//   }