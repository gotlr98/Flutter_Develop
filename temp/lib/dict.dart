class Dict {
  final String title, description;

  Dict.fromJson(Map<String, dynamic> json)
      : title = json['title'],
        description = json['description'];
}
