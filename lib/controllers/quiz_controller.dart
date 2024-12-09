import 'dart:convert';
import 'package:get/get.dart';
import 'package:http/http.dart' as http;
import '../models/quiz_model.dart';

class QuizController extends GetxController {
  var quizzes = <QuizModel>[].obs;
  var isLoading = true.obs;

  final String apiUrl = 'https://malia-pay.com/coccinellepay/dashboard/get_quiz';

  // Méthode pour récupérer les quiz selon les paramètres passés
  Future<void> fetchQuizzes({required String classe, required String type}) async {
    try {
      isLoading(true);
      final response = await http.post(
        Uri.parse(apiUrl),
        headers: {'Content-Type': 'application/json'},
        body: jsonEncode({'classe': classe, 'type': type}),
      );

      if (response.statusCode == 200) {
        var jsonResponse = json.decode(response.body);
        if (jsonResponse['status'] == 'success') {
          List<dynamic> quizData = jsonResponse['data'];
          quizzes.value = quizData.map((quiz) => QuizModel.fromJson(quiz)).toList();
        } else {
          print("Échec de récupération des quiz : ${jsonResponse['message']}");
        }
      } else {
        print("Erreur : Statut de réponse ${response.statusCode}");
      }
    } catch (e) {
      print("Erreur lors de la récupération des données : $e");
    } finally {
      isLoading(false);
    }
  }
}
