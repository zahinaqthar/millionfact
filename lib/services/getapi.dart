import 'dart:convert';

import 'package:testtextflutter/services/reqapi.dart';
import 'package:http/http.dart';

class ApiService {
  final endpointUrl =
      'https://newsapi.org/v2/top-headlines?sources=techcrunch&apiKey=2aa40c40b4954def960b4298d072b29e';

  Future<List<Artcicle>> getArticle() async {
    Response response = await get(Uri.parse(endpointUrl));

    if (response.statusCode == 200) {
      Map<String, dynamic> json = jsonDecode(response.body);

      List<dynamic> body = json['articles'];

      List<Artcicle> articles =
          body.map((dynamic item) => Artcicle.fromJson(item)).toList();
      return articles;
    } else {
      throw ("Can't get article");
    }
  }
}
