import 'dart:convert';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
        debugShowCheckedModeBanner: false,
        theme: ThemeData(
          primarySwatch: Colors.grey,
        ),
        home: const Base64());
  }
}

class Base64 extends StatefulWidget {
  const Base64({Key? key}) : super(key: key);

  @override
  _Base64State createState() => _Base64State();
}

class _Base64State extends State<Base64> {
  TextEditingController textController = TextEditingController();
  bool isEncode = true;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        mainAxisAlignment: MainAxisAlignment.start,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          const SizedBox(
            height: 10,
          ),
          const Padding(
            padding: EdgeInsets.all(8.0),
            child: Text("Base64"),
          ),
          Container(
            height: 25,
            width: MediaQuery.of(context).size.width * 0.38,
            decoration: BoxDecoration(
                color: Colors.grey[600],
                borderRadius: BorderRadius.circular(15)),
            child: Row(
              children: [
                GestureDetector(
                  onTap: () {
                    if (isEncode == false) {
                      setState(() {
                        isEncode = !isEncode;
                        textController.clear();
                      });
                    }
                  },
                  child: Container(
                    height: 25,
                    width: MediaQuery.of(context).size.width * (0.38 / 2),
                    decoration: BoxDecoration(
                        color:
                            isEncode == true ? Colors.black : Colors.grey[600],
                        borderRadius: BorderRadius.circular(15)),
                    child: const Center(
                        child: Text(
                      "encode",
                      style:
                          TextStyle(color: Color.fromARGB(255, 225, 225, 225)),
                    )),
                  ),
                ),
                GestureDetector(
                  onTap: () {
                    if (isEncode == true) {
                      setState(() {
                        isEncode = !isEncode;
                        textController.clear();
                      });
                    }
                  },
                  child: Container(
                    height: 25,
                    width: MediaQuery.of(context).size.width * (0.38 / 2),
                    decoration: BoxDecoration(
                        color:
                            isEncode == true ? Colors.grey[600] : Colors.black,
                        borderRadius: BorderRadius.circular(15)),
                    child: const Center(
                        child: Text(
                      style:
                          TextStyle(color: Color.fromARGB(255, 225, 225, 225)),
                      "decode",
                    )),
                  ),
                ),
              ],
            ),
          ),
          const SizedBox(
            height: 10,
          ),
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 13),
            child: Container(
              padding: const EdgeInsets.symmetric(horizontal: 5),
              decoration: BoxDecoration(
                border:
                    Border.all(color: Colors.black, style: BorderStyle.solid),
                borderRadius: BorderRadius.circular(30),
              ),
              child: ListTile(
                trailing: GestureDetector(
                  onTap: () {
                    onTap(textController.text);
                  },
                  child: Container(
                    height: 40,
                    width: 80,
                    decoration: BoxDecoration(
                        color: Colors.black,
                        borderRadius: BorderRadius.circular(30)),
                    child: Center(
                        child: Text(
                      isEncode == true ? "Encode" : "Decode",
                      style: const TextStyle(color: Colors.white),
                    )),
                  ),
                ),
                title: TextField(
                  controller: textController,
                  onChanged: (e) {},
                  decoration: const InputDecoration(
                      hintText: "Enter or Paste here ",
                      alignLabelWithHint: true,
                      border: InputBorder.none,
                      hintStyle: TextStyle()),
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }

  base64Encoder(String str) {
    const base64 = Base64Codec();
    List<int> bytes = utf8.encode(str.toString());
    return base64.encode(bytes);
  }

  base64Decoder(String str) {
    const base64 = Base64Codec();
    Uint8List decode = base64.decode(str.toString());
    return utf8.decode(decode);
  }

  onTap(String str) async {
    FocusScope.of(context).unfocus();
    String text = "";
    if (isEncode == true) {
      setState(() {
        text = base64Encoder(textController.text);
      });
    } else {
      setState(() {
        text = base64Decoder(textController.text);
      });
    }
    Clipboard.setData(ClipboardData(text: text));
    ScaffoldMessenger.of(context).showSnackBar(const SnackBar(
      content: Text("text copied to clipboard"),
      duration: Duration(seconds: 1),
    ));
  }
}
