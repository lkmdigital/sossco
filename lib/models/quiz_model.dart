class QuizModel {
  final int id;
  final String type;
  final String file;
  final int status;
  final DateTime date;

  QuizModel({
    required this.id,
    required this.type,
    required this.file,
    required this.status,
    required this.date,
  });

  // Méthode pour convertir un objet JSON en `QuizModel`
  factory QuizModel.fromJson(Map<String, dynamic> json) {
    return QuizModel(
      id: int.parse(json['id']),
      type: json['type'],
      file: json['file'],
      status: int.parse(json['status']),
      date: DateTime.parse(json['date']),
    );
  }

  // Méthode pour convertir un `QuizModel` en JSON
  Map<String, dynamic> toJson() {
    return {
      'id': id,
      'type': type,
      'file': file,
      'status': status,
      'date': date.toIso8601String(),
    };
  }
}
