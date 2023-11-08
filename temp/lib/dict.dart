class Dict {
  final String title, description;

  Dict.fromJson(Map<String, dynamic> json)
      : title = (json['title'].replaceAll('</b>', '')).replaceAll('<b>', ''),
        description =
            (json['description'].replaceAll('</b>', '')).replaceAll('<b>', '');
}
