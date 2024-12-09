import 'dart:io';
import 'dart:typed_data';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:pdfx/pdfx.dart';
import 'package:http/http.dart' as http;
import 'package:share_plus/share_plus.dart';
import '../controllers/quiz_controller.dart';
import '../models/quiz_model.dart';
import 'package:path_provider/path_provider.dart';

class FetchQuiz extends StatefulWidget {
  final Map data;
  final String type;

  const FetchQuiz({Key? key, required this.data, required this.type})
      : super(key: key);

  @override
  State<FetchQuiz> createState() => _FetchQuizState();
}

class _FetchQuizState extends State<FetchQuiz> {
  final QuizController quizController = Get.put(QuizController());
  PdfControllerPinch? pdfController;
  Uint8List? pdfData;

  @override
  void initState() {
    super.initState();
    quizController.fetchQuizzes(
      classe: widget.data["classe"],
      type: widget.type,
    );
  }

  Future<void> loadPdf(String url) async {
    try {
      final response = await http.get(Uri.parse(url));
      if (response.statusCode == 200) {
        pdfData = response.bodyBytes;
        pdfController = PdfControllerPinch(
          document: PdfDocument.openData(pdfData!),
        );
        setState(() {});
      } else {
        throw Exception('Erreur de chargement du PDF');
      }
    } catch (e) {
      print('Erreur lors du chargement du PDF : $e');
    }
  }

  // Fonction pour partager le PDF
  Future<void> sharePdf() async {
    if (pdfData == null) {
      print("Aucun fichier PDF à partager.");
      return;
    }

    try {
      // Créer un fichier temporaire pour le partage
      final tempDir = await getTemporaryDirectory();
      final filePath = '${tempDir.path}/quiz_${widget.type}.pdf';
      final file = File(filePath);
      await file.writeAsBytes(pdfData!);

      // Partager le fichier
      await Share.shareXFiles(
        [XFile(filePath)],
        text: 'Quiz ${widget.type}',
      );
    } catch (e) {
      print("Erreur lors du partage du PDF : $e");
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('QUIZ ${widget.type}'),
        actions: [
          IconButton(
            icon: const Icon(Icons.share),
            onPressed: sharePdf,
          ),
        ],
      ),
      body: Obx(() {
        if (quizController.isLoading.value) {
          return const Center(child: CircularProgressIndicator());
        } else if (quizController.quizzes.isEmpty) {
          return const Center(child: Text('Aucun quiz trouvé'));
        } else {
          QuizModel quiz = quizController.quizzes.first;

          if (pdfController == null) {
            loadPdf("https://malia-pay.com/coccinellepay/dashboard/${quiz.file}");
            return const Center(child: CircularProgressIndicator());
          }

          return PdfViewPinch(
            controller: pdfController!,
            scrollDirection: Axis.vertical,
          );
        }
      }),
    );
  }

  @override
  void dispose() {
    pdfController?.dispose();
    super.dispose();
  }
}
