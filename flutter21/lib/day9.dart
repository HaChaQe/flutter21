// ignore_for_file: avoid_print, unused_local_variable

import 'package:http/http.dart' as http;
import 'dart:convert';

void main() async {
  // try {
  //   final url = Uri.parse("https://jsonplaceholder.typicode.com/posts");

  //   final response = await http.post(
  //     url,
  //     headers: {"Content-Type": "application/json; charset=UTF-8"},
  //     body: jsonEncode({
  //       "title": "Holy Diver",
  //       "body": "Dio'nun 1983 tarihli efsanevi albümü",
  //       "userId": 1,
  //     }),
  //   );

  //   if (response.statusCode == 201) {
      
  //     final data = jsonDecode(response.body);
  //     print("Gönderi oluşturuldu \nYeni ID: ${data["id"]}");

  //   } else if (response.statusCode == 404) {
      
  //     print("Gönderi bulunamadı!");
    
  //   } else {
      
  //     print("Http hatası: ${response.statusCode} ");
    
  //   }
  // } catch (e) {
    
  //   print("İstek hatası: $e");
  
  // }

  try {
    final url = Uri.parse("https://jsonplaceholder.typicode.com/posts/1");

    final response = await http.post(
      url,
      headers: {"Content-Type": "application/json; charset=UTF-8"},
      body: jsonEncode({
        "title": "Holy Diver",
        "body": "Dio'nun 1983 tarihli efsanevi albümü",
        "userId": 1,
      }),
    );

    final update = await http.patch(
      url,
      headers: {"Content-Type": "application/json; charset=UTF-8"},
      body: jsonEncode(
        {
          "title": "Rainbow Rising"
        }
      ),
    );

    if (update.statusCode == 200) {
      
      final data = jsonDecode(update.body);
      print("Gönderi oluşturuldu \nYeni İsim: ${data["title"]}");

    } else if (update.statusCode == 404) {
      
      print("Gönderi bulunamadı!");
    
    } else {
      
      print("Http hatası: ${update.statusCode} ");
    
    }
  } catch (e) {
    
    print("İstek hatası: $e");
  
  }

}
