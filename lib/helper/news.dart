import 'dart:convert';

import 'package:newsfeedapp/models/article_model.dart';
import 'package:http/http.dart' as http;

class News{

List<ArticleModel> news = [];

Future<void> getNews() async{

  String url = "http://newsapi.org/v2/top-headlines?country=in&category=business&apiKey=90dc260a58e04c168c46097f447dac4c";


  var response = await http.get(url);


  var jsonData = jsonDecode(response.body);

//  if(jsonData['status'] == "ok")print(jsonData);

  if(jsonData['status'] == "ok"){
    jsonData["articles"].forEach((element){

//      print(element['description']);

      if(element["urlToImage"] != null && element['description'] != null)
        {

            ArticleModel articleModel = ArticleModel(
              title: element['title'],
              author: element['author'],
              desc: element['description'],
              url: element['url'],
              urlToImage: element["urlToImage"],
              content: element["context"]
            );

            news.add(articleModel);
        }
        }
    );
  }
}

}


class CategoryNewsClass{

  List<ArticleModel> news = [];

  Future<void> getNews(String category) async{

    String url = "http://newsapi.org/v2/top-headlines?country=in&category=$category&apiKey=90dc260a58e04c168c46097f447dac4c";


    var response = await http.get(url);


    var jsonData = jsonDecode(response.body);

//  if(jsonData['status'] == "ok")print(jsonData);

    if(jsonData['status'] == "ok"){
      jsonData["articles"].forEach((element){

//      print(element['description']);

        if(element["urlToImage"] != null && element['description'] != null)
        {

          ArticleModel articleModel = ArticleModel(
              title: element['title'],
              author: element['author'],
              desc: element['description'],
              url: element['url'],
              urlToImage: element["urlToImage"],
              content: element["context"]
          );

          news.add(articleModel);
        }
      }
      );
    }
  }

}