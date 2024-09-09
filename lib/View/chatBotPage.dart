
// ignore_for_file: unnecessary_type_check

import 'dart:async';
import 'dart:io';
import 'dart:math';
import 'dart:typed_data';
import 'package:ai_chat_bot/Utils/Utils.dart';
import 'package:ai_chat_bot/View/imageViewer.dart';
import 'package:ai_chat_bot/controller/logoutController.dart';
import 'package:ai_chat_bot/controller/themeController.dart';
import 'package:ai_chat_bot/main.dart';
import 'package:avatar_glow/avatar_glow.dart';
import 'package:clipboard/clipboard.dart';
import 'package:flutter/material.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';
import 'package:flutter_tts/flutter_tts.dart';
import 'package:get/get.dart';
import 'package:http/http.dart' as http;
import 'package:image_gallery_saver/image_gallery_saver.dart';
import 'package:image_picker/image_picker.dart';
import 'package:path_provider/path_provider.dart';
import 'package:share_plus/share_plus.dart';
import 'dart:convert';

import 'package:speech_to_text/speech_to_text.dart';
import 'package:translator/translator.dart';



class ChatScreen extends StatefulWidget {
  @override
  _ChatScreenState createState() => _ChatScreenState();
}

class _ChatScreenState extends State<ChatScreen> {

  final LogoutController _logoutController = Get.put(LogoutController());

  // String textForPromptSuggestion1="How can Pakistan improve its economy?";
  String textForPromptSuggestion1="";
  // String textForPromptSuggestion2="What's your take on rising inflation?";
  String textForPromptSuggestion2="";
  // String textForPromptSuggestion3="How can we fix the education system?";
  String textForPromptSuggestion3="";

  List<String> uniqueQuestionsForPromptSuggestion = [
  "What factors are behind Australia's recent cricket success?",
  "How are new cricket nations performing?",
  "Impact of IPL on young Indian cricketers?",
  "Effects of player fatigue in international cricket?",
  "Most anticipated cricket matches this season?",
  "How are bio-bubble protocols managed in cricket?",
  "Latest innovations in cricket technology?",
  "Promotion of Women's Cricket World Cup?",
  "Financial effects of empty stadiums in cricket?",
  "Addressing mental health among cricketers?",
  "Major storylines from UEFA Champions League?",
  "Sports leagues' adaptation to fan-less games?",
  "Economic effects of Olympics during a pandemic?",
  "AI's impact on healthcare industry?",
  "Recent geopolitical developments in the Middle East?",
  "Global supply chain coping with pandemic?",
  "Trends in renewable energy adoption?",
  "Evolution of cybersecurity against online threats?",
  "Outcomes of the G20 summit?",
  "Housing market response to rising interest rates?",
  "Most influential startups in 2024?",
  "Social media platforms' approach to misinformation?",
  "Role of cryptocurrencies in the global economy?",
  "Automotive industry's shift to electric vehicles?",
  "Biggest challenges in space exploration?",
  "Impact of remote work on corporate culture?",
  "Environmental impacts of the fashion industry?",
  "Global tourism trends post-pandemic?",
  "Implications of AI in education?",
  "Governments' response to climate change policies?",
  "Trends in global real estate?",
  "Food industry’s approach to sustainability?",
  "Drivers of the global tech market?",
  "Digital transformation’s effect on traditional businesses?",
  "Cybersecurity challenges in remote work?",
  "Progress in quantum computing in 2024?",
  "Social media's effects on mental health?",
  "Renewable energy sector growth in developing countries?",
  "Developments in vaccine technology?",
  "Film industry's recovery from the pandemic?",
  "Pressing issues in global health?",
  "Tech industry’s response to supply chain disruptions?",
  "Impact of 5G rollout on industries?",
  "Cities' plans for climate resilience?",
  "Challenges in global food security?",
  "Job market evolution with automation?",
  "Trends in cryptocurrency regulation?",
  "Changes in international diplomacy in 2024?",
  "Ethical concerns in AI development?",
  "Education sector’s response to the digital divide?",
  "Updates on the ICC World Cup?",
  "Indian cricket team's preparation for upcoming series?",
  "Implications of recent cricket rule changes?",
  "T20 format’s influence on cricket’s future?",
  "Controversies in international cricket recently?",
  "Global sports community's response to doping scandals?",
  "Top stories from the ongoing Olympics?",
  "FIFA World Cup's current developments?",
  "Significant football transfers?",
  "Global economy's recovery from COVID-19?",
  "Recent tech industry developments?",
  "Stock market's reaction to political events?",
  "Key takeaways from the latest climate summit?",
  "Entertainment industry's adaptation to streaming?",
  "Significant scientific breakthroughs this year?",
  "Challenges in addressing climate change globally?",
  "Global response to the refugee crisis?",
  "Combating food insecurity in developing countries?",
  "COVID-19's impact on global health systems?",
  "Economic consequences of the Russia-Ukraine conflict?",
  "Mitigating deforestation effects on biodiversity?",
  "Providing universal access to clean water?",
  "Effects of populism on global democracies?",
  "Strategies for the global housing crisis?",
  "Addressing the opioid crisis?",
  "Long-term effects of plastic pollution in oceans?",
  "AI's influence on job markets worldwide?",
  "Challenges in achieving global gender equality?",
  "International community's response to human trafficking?",
  "Impact of rising sea levels on coastal communities?",
  "Reducing carbon emissions in transportation?",
  "Implications of global chip shortage on industries?",
  "Tackling antibiotic resistance?",
  "Providing education in conflict zones?",
  "Impact of misinformation on media trust?",
  "Measures to protect endangered species?",
  "Energy crisis's effect on global economies?",
  "Health implications of air pollution in urban areas?",
  "Financial system's response to economic inequality?",
  "Rebuilding after natural disasters?",
  "Evolving cybercrime in the digital age?",
  "Trends in renewable energy adoption?",
  "Prioritizing mental health in public health policies?",
  "Enforcing international environmental agreements?",
  "Gig economy's impact on workers' rights?",
  "Addressing the global aging population?",
  "Nuclear proliferation issues?",
  "Achieving global vaccination coverage?",
  "Climate change's effect on food production?",
  "Global waste management solutions?",
  "Digital divide's impact on education in developing countries?",
  "Economic impacts of trade wars?",
  "International response to terrorism?",
  "Protecting human rights in authoritarian regimes?",
  "Supply chain crisis's effect on businesses?",
  "Space exploration's impact on global cooperation?",
  "Addressing child labor in developing countries?",
  "Providing affordable global healthcare?",
  "Urbanization's effect on environmental sustainability?",
  "Migration trends and societal impacts?",
  "Digital currencies' effect on traditional banking?",
  "Combating global corruption?",
  "Addressing modern slavery issues?",
  "Plastic pollution crisis solutions?",
  "Mitigating climate change effects?",
  "Making renewable energy sources accessible worldwide?",
  "Strategies for protecting endangered species?",
  "Combating deforestation in the Amazon?",
  "Governments' role in reducing carbon emissions?",
  "Tackling ocean acidification?",
  "Impacts of overfishing on marine ecosystems?",
  "Promoting sustainable agriculture?",
  "Addressing global water scarcity?",
  "Strategies to combat income inequality?",
  "Combating systemic racism?",
  "Ensuring equal education access for all children?",
  "Protecting refugee rights?",
  "Addressing nationalism and xenophobia?",
  "Governments' role in gender equality?",
  "Combatting human trafficking and modern slavery?",
  "Ensuring LGBTQ+ rights globally?",
  "Supporting mental health of marginalized communities?",
  "Fighting child labor worldwide?",
  "Improving global vaccination rates?",
  "Lessons from COVID-19 for future pandemics?",
  "Addressing global healthcare worker shortages?",
  "Challenges in rural healthcare provision?",
  "Reducing global burden of non-communicable diseases?",
  "Combating the opioid crisis?",
  "Improving mental health care access?",
  "Combating antibiotic resistance?",
  "Ensuring access to clean drinking water?",
  "Governments' role in regulating food and beverage industry for public health?",
  "Addressing ethical concerns in AI?",
  "Technology's role in economic inequality?",
  "Combating misinformation and fake news online?",
  "Implications of increased surveillance on privacy?",
  "Using technology to promote democracy and human rights?",
  "Ensuring global benefits from technological advancements?",
  "Addressing the digital divide between developed and developing countries?",
  "Risks of autonomous weapons systems?",
  "Improving cybersecurity for critical infrastructure?",
  "Tech companies' role in content regulation?",
  "International organizations' role in global conflicts?",
  "Enforcing international human rights laws?",
  "Reforming the United Nations for modern issues?",
  "Wealthy nations' role in addressing global poverty?",
  "Improving global cooperation on climate change and terrorism?",
  "Combating international corruption?",
  "Ensuring global trade benefits all countries?",
  "Preventing nuclear weapons proliferation?",
  "Achieving global food security amid climate change?",
];


  final String apiKey = "gemini-api-key";
  final TextEditingController _controller = TextEditingController();
  List<Map<String, dynamic>> _messages = [];
  late String base64File;
  String formattedTime="${DateTime.now().hour}:${DateTime.now().minute}";

   Color optionPressColor=MyColors.bgColor;
   bool isLoading=false;

  File? _selectedImage;
  

  int? selectedMessageIndex;
  bool checkFunctionRun=false;

  SpeechToText _speech=SpeechToText();
  bool _isListening = false;
  String _text = "Tap the microphone and start speaking";

  FlutterTts _flutterTts = FlutterTts();
  

  String selectedLanguage = 'en'; 
  GoogleTranslator translator = GoogleTranslator();
  bool _isSpeaking=false;

  static const Map<String, String> languageCodes = {

  'af': 'Afrikaans',
  'sq': 'Albanian',
  'ar': 'Arabic',
  'hy': 'Armenian',
  'bn': 'Bengali',
  'bs': 'Bosnian',
  'ca': 'Catalan',
  'hr': 'Croatian',
  'cs': 'Czech',
  'da': 'Danish',
  'nl': 'Dutch',
  'en': 'English',
  'eo': 'Esperanto',
  'et': 'Estonian',
  'tl': 'Filipino',
  'fi': 'Finnish',
  'fr': 'French',
  'de': 'German',
  'el': 'Greek',
  'gu': 'Gujarati',
  'ht': 'Haitian Creole',
  'ha': 'Hausa',
  'he': 'Hebrew',
  'hi': 'Hindi',
  'hu': 'Hungarian',
  'is': 'Icelandic',
  'id': 'Indonesian',
  'it': 'Italian',
  'ja': 'Japanese',
  'jw': 'Javanese',
  'kn': 'Kannada',
  'km': 'Khmer',
  'ko': 'Korean',
  'la': 'Latin',
  'lv': 'Latvian',
  'lt': 'Lithuanian',
  'lu': 'Luxembourgish',
  'mk': 'Macedonian',
  'ml': 'Malayalam',
  'mt': 'Maltese',
  'mi': 'Māori',
  'mr': 'Marathi',
  'my': 'Burmese',
  'ne': 'Nepali',
  'no': 'Norwegian',
  'pl': 'Polish',
  'pt': 'Portuguese',
  'pa': 'Punjabi',
  'ro': 'Romanian',
  'ru': 'Russian',
  'sr': 'Serbian',
  'si': 'Sinhala',
  'sk': 'Slovak',
  'sl': 'Slovenian',
  'es': 'Spanish',
  'su': 'Sundanese',
  'sw': 'Swahili',
  'sv': 'Swedish',
  'ta': 'Tamil',
  'te': 'Telugu',
  'th': 'Thai',
  'tr': 'Turkish',
  'uk': 'Ukrainian',
  'ur': 'Urdu',
  'vi': 'Vietnamese',
  'cy': 'Welsh',
  'xh': 'Xhosa',
  'yi': 'Yiddish',
  'yo': 'Yoruba',
  'zu': 'Zulu',
  'zh': 'Chinese',
  'am': 'Amharic',
  'az': 'Azerbaijani',
  'bg': 'Bulgarian',
  'ny': 'Chichewa',
  'co': 'Corsican',
  'dv': 'Divehi',
  'ee': 'Ewe',
  'fa': 'Persian',
  'ga': 'Irish',
  'ka': 'Georgian',
  'gl': 'Galician',
  'gn': 'Guarani',
  'hmn': 'Hmong',
  'ig': 'Igbo',
  'ku': 'Kurdish',
  'ky': 'Kyrgyz',
  'lo': 'Lao',
  'mg': 'Malagasy',
  'mn': 'Mongolian',
  'ps': 'Pashto',
  'sm': 'Samoan',
  'gd': 'Scottish Gaelic',
  'sn': 'Shona',
  'so': 'Somali',
  'st': 'Sesotho',
  'tg': 'Tajik',
  'tk': 'Turkmen',
  'uz': 'Uzbek',
  'be': 'Belarusian',
  'iw': 'Hebrew',
  'lb': 'Luxembourgish',
  'rw': 'Kinyarwanda',
  'tt': 'Tatar',
  'ug': 'Uyghur',
  'haw': 'Hawaiian',
  'sd': 'Sindhi',
};

var imageMessageForDownload;
// for stability ai
 Uint8List? imageData;

 var suggestionMessageList=[];
 
  final String api_Key = 'stability-api-key'; // Use your API key here
  final String apiHost = 'https://api.stability.ai';
  final String engineId = 'stable-diffusion-v1-6'; // Check the correct engine ID if different
// for stability ai



  @override
  void initState() {
    super.initState();
    selectRandomQuestion(uniqueQuestionsForPromptSuggestion);
    initSpeak();
    
  }

  void selectRandomQuestion(List<String> questions) {
  final random = Random();
  int randomIndex = random.nextInt(questions.length);
     _sendSuggestionMessage(questions[randomIndex]);

    }

  Future<void> initSpeak() async {
    await _flutterTts.speak("Welcome to Ahmed AI ChatBot"); 
  }

  void _listen(Function setState) async {
  
    if (!_isListening) {
      bool available = await _speech.initialize(
        onStatus: (status) => print('Status: $status'),
        onError: (error) => print('Error: $error'),
      );
      if (available) {
        setState(() => _isListening = true);
        _speech.listen(
          onResult: (val) {
            setState(() {
              _text = val.recognizedWords;
              _controller.text=val.recognizedWords;
            });
          },
        );
      }
    } else {
      setState(() {
        _isListening = false;
        _speech.stop();
        
      });
      Timer(Duration(seconds: 3), () {
        Get.back();
       });
    }
  }


  //////////////////
  ///


void _deleteMessage() {
  if (selectedMessageIndex != null) {
    setState(() {
      // Adjust the index to match the original message order
      _messages.removeAt(_messages.length - 1 - selectedMessageIndex!);
      selectedMessageIndex = null;
    });
  }
}

void _copyMessage() {
  if (selectedMessageIndex != null) {
    // Adjust the index to match the original message order
    final message = _messages[_messages.length - 1 - selectedMessageIndex!]['text'];
   
    FlutterClipboard.copy(message.toString()).then(( value ) => 
     Get.snackbar(
      '', // Leave title empty if not needed
      '',
      messageText: Align(
      alignment: Alignment.center, // Change alignment as needed
      child: Text(
        "Text copied",
        style: TextStyle(color: Colors.white),
      ),
    ),
      
      snackPosition: SnackPosition.BOTTOM,
      margin: EdgeInsets.all(10), // Margin for spacing around the snackbar
      colorText: MyColors.whiteColor,
      backgroundColor: MyColors.mainColor,
      borderRadius: 20, // Roundness of the snackbar corners
      snackStyle: SnackStyle.FLOATING, // Makes the snackbar float above the content
    )
    //  ScaffoldMessenger.of(context).showSnackBar(
    //   SnackBar(
    //     backgroundColor: MyColors.mainColor,
    //     content: Container(
    //       decoration: BoxDecoration(
    //       // color: Colors.white,
    //       borderRadius: BorderRadius.only(
    //         topLeft: Radius.circular(20),
    //         topRight: Radius.circular(20),
    //       )),
    //       child: myCustomWidget.myText('Copied: $message', 14, MyColors.whiteColor)),
    //     )
    // )
    );
    setState(() {
      selectedMessageIndex = null;
    });
  }
}

void _resetSelection() {
  setState(() {
    selectedMessageIndex = null; // Deselect the message
  });
}



// void _shareMessage() async{
//   if (selectedMessageIndex != null) {
    
//     // Adjust the index to match the original message order
//     final message = _messages[_messages.length - 1 - selectedMessageIndex!]['text'];
//     var imageMessage = _messages[_messages.length - 1 - selectedMessageIndex!]['image'];  // for checking the image message 
    
//     if(imageMessage !=null){
//        var imageMessageForAnalysis = _messages[_messages.length - 1 - selectedMessageIndex!]['image'] as File;  // for checking the image message 
//        var imageMessageForImageGen = _messages[_messages.length - 1 - selectedMessageIndex!]['image'];
      
//       if (imageMessageForImageGen is Uint8List) {
       
//       // Get the temporary directory
//       final tempDir = await getTemporaryDirectory();
      
//       // Create a file in the temporary directory
//       final file = File('${tempDir.path}/shared_image.png');
      
//       // Write the image data to the file
//       await file.writeAsBytes(imageMessageForImageGen);
      
//       // Check if the file exists
//           if (await file.exists()) {
//             print('File successfully created at: ${file.path}');
            
//             // Share the image file
//             await Share.shareFiles([file.path], text: 'Check out this image!');
//           } else {
//             print('Failed to create file.');
//       }
//   } 
// // image generation message end...


//   else if (imageMessageForAnalysis is File) {
//       // If the image data is a File, share it directly
//       // await Share.shareFiles([imageMessage.path], text: 'Check out this image!');
//       // File imageFile = File(imageMessage);
//       // await Share.shareFiles([imageMessage], text: 'Check out this image!');
//       // print(imageMessage);
      
//         // Extract the file path using a regular expression
//         print("hello");

//          Share.shareFiles([imageMessageForAnalysis.path], text: message);
         

//     } else {
        
//       // print(imageMessage);
//       // throw Exception("Unsupported image type");
//        final RegExp regExp = RegExp(r"File: '(.+)'");
//           final match = regExp.firstMatch(imageMessage);

//           if (match != null) {
//             final String? filePath = match.group(1);

//             // Create a File object
//             final File imageFile = File(filePath!);

//             // Share the image
//             Share.shareFiles([imageFile.path], text: 'Check out this image!');
//           } else {
            
//             print('No valid file path found in the string.');
//           }
//           print(match);
      
//     }
       
//     }
//     else{
//       Share.share(message, subject: 'Check out this message');
//       setState(() {
//         selectedMessageIndex = null;
//       });
//     }
//   }
// }


void _shareMessage() async {
  if (selectedMessageIndex != null) {
    final message = _messages[_messages.length - 1 - selectedMessageIndex!]['text'];
    var imageMessage = _messages[_messages.length - 1 - selectedMessageIndex!]['image'];

    if (imageMessage != null) {
      if (imageMessage is Uint8List) {
        // Handle Uint8List image data
        final tempDir = await getTemporaryDirectory();
        final file = File('${tempDir.path}/shared_image.png');

        await file.writeAsBytes(imageMessage);

        if (await file.exists()) {
          print('File successfully created at: ${file.path}');
          await Share.shareFiles([file.path], text: 'Check out this image!');
        } else {
          print('Failed to create file.');
        }
      } else if (imageMessage is File) {
        // Handle File object directly
        final filePath = imageMessage.path;

        if (await imageMessage.exists()) {
          await Share.shareFiles([filePath], text: message);
        } else {
          print('File does not exist at: $filePath');
        }
      } else if (imageMessage is String) {
        // Handle file path in string format
        final RegExp regExp = RegExp(r"File: '(.+)'");
        final match = regExp.firstMatch(imageMessage);

        if (match != null) {
          final String? filePath = match.group(1);

          if (filePath != null) {
            final File imageFile = File(filePath);

            if (await imageFile.exists()) {
              await Share.shareFiles([filePath], text: 'Check out this image!');
            } else {
              print('File does not exist at: $filePath');
            }
          } else {
            print('No valid file path found in the string.');
          }
        } else {
          print('No valid file path found in the string.');
        }
      } else {
        print('Unsupported image type.');
      }
    }
    else{
      Share.share(message, subject: 'Check out this message');
      setState(() {
        selectedMessageIndex = null;
      });
  }
  }
}


// void  _imageDownload()async{

//   var imageMessage = _messages[_messages.length - 1 - selectedMessageIndex!]['image'];
//    try{
//      final tempDir = await getTemporaryDirectory();
      
     
//       final file = File('${tempDir.path}/shared_image.png');
//       await file.writeAsBytes(imageMessage);
      
//       if (await file.exists()) {
 
//           FileDownloader.downloadFile(url: imageMessage,
//           onProgress: (name,progress){
//             setState(() {
              
//             });
            
//           },
//           onDownloadCompleted: (Value){
//              Get.snackbar(
//               'Download Comleted', // Leave title empty if not needed
//               '',
//               snackPosition: SnackPosition.BOTTOM,
//               margin: EdgeInsets.all(10), // Margin for spacing around the snackbar
//               colorText: MyColors.whiteColor,
//               backgroundColor: MyColors.mainColor,
//               borderRadius: 20, // Roundness of the snackbar corners
//               snackStyle: SnackStyle.FLOATING, // Makes the snackbar float above the content
//             );
//             setState(() {
              
//             });
//           }
//           );

        
//       } else {
//         print('Failed to Downloaded Image.');
//       }
//    }
//       catch (e) {
//     print('Error sharing image: $e');
//   }
 
// }


void _imageDownload() async {
  try {
    var imageMessage = _messages[_messages.length - 1 - selectedMessageIndex!]['image'];

    if (imageMessage != null) {
      bool isSuccess = false;

      if (imageMessage is Uint8List) {
        // Handle Uint8List image data
        final result = await ImageGallerySaver.saveImage(imageMessage);
        isSuccess = result['isSuccess'];
      } else if (imageMessage is File) {
        // Handle File image data
        final filePath = imageMessage.path;
        final Uint8List imageData = await imageMessage.readAsBytes();

        final result = await ImageGallerySaver.saveImage(imageData);
        isSuccess = result['isSuccess'];
      } else if (imageMessage is String) {
        // Handle file path in string format
        final RegExp regExp = RegExp(r"File: '(.+)'");
        final match = regExp.firstMatch(imageMessage);

        if (match != null) {
          final String? filePath = match.group(1);

          if (filePath != null) {
            final File imageFile = File(filePath);

            if (await imageFile.exists()) {
              final Uint8List imageData = await imageFile.readAsBytes();
              final result = await ImageGallerySaver.saveImage(imageData);
              isSuccess = result['isSuccess'];
            } else {
              print('File does not exist at: $filePath');
            }
          } else {
            print('No valid file path found in the string.');
          }
        } else {
          print('No valid file path found in the string.');
        }
      } else {
        print('Unsupported image type.');
      }

      if (isSuccess) {
        Get.snackbar(
          'Download Completed',
          'Image saved to the gallery',
          snackPosition: SnackPosition.BOTTOM,
          margin: EdgeInsets.all(10),
          colorText: Colors.white,
          backgroundColor: MyColors.mainColor,
          borderRadius: 20,
          snackStyle: SnackStyle.FLOATING,
        );
      } else {
        print('Failed to save image.');
      }

      setState(() {
        selectedMessageIndex = null;
      });
    }
  } catch (e) {
    print('Error saving image: $e');
    setState(() {
      selectedMessageIndex = null;
    });
  }
}



// void _imageDownload() async {
//   try {
//     var imageMessage = _messages[_messages.length - 1 - selectedMessageIndex!]['image'];

//     // Save the image to the gallery
//     final result = await ImageGallerySaver.saveImage(imageMessage);

//     if (result['isSuccess']) {
//       // Show a snackbar indicating the download was successful
//       Get.snackbar(
//         'Download Completed',
//         'Image saved to the gallery',
//         snackPosition: SnackPosition.BOTTOM,
//         margin: EdgeInsets.all(10),
//         colorText: Colors.white,
//         backgroundColor: MyColors.mainColor,
//         borderRadius: 20,
//         snackStyle: SnackStyle.FLOATING,
//       );
//       setState(() {
//         selectedMessageIndex=null;
//       });
//     } else {
//       print('Failed to save image.');
//        setState(() {
//         selectedMessageIndex=null;
//       });
//     }
//   } catch (e) {
//     print('Error saving image: $e');
//      setState(() {
//         selectedMessageIndex=null;
//       });
//   }
// }



void _onMessageLongPress(int index) {
  setState(() {
    if (selectedMessageIndex == index) {
      selectedMessageIndex = null; // Deselect if already selected
    } else {
      selectedMessageIndex = index; // Select the message
      imageMessageForDownload = _messages[_messages.length - 1 - selectedMessageIndex!]['image'];
    }
  });
}


Future<void> _speak() async {
    
    if (selectedMessageIndex != null) {
     setState(() {
       _isSpeaking=true;
     }); 
    // Adjust the index to match the original message order
    final message = _messages[_messages.length - 1 - selectedMessageIndex!]['text'];
    await _flutterTts.speak(message.toString());
    // setState(() {
    //   selectedMessageIndex = null;
    // });
    }
  }

Future<void> _stopSpeaking() async {
    
    if (selectedMessageIndex != null) {
    
    // Adjust the index to match the original message order
    await _flutterTts.stop();
     setState(() {
       _isSpeaking=false;
     }); 
    // setState(() {
    //   selectedMessageIndex = null;
    // });
    }
  }



  ////////////////////
  ///
  ///
  ///
  ///
  

   

    void openBottomSheet() {
    Get.bottomSheet(
      Container(
        decoration: BoxDecoration(
          color: Color.fromARGB(255, 141, 63, 219),
          borderRadius: BorderRadius.only(
            topLeft: Radius.circular(20),
            topRight: Radius.circular(20),
          ),
        ),
        child: Wrap(
          children: <Widget>[
            ListTile(
              leading: Icon(Icons.photo_library,color: MyColors.whiteColor,),
              title: myCustomWidget.myText("Gallery", 17, MyColors.whiteColor),
              onTap: () {
                _pickImage(ImageSource.gallery);
              },
            ),
            Divider(
              color: MyColors.whiteColor,
              thickness: 1.5,
            ),
            ListTile(
              leading: Icon(Icons.camera_alt,color: MyColors.whiteColor,),
              title: myCustomWidget.myText("Camera", 17, MyColors.whiteColor),
              onTap: () {
                _pickImage(ImageSource.camera);
              },
            ),
          ],
        ),
      ),
      isScrollControlled: true, // This makes the bottom sheet cover full height if needed
    );
  }


void _pickImage(ImageSource source) async {
   
    final picker = ImagePicker();
    final pickedFile = await picker.pickImage(source: source);
    

    if (pickedFile != null) {
      setState(() {
        _selectedImage = File(pickedFile.path);
        List<int> imageBytes=File(pickedFile.path).readAsBytesSync();
        base64File=base64.encode(imageBytes);
        checkFunctionRun=true;
      });
      Get.back();
    }
  }


  ///
  

  

  void _showSpeechDialog(BuildContext context) {
    showDialog(
      context: context,
      builder: (BuildContext context) {
        return StatefulBuilder(
          builder: (context, setState) {
            return Dialog(
                     backgroundColor:MyColors.bgColor,
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(20.0),
              ),
              child: Container(
                padding: EdgeInsets.all(16.0),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.center,
                  mainAxisSize: MainAxisSize.min,
                  children: [
                    SizedBox(height: 16.0),
                    Container(
                                alignment: Alignment.center,
                                margin: EdgeInsets.only(top: 12),
                                padding: EdgeInsets.all(8),
                                child:Text(_text,
                                textAlign: TextAlign.center,
                                style: TextStyle(fontSize: 16.0,fontWeight: FontWeight.bold,color: MyColors.userTextColor),),
                    ),
                    SizedBox(height: 16.0),
                    AvatarGlow(
                                animate: _isListening,
                                glowColor: MyColors.mainColor,
                                child: GestureDetector(
                                  onTap: (){
                                     _listen(setState);
                                  },
                                  child: Container(
                                    margin: EdgeInsets.all(12),
                                    child: CircleAvatar(
                                      radius: 30,
                                      backgroundColor: MyColors.mainColor,
                                      child: Icon(_isListening?Icons.mic:Icons.mic_none,color: MyColors.whiteColor,size: 30,)),
                                  ),
                                ),
                              ),
                    
                  ],
                ),
              ),
            );
          },
        );
      },
    );
  }


   Future<String> _sendMessageToApiWithImage(String message) async {

    setState(() {
      isLoading=true;
    });
    final response = await http.post(
           Uri.parse('https://generativelanguage.googleapis.com/v1beta/models/gemini-1.5-flash:generateContent?key=$apiKey'),
      headers: {
        "Content-Type": "application/json",
      },
      body: json.encode(
        {"contents":[
            {"role": "user",
              "parts":[
                 
                  {"text": message},
                  {
                  "inlineData":{
                    "mimeType":"image/jpeg",
                    "data":base64File
                  
                }
                }
                
              ]
              }]}
      ),
    );
     setState(() {
      isLoading=false;
    });
     
    if (response.statusCode == 200) {
      final responseData = json.decode(response.body);
       var result=responseData["candidates"][0]['content']["parts"][0]["text"].toString();
       return  result;
       
    } else {
      throw Exception('Failed to load response from API');
    }
    
  }


   


  /////
  

  Future<String> _translateMessage(String message, String targetLang) async {
  try {
    final translation = await translator.translate(message, to: targetLang);
    return translation.text;
  } catch (e) {
    print("Translation error: $e");
    return message; // Fallback to original message in case of error
  }
}


  Future<void> _generateImageFromPrompt(String promptValue) async {
    if (promptValue.isEmpty) return;

    setState(() {
      isLoading = true;
      imageData = null;
    });

    try {
      final response = await http.post(
        Uri.parse('$apiHost/v1/generation/$engineId/text-to-image'),
        headers: {
          'Content-Type': 'application/json',
          'Accept': 'image/png',
          'Authorization': 'Bearer $api_Key',
        },
        body: jsonEncode({
          'text_prompts': [
            {
              'text': promptValue,
              'weight': 1,
            },
          ],
          'cfg_scale': 7,
          'height': 1024,
          'width': 1024,
          'samples': 1,
          'steps': 30,
        }),
      );

    
    

      if (response.statusCode == 200) {
        setState(() {
          imageData = response.bodyBytes;
        });
      } else {
        debugPrint('Failed to generate image: ${response.statusCode}');
      }
    } catch (e) {
      debugPrint('Error occurred: $e');
    } finally {
      setState(() {
        isLoading = false;
      });
    }
  }
  

  


  void _sendMessage(String text) async {

  List<String> keywords  = ['image', 'photo', 'generate', 'art', 'picture', 'illustration', 'graphic', 'sketch', 'drawing'];
;
  // Check if any keyword is present in the text
  bool shouldGenerateImage = keywords.any((keyword) => text.toLowerCase().contains(keyword.toLowerCase()));

  
       
      // catch (e) {
      //   print("Translation error: Language not supported: $e");
      //   ScaffoldMessenger.of(context).showSnackBar(
      //     SnackBar(
      //       content: Text('Selected language is not supported.'),
      //     ),
      //   );
      
      //  catch (e) {
      //   print("Translation error: $e");
      //   ScaffoldMessenger.of(context).showSnackBar(
      //     SnackBar(
      //       content: Text('An error occurred during translation.'),
      //     ),
      //   );
      // }


    
    if (text.trim().isEmpty) return;
   
   else if(shouldGenerateImage && checkFunctionRun==false){
      
      String translatedMessage = await _translateMessage(text, selectedLanguage);
      
      setState(() {
          _messages.add(
        {
         'text': translatedMessage, 
        'image': null,
         'isUser': true,
         'dateTime':"${DateTime.now().hour}:${DateTime.now().minute}"
        });
        _controller.clear();
         _selectedImage = null;
       });

       try{
      
        await _generateImageFromPrompt(text);
         
         setState(() {
        _messages.add(
          {
          'text': "", 
          'image': imageData,
          'isUser': false,
          'dateTime':"${DateTime.now().hour}:${DateTime.now().minute}"
            });
      });
    } catch (e) {
      setState(() {
        _messages.add({
        'text': 'Error: $e',
        'image': null,
         'isUser': false,
         'dateTime':"${DateTime.now().hour}:${DateTime.now().minute}"
         });
      });
    }
    await _controller.text.isEmpty?_sendSuggestionMessage(text):_sendSuggestionMessage(_controller.text);
   }

    else{

        String translatedMessage = await _translateMessage(text, selectedLanguage);
  
    setState(() {
      _messages.add(
        {
         'text': translatedMessage, 
        'image': _selectedImage,
         'isUser': true,
         'dateTime':"${DateTime.now().hour}:${DateTime.now().minute}"
        });
         _controller.clear();
         _selectedImage = null;
    });
      

    try {
     

      final botResponse;
      if (checkFunctionRun ){
         botResponse = await _sendMessageToApiWithImage(text.toString());
         setState(() {
           checkFunctionRun=false;
         });
      }
      else{
        botResponse = await _sendMessageToApi(text.toString());
      }
 
       String finalResponse = await _translateMessage(botResponse, selectedLanguage);
  
      setState(() {
        _messages.add(
          {
            'text': finalResponse, 
          'image': null,
          'isUser': false,
         'dateTime':"${DateTime.now().hour}:${DateTime.now().minute}"
            });
      });
    } catch (e) {
      setState(() {
        _messages.add({
        'text': 'Error: $e',
        'image': null,
         'isUser': false,
         'dateTime':"${DateTime.now().hour}:${DateTime.now().minute}"
         });
      });
    }
    
    await _controller.text.isEmpty?_sendSuggestionMessage(text):_sendSuggestionMessage(_controller.text);
    }

  }


 Future<void> translateMessages() async {
    // Translate texts and update the original list
    await Future.wait(_messages.asMap().entries.map((entry) async {
      int index = entry.key;
      String originalText = entry.value['text'] as String;
      
      var translatedText = await translator.translate(originalText, to: selectedLanguage);
      
      setState(() {
        _messages[index]['text'] = translatedText.text;
      });
    }));
  }

Future<void> translateTexts() async {
    // for (int i = 0; i < texts.length; i++) {
    //   var translatedText = await translator.translate(texts[i], to: selectedLanguage);
    //   texts[i] = translatedText.text;
    // }
    //  _messages = _messages.map((item) {
    //   return {"text": item['text'] as String};
    // }).toList();

        List<String> textsToTranslate = [
        textForPromptSuggestion1,
        textForPromptSuggestion2,
        textForPromptSuggestion3
      ];

      // Map to store the translated texts
      Map<int, String> translatedTexts = {};

      // Translate each text
      await Future.wait(textsToTranslate.asMap().entries.map((entry) async {
        int index = entry.key;
        String text = entry.value;
        var translatedText = await translator.translate(text, to: selectedLanguage);
        translatedTexts[index] = translatedText.text;
      }));

      // Update original variables
      textForPromptSuggestion1 = translatedTexts[0]!;
      textForPromptSuggestion2 = translatedTexts[1]!;
      textForPromptSuggestion3 = translatedTexts[2]!;


    //  var translatedText1 = await translator.translate(textForPromptSuggestion1, to: selectedLanguage);
    //  textForPromptSuggestion1 = translatedText1.text;

    //  var translatedText2 = await translator.translate(textForPromptSuggestion2, to: selectedLanguage);
    //  textForPromptSuggestion2 = translatedText2.text;

    //  var translatedText3 = await translator.translate(textForPromptSuggestion3, to: selectedLanguage);
    //  textForPromptSuggestion3 = translatedText3.text;
    setState(() {}); // Refresh the UI with translated texts
  }

///////
  void _sendSuggestionMessage(String message)async{
    
    var promptForSuggestion="""Give me only three short questions from the $message; 
                               do not include any additional lines or explanations.
                                If you don't understand my prompt, provide three main 
                                trending problem questions from around the world.
                                 """;



     final response = await http.post(
      // Uri.parse('https://generativelanguage.googleapis.com/v1/models/gemini-pro:generateContent?key=${apiKey}'),
     Uri.parse('https://generativelanguage.googleapis.com/v1beta/models/gemini-1.5-flash:generateContent?key=$apiKey'),
      headers: {
        "Content-Type": "application/json",
      },
      body: json.encode(
        {"contents":[
            {"role": "user",
              "parts":[ 
                  {"text": promptForSuggestion},    
              ]
              }]}
      ),
    );
     
    if (response.statusCode == 200) {
      final responseData = json.decode(response.body);
       var result=responseData["candidates"][0]['content']["parts"][0]["text"].toString();
       String finalResponse = await _translateMessage(result, selectedLanguage);

       
                // Split the string by newline characters
                List<String> questions = finalResponse.trim().split('\n');

                // Store each question in a separate variable
                String question1 = questions.length > 0 ? questions[0] : '';
                String question2 = questions.length > 1 ? questions[1] : '';
                String question3 = questions.length > 2 ? questions[2] : '';

                String removeNumberPrefix(String text) {
                    // Find the position of the first dot and space
                    int dotIndex = text.indexOf('. ');
                    
                    // Check if the dotIndex is valid
                    if (dotIndex != -1) {
                      // Remove the number and dot by taking the substring starting after the dot and space
                      return text.substring(dotIndex + 2);
                    }
                    return text; // Return the original text if no dot is found
                  }

                  // Apply the function to each variable
                  question1 = removeNumberPrefix(question1);
                  question2 = removeNumberPrefix(question2);
                  question3 = removeNumberPrefix(question3);
                                
              

       setState(() {
         textForPromptSuggestion1=question1;
         textForPromptSuggestion2=question2;
         textForPromptSuggestion3=question3;
       });
       
    } else {
      throw Exception('Failed to load response from API');
    }
  }


/////

  Future<String> _sendMessageToApi(String message) async {

    setState(() {
      isLoading=true;
    });
    final response = await http.post(
      // Uri.parse('https://generativelanguage.googleapis.com/v1/models/gemini-pro:generateContent?key=${apiKey}'),
     Uri.parse('https://generativelanguage.googleapis.com/v1beta/models/gemini-1.5-flash:generateContent?key=$apiKey'),
      headers: {
        "Content-Type": "application/json",
      },
      body: json.encode(
        {"contents":[
            {"role": "user",
              "parts":[ 
                  {"text": message},    
              ]
              }]}
      ),
    );
     setState(() {
      isLoading=false;
    });
     
    if (response.statusCode == 200) {
      final responseData = json.decode(response.body);
       var result=responseData["candidates"][0]['content']["parts"][0]["text"].toString();
       return  result;
       
    } else {
      throw Exception('Failed to load response from API');
    }
    
  }


  

  @override
  Widget build(BuildContext context) {
    Get.put(ThemeController());
    return Scaffold(
      
      backgroundColor: MyColors.bgColor,

      //appbar
      appBar:AppBar(

        actions: selectedMessageIndex != null?  // first if condition
             imageMessageForDownload !=null?         // inside a if else condition
             [
               
                 IconButton(
                  icon: Icon(Icons.download,color: MyColors.whiteColor,),
                  onPressed: _imageDownload,
                ),
                IconButton(
                  icon: Icon(Icons.delete),
                  onPressed: _deleteMessage,
                ),
                IconButton(onPressed: _shareMessage, icon: Icon(Icons.share)), 
              ]:[
               Expanded(
                 child: Row(
                  mainAxisAlignment: MainAxisAlignment.end,
                  children: [
                    IconButton(
                    icon: Icon(Icons.copy,),
                    onPressed: _copyMessage,
                  ),
                  IconButton(
                    icon: Icon(Icons.delete),
                    onPressed: _deleteMessage,
                  ),
                  IconButton(onPressed: _shareMessage, icon: Icon(Icons.share)),
               
                  _isSpeaking?IconButton(
                      icon: Icon(Icons.volume_up),
                      onPressed: () {
                          _stopSpeaking();  
                      },
                    ):IconButton(
                      icon: Icon(Icons.volume_off),
                      onPressed: () {
                          _speak();  
                      },
                    ),                
               
                  ],
                 ),
               )
        
        ] :[
           Container(
          margin: EdgeInsets.only(right: 6),
          child: DropdownButton<String>(
            value: selectedLanguage,
            icon: Icon(Icons.language, color: Colors.white),
            dropdownColor: MyColors.mainColor, // Example color
           
            onChanged: (String? newValue)async {
              if (newValue != null) {
              setState(() {
                selectedLanguage = newValue;
              });
              await translateTexts(); // Re-translate texts when language changes
              await translateMessages();
            }
              
            },
            //  onTap: ()async{
            //     await translator.translate(textForPromptSuggestion1,to:selectedLanguage);
            // },
            items: languageCodes.keys
                .map<DropdownMenuItem<String>>((String key) {
              return DropdownMenuItem<String>(
                value: key,
                child: Text(languageCodes[key]!, style: TextStyle(fontWeight: FontWeight.w600,color: Colors.white)),
              );
            }).toList(),
          ),
        ),
        ],


        //     : [
        //   GetBuilder<ThemeController>(
        //       builder: (controller) => IconButton(
        //           icon: Icon(
        //             controller.isDarkMode ? Icons.light_mode : Icons.dark_mode,
        //           ),
        //           onPressed: () {
        //             controller.toggleDarkMode();
        //           }))
        // ],


        shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.only(
         bottomLeft: Radius.circular(15),bottomRight: Radius.circular(15)
      )),
       leading: Container(
        margin: EdgeInsets.all(5),
        child: Image.asset("assets/images/wappGPTlogo.png"),
       ),
        elevation: 3,
        backgroundColor: MyColors.mainColor,
        title: Column(
          children: [
           Row(
            children: [ myCustomWidget.myText("SmartGenie", 19, MyColors.whiteColor),],
           ),
            Row(
              children: [
                CircleAvatar(
                  radius: 3,
                  backgroundColor: MyColors.appBarCircleColor,
                ),
                SizedBox(width: 5,),
                 myCustomWidget.myText("Online", 14, MyColors.appBarCircleColor),
              ],
            )

          ],
        )
      ),

      body: GestureDetector(
        onTap: () {
        _resetSelection(); // Reset selection when tapping outside a message
      },
        child: Column(
          children: <Widget>[
            Row(
  children: [
    // This Expanded widget centers the time text
    Expanded(
      child: _messages.isNotEmpty
          ? Container(
              margin: EdgeInsets.only(top: 8),
              child: Center(
                child: myCustomWidget.myText(
                  
                  formattedTime,
                  12,
                  MyColors.userTextColor,
                ),
              ),
            )
          : Container(
              margin: EdgeInsets.only(top: 8),
              child: Center(
                child: myCustomWidget.myText(
                  "", // Empty text
                  12,
                  MyColors.userTextColor,
                ),
              ),
            ),
    ),
    // Logout icon which remains at the end regardless of the condition
    InkWell(
      onTap: (){
         _logoutController.logout();
      },
      child: Container(
        margin: EdgeInsets.only(top: 8, right: 8),
        child: CircleAvatar(
          backgroundColor: MyColors.mainColor,
          child: Center(
            child: Icon(
              Icons.logout,
              size: 25,
              color: MyColors.whiteColor,
            ),
          ),
        ),
      ),
    ),
  ],
),

            SizedBox(height: 7,),
            Expanded(
              child: ListView.builder(
                padding: EdgeInsets.all(8.0),
                reverse: true,
                itemCount: _messages.length,
                itemBuilder: (context, index) {
                  bool isSelected = selectedMessageIndex == index;
                   final message = _messages[_messages.length - 1 - index];
      
                  return Container(
                    color: optionPressColor,
                    child: GestureDetector(
                      onLongPress: (){
      
                         _onMessageLongPress(index);
                          
                      },
                      onTap: () {
                        _resetSelection(); // Reset selection when tapping outside a message
                      },
                      child: _buildMessageBubble(message['text'], message['isUser'],isSelected,message['image'],message["dateTime"] ),
                    ),
                  );
                },
              ),
            ),
            isLoading? SpinKitThreeInOut(
              color: MyColors.mainColor,
              size: 25.0,
            ):Container(),
            _buildTextComposer(),
            
          ],
        ),
      ),
    );
  }

  Widget _buildMessageBubble(String myText, bool isUser,bool isSelected,dynamic image,dynamic dateTime) {
    final alignment = isUser ? CrossAxisAlignment.end : CrossAxisAlignment.start;
    final color = isUser ? Color(0xffDEE2E6) :Color(0xff5A189A);
    final textColor = isUser ? Color(0xff444444) : Color(0xffFFFFFF);

    final selectedColor= isSelected ?Color.fromARGB(255, 156, 88, 224): MyColors.bgColor;
    String text = myText.replaceAll(RegExp(r'\*\*'), '');
 
    // final isCurrentUser = isSelected;
    final isImageMessage = image != null && isUser==true;
    final isImageGenerationMessage = image != null && isUser==false;

     return Container(
      padding: EdgeInsets.all(5),
      decoration: BoxDecoration(
        color: selectedColor,
        borderRadius: BorderRadius.circular(5)
      ),
      // margin: const EdgeInsets.symmetric(vertical: 10.0),
       child: Column(
        crossAxisAlignment: alignment,
        children: [

           // 0
           if(isImageMessage)
              InkWell(
                onTap: (){
                  Get.to(FullScreenImage(imageData: image,));
                },
                child: Container(
                   margin: const EdgeInsets.symmetric(vertical: 3.0, horizontal: 0.0),
                    padding: const EdgeInsets.all(10.0),
                    decoration: BoxDecoration(
                      color: color,
                      borderRadius: BorderRadius.circular(10.0),
                    ),
                  child: Column(
                    children: [
                      Container(
                    margin: EdgeInsets.only(bottom: 0.0),
                    child: Image.file(
                      image,
                      width: 230.0,
                      height: 250.0,
                      fit: BoxFit.fill,
                    ),
                  ),
                          
                    ],
                  ),
                ),
              ),

          //1
          isImageGenerationMessage? InkWell(
            onTap: (){
              Get.to(FullScreenImage(imageData: image));
            },
            child: Align(
                        alignment: Alignment.centerLeft,
                        child: Container(
                          padding: EdgeInsets.all(10),
                          margin: EdgeInsets.symmetric(vertical: 5),
                          decoration: BoxDecoration(
                            color: MyColors.mainColor,
                            borderRadius: BorderRadius.circular(10),
                          ),
                          child: Image.memory(image,
                          width: 230.0,
                         height: 250.0,
                         fit: BoxFit.fill,
                          ),
                        ),
                      ),
          ):
           Align(
            alignment: isUser?Alignment.topRight:Alignment.topLeft ,
            child: Container(
              // width: 230.0,
              // height: 250.0,
              // mainAxisAlignment: isUser?MainAxisAlignment.end :MainAxisAlignment.start,
              // margin: const EdgeInsets.symmetric(vertical: 10.0),
              padding: const EdgeInsets.symmetric(horizontal: 14.0, vertical: 10.0),
              margin: isUser? EdgeInsets.only(left:45):EdgeInsets.only(right: 45,),
               
              // padding: isUser?EdgeInsets.only(top:12,right: 4,bottom: 12,left: 12 ) :EdgeInsets.only(top:12,right: 12,bottom: 12,left: 12),
              decoration: BoxDecoration(
                color: color,
                borderRadius: BorderRadius.only(
                  topLeft: Radius.circular(16),
                  topRight: Radius.circular(16),
                  bottomLeft: isUser ? Radius.circular(16) : Radius.circular(0),
                  bottomRight: isUser ? Radius.circular(0) : Radius.circular(16),
                ),
              ),
              child: Text(
                text,
                style: TextStyle(
                  color: textColor,
                  fontSize: 16,
                ),
              ),
            ),
          ),
          //2
           Row(
              mainAxisAlignment: isUser?MainAxisAlignment.end :MainAxisAlignment.start,
              children: [
                Container(
                  child: isUser?Text(
                  dateTime,
                  style: TextStyle(
                  color: Colors.black,
                  fontSize: 8,
                  fontWeight: FontWeight.bold
                  ),
                ):CircleAvatar(
                    radius: 18,
                    backgroundColor:color,
                  child: Image.asset("assets/images/wappGPTlogo.png",scale: 2.4,))
                ),
                SizedBox(width: 4,),
                
                isUser?CircleAvatar(
                    radius: 18,
                    backgroundColor:MyColors.mainColor,
                  child: Icon(Icons.person,size: 20,color: MyColors.whiteColor,)):
                Text(
                dateTime,
                style: TextStyle(
                  color: Colors.black,
                  fontSize: 8,
                  fontWeight: FontWeight.bold
                ),
                )
              ],
          ),
        ],
         ),
     );




    // return Column(
    //   crossAxisAlignment: alignment,
    //   children: <Widget>[
    //     Container(
    //       margin: const EdgeInsets.symmetric(vertical: 10.0),
    //       padding: const EdgeInsets.symmetric(horizontal: 14.0, vertical: 10.0),
    //       decoration: BoxDecoration(
    //         color: color,
    //         borderRadius: BorderRadius.circular(15.0),
    //       ),
    //       child: Text(
    //         text,
    //         style: TextStyle(
    //           fontSize: 15,
    //           color: textColor),
    //       ),
    //     ),
    //   ],
    // );
  }

  Widget _buildTextComposer() {
    return Container(
      //  color: MyColors.bgColor,
      child: Column(
        children: [
          //////
          // 1. for selected image
          if (_selectedImage != null)
            Container(
              margin: EdgeInsets.only(left: 8,right: 8,top: 8),
              height: 100,
              width: double.infinity,
              decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(20),
                ),
              child: Stack(
                children: [
                 ClipRRect(
                borderRadius: BorderRadius.circular(20), // Adjust the radius as needed
                child: Image.file(
                  _selectedImage!,
                  fit: BoxFit.cover,
                  width: double.infinity,
                  height: 150,
                ),
              ),
                  Container(
                    width: double.infinity,
                    height: 150,
                    decoration: BoxDecoration(
                      color: Colors.black.withOpacity(0.4), // Light overlay
                  // color: MyColors.userTextbgColor,
                  borderRadius: BorderRadius.circular(20),
                ),
                  ),
                  Positioned(
                    top: 5,
                    right: 5,
                    child: IconButton(
                      icon: Icon(Icons.close, color: Colors.white),
                      onPressed: () {
                        setState(() {
                          _selectedImage = null;
                          checkFunctionRun=false;
                          selectedMessageIndex=null;
                        });
                      },
                    ),
                  ),
                ],
              ),
            ),

            // for prompt suggestion
            if(_selectedImage==null)
            SingleChildScrollView(
              scrollDirection: Axis.horizontal,
              child: Row(
                
                children: [
                    if(textForPromptSuggestion1!="" || textForPromptSuggestion2!="" || textForPromptSuggestion3!="" )
                    InkWell(
                      onTap: (){
                        _sendMessage(textForPromptSuggestion1);
                      },
                      child: Container(
                        padding: EdgeInsets.all(8),
                        margin: EdgeInsets.only(left: 8,right: 5),
                        decoration: BoxDecoration(
                                      
                                      borderRadius: BorderRadius.circular(8),
                                      border: Border.all(
                      width: 1.5,
                      color: MyColors.userTextbgColor
                                      )
                                    ),
                                     child: Text(textForPromptSuggestion1,style: TextStyle(fontSize: 14,color: MyColors.userTextColor,fontWeight: FontWeight.w600),),
                                      ),
                    ),
                    if(textForPromptSuggestion1!="" || textForPromptSuggestion2!="" || textForPromptSuggestion3!="" )
                    InkWell(
                      onTap: (){
                         _sendMessage(textForPromptSuggestion2);
                      },
                      child: Container(
                          padding: EdgeInsets.all(8),
                        margin: EdgeInsets.only(left: 8,right: 5),
                        decoration: BoxDecoration(
                                      
                                      borderRadius: BorderRadius.circular(8),
                                      border: Border.all(
                      width: 1.5,
                      color: MyColors.userTextbgColor
                                      )
                                    ),
                        child: Text(textForPromptSuggestion2,style: TextStyle(fontSize: 14,color: MyColors.userTextColor,fontWeight: FontWeight.w600),),
                      ),
                    ),
                     if(textForPromptSuggestion1!="" || textForPromptSuggestion2!="" || textForPromptSuggestion3!="" )
                    InkWell(
                      onTap: (){
                         _sendMessage(textForPromptSuggestion3);
                      },
                      child: Container(
                          padding: EdgeInsets.all(8),
                        margin: EdgeInsets.only(left: 8,right: 8),
                        decoration: BoxDecoration(
                                      
                                      borderRadius: BorderRadius.circular(8),
                                      border: Border.all(
                      width: 1.5,
                      color: MyColors.userTextbgColor
                                      )
                                    ),
                        child: Text(textForPromptSuggestion3,style: TextStyle(fontSize: 14,color: MyColors.userTextColor,fontWeight: FontWeight.w600),),
                      ),
                    )
                ],
              ),
            ),
         /////////
         
         // 2. for send message
          AvatarGlow(
            glowBorderRadius: BorderRadius.circular(20),
            glowShape: BoxShape.rectangle,
            animate: true,
            glowColor: MyColors.userTextbgColor,
            child: Container(
              // margin: const EdgeInsets.symmetric(horizontal: 8.0),
               margin: EdgeInsets.only(left: 12,right: 12,bottom: 5,top: 4.0),
               padding: EdgeInsets.only(left: 12,right: 12,top: 5,bottom: 5),
                decoration: BoxDecoration(
                  color: MyColors.userTextbgColor,
                  borderRadius: BorderRadius.circular(16),
                  border: Border.all(
                    width: 1,
                    color: MyColors.userTextbgColor
                  )
                ),
              child: Row(
          children: <Widget>[
          //  InkWell(
          //     onTap: (){
          //       // _sendMessage(_controller.text);
          //     },
          //     child:Container(
          //       margin: EdgeInsets.only(right: 4),
          //              padding: EdgeInsets.all(4),
          //             child:CircleAvatar(
          //               backgroundColor: MyColors.mainColor,
          //               child:Icon(Icons.image_outlined,size: 20,color: MyColors.whiteColor,))
          //           ),
          //   ),
            Flexible(
              child: TextField(
                onChanged: (value){
                  setState(() {
                    
                  });
                },
                  
                  cursorColor: MyColors.userTextColor,
                  controller: _controller,
                  onSubmitted: _sendMessage,
                  style: TextStyle(fontSize: 15,fontWeight: FontWeight.bold,color: MyColors.userTextColor),
                  decoration: InputDecoration.collapsed(
                    hintText: 'Type Your message here....'),
                ),
            ),
             InkWell(
              onTap: (){
                // Get.to(MyImageAnalysis());
               openBottomSheet();
              },
              child:Container(
                margin: EdgeInsets.only(right: 4,left:2 ),
                       padding: EdgeInsets.all(4),
                      child:CircleAvatar(
                        backgroundColor: MyColors.mainColor,
                        child:Icon(Icons.image_outlined,size: 20,color: MyColors.whiteColor,))
                    ),
            ),
            _controller.text.isEmpty? InkWell(
              onTap: () { 
                // myVoiceDialogBox(context);
                 setState(() {
                  _text = "Tap the microphone and start speaking";    
                  });
                 _showSpeechDialog(context);
       
              },
              child: Container(
                padding: EdgeInsets.all(2),
                child:CircleAvatar(
                  backgroundColor: MyColors.mainColor,
                  child: Icon(Icons.mic_none_outlined,color: MyColors.whiteColor,))
                 
              ),
                  
            ): InkWell(
              onTap: (){
                _sendMessage(_controller.text);
              },
              child:Container(
                       padding: EdgeInsets.all(4),
                      child:CircleAvatar(
                        backgroundColor: MyColors.mainColor,
                        child:Icon(Icons.send_sharp,size: 20,color: MyColors.whiteColor,))
                    ),
            ),
          ],
              ),
            ),
          )
        ],
      ),
    );
  }
}

