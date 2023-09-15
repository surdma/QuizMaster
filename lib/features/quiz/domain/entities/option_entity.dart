import 'dart:convert';

List<OptionEntity> optionsFromJson(str) =>
    List<OptionEntity>.from(jsonDecode(str)
        .map((jsonData) => OptionEntity.fromJson(optionText: jsonData)));
String optionsToJson(List<OptionEntity> data) =>
    jsonEncode(List<OptionEntity>.from(data.map((e) => e.toJson())));

class OptionEntity {
  final String title;

  const OptionEntity({required this.title});

  factory OptionEntity.fromJson({required String optionText}) {
    return OptionEntity(
      title: optionText,
    );
  }

  OptionEntity toJson() => OptionEntity(title: title);
}
