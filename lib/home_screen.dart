import 'package:flutter/material.dart';
import 'package:semantics_analyzer/sentiments.dart';
import 'package:semantics_analyzer/theme.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  final TextEditingController _textController = TextEditingController();
  String result = '';
  bool checkedOnce = false;

  @override
  void initState() {
    super.initState();
  }
  @override
  Widget build(BuildContext context) {

    Size size = MediaQuery.of(context).size;

    return Scaffold(
      body: Center(
        child: Container(
          width: size.width/2,
          margin: const EdgeInsets.all(50),
          decoration: BoxDecoration(
              border: Border.all(color: MyTheme.darkPurpleColor),
              borderRadius: BorderRadius.circular(10)
          ),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              Text("GenZPeak",style: TextStyle(fontSize:50,color: MyTheme.indigoColor ),),
              const SizedBox(height:30),
              Text("From Lit to Legit, We've Got You",style: TextStyle(fontSize:20,color:  MyTheme.lightIndigoColor),),
              Container(
                width: 300,
                padding: const EdgeInsets.all(10),
                decoration: BoxDecoration(
                  border: Border.all(color: MyTheme.lightIndigoColor,width: 5),
                  borderRadius: BorderRadius.circular(10)
                ),
                child: TextField(
                  controller: _textController,
                  decoration: const InputDecoration(hintText: 'Drop a slang',border: InputBorder.none),

                ),
              ),
              const SizedBox(height:30),
              ElevatedButton(
                onPressed: fetchResults,
                style: ElevatedButton.styleFrom(
                  shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(10))
                ),
                child: const Text('Lessgo'),
              ),
              const SizedBox(height: 20),
          !checkedOnce?Container():
          buildSentimentResults(_textController.text),
            ],
          ),
        ),
      ),
    );
  }
  fetchResults() async{
      checkedOnce = true;
      setState(() {});
  }
}


