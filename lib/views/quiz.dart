import 'package:auto_size_text/auto_size_text.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:get/get.dart';
import 'package:intl/intl.dart';

import 'Services/mode_paiement.dart';
import 'fetch_quiz.dart';

class Quiz extends StatefulWidget {
  Map data;
  Quiz({Key? key, required this.data}) : super(key: key);

  @override
  State<Quiz> createState() => _QuizState();
}

class _QuizState extends State<Quiz> {
  final formatter = NumberFormat.currency(locale: 'fr_XOF', symbol: 'XOF');

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        floatingActionButtonLocation: FloatingActionButtonLocation.centerFloat,
        appBar: AppBar(
          title: const AutoSizeText(
            "QUIZ",
            maxFontSize: 15,
            minFontSize: 14,
            maxLines: 1,
            overflow: TextOverflow.ellipsis,
          ),
          centerTitle: true,
          // backgroundColor: Couleurs.CouleurSecondaire,
        ),
        body: SingleChildScrollView(
          child: Column(
            children: [
              Card(
                child: ListTile(
                  leading: const CircleAvatar(
                      child: Icon(
                    Icons.book,
                    color: Colors.white,
                  )),
                  title: const Padding(
                    padding: EdgeInsets.symmetric(vertical: 15.0),
                    child: Text(
                      "ECRITURE",
                      style: TextStyle(fontWeight: FontWeight.bold),
                    ),
                  ),
                  onTap: () {
                    Get.to(
                        () => FetchQuiz(data: widget.data, type: "ECRITURE"));
                  },
                  trailing: const Icon(Icons.navigate_next),
                ),
              ),
              const SizedBox(
                height: 10,
              ),
              Card(
                child: ListTile(
                  leading: const CircleAvatar(
                      child: Icon(
                    Icons.book,
                    color: Colors.white,
                  )),
                  title: const Padding(
                    padding: EdgeInsets.symmetric(vertical: 15.0),
                    child: Text(
                      "GRAMMAIRE",
                      style: TextStyle(fontWeight: FontWeight.bold),
                    ),
                  ),
                  onTap: () {
                    Get.to(
                        () => FetchQuiz(data: widget.data, type: "GRAMMAIRE"));
                  },
                  trailing: const Icon(Icons.navigate_next),
                ),
              ),
              const SizedBox(
                height: 10,
              ),
              Card(
                child: ListTile(
                  leading: const CircleAvatar(
                      child: Icon(
                    Icons.book,
                    color: Colors.white,
                  )),
                  title: const Padding(
                    padding: EdgeInsets.symmetric(vertical: 15.0),
                    child: Text(
                      "LECTURE",
                      style: TextStyle(fontWeight: FontWeight.bold),
                    ),
                  ),
                  onTap: () {
                    Get.to(() => FetchQuiz(data: widget.data, type: "LECTURE"));
                  },
                  trailing: const Icon(Icons.navigate_next),
                ),
              ),
              const SizedBox(
                height: 10,
              ),
              Card(
                child: ListTile(
                  leading: const CircleAvatar(
                      child: Icon(
                    Icons.book,
                    color: Colors.white,
                    //
                  )),
                  title: const Padding(
                    padding: EdgeInsets.symmetric(vertical: 15.0),
                    child: Text(
                      "ORTHOGRAPHE",
                      style: TextStyle(fontWeight: FontWeight.bold),
                    ),
                  ),
                  onTap: () {
                    Get.to(() =>
                        FetchQuiz(data: widget.data, type: "ORTHOGRAPHE"));
                  },
                  trailing: const Icon(Icons.navigate_next),
                ),
              ),
              const SizedBox(
                height: 10,
              ),
              Card(
                child: ListTile(
                  leading: const CircleAvatar(
                      child: Icon(
                    Icons.book,
                    color: Colors.white,
                  )),
                  title: const Padding(
                    padding: EdgeInsets.symmetric(vertical: 15.0),
                    child: Text(
                      "CALCUL",
                      style: TextStyle(fontWeight: FontWeight.bold),
                    ),
                  ),
                  onTap: () {
                    Get.to(() => FetchQuiz(data: widget.data, type: "CALCUL"));
                  },
                  trailing: const Icon(Icons.navigate_next),
                ),
              ),
              const SizedBox(
                height: 10,
              ),
              Card(
                child: ListTile(
                  leading: const CircleAvatar(
                      child: Icon(
                    Icons.book,
                    color: Colors.white,
                  )),
                  title: const Padding(
                    padding: EdgeInsets.symmetric(vertical: 15.0),
                    child: Text(
                      "GEOGRAPHIE",
                      style: TextStyle(fontWeight: FontWeight.bold),
                    ),
                  ),
                  onTap: () {
                    Get.to(
                        () => FetchQuiz(data: widget.data, type: "GEOGRAPHIE"));
                  },
                  trailing: const Icon(Icons.navigate_next),
                ),
              ),
              const SizedBox(
                height: 10,
              ),
              Card(
                child: ListTile(
                  leading: const CircleAvatar(
                      child: Icon(
                    Icons.book,
                    color: Colors.white,
                  )),
                  title: const Padding(
                    padding: EdgeInsets.symmetric(vertical: 15.0),
                    child: Text(
                      "NUMEROTATION",
                      style: TextStyle(fontWeight: FontWeight.bold),
                    ),
                  ),
                  onTap: () {
                    Get.to(() =>
                        FetchQuiz(data: widget.data, type: "NUMEROTATION"));
                  },
                  trailing: const Icon(Icons.navigate_next),
                ),
              ),
            ],
          ),
        ));
  }
}

class _SpaceFormatter extends TextInputFormatter {
  @override
  TextEditingValue formatEditUpdate(
      TextEditingValue oldValue, TextEditingValue newValue) {
    String newText = '';
    int count = 0;
    for (int i = newValue.text.length - 1; i >= 0; i--) {
      count++;
      newText = newValue.text[i] + newText;
      if (count % 3 == 0 && i > 0) {
        newText = ' $newText';
      }
    }
    return newValue.copyWith(
      text: newText,
      selection: TextSelection.collapsed(offset: newText.length),
      composing: TextRange.empty,
    );
  }
}
