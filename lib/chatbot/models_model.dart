 class ModelsModel {
  final String id;
  final String name;

  ModelsModel({
    required this.id,
    required this.name,
  });

  // Fixed: Added parameter list (Map<String, dynamic> json)
  factory ModelsModel.fromJson(Map<String, dynamic> json) => ModelsModel(
        id: json["id"] ?? '',
        name: json["name"] ?? '',
      );

  // Static method with explicit empty parameter list ()
  static List<ModelsModel> get defaultModels => [
        ModelsModel(id: "gemini-1.5-flash", name: "Gemini 1.5 Flash"),
        ModelsModel(id: "gemini-1.5-pro", name: "Gemini 1.5 Pro"),
      ];
}