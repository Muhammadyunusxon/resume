import 'dart:convert';
import 'package:http/http.dart' as http;
import '../model/send_mail_model.dart';

abstract class MainRepository {
  MainRepository._();

  static sendGmail({required SendSimpleModel model}) async {
    try {
      Uri url = Uri.parse("https://rapidprod-sendgrid-v1.p.rapidapi.com/mail/send");
      final res = await http.post(url,
          headers: {
            'content-type': 'application/json',
            'X-RapidAPI-Key': 'bb1a6b8214mshb07418bf004d615p17e440jsn212b284977ff',
            'X-RapidAPI-Host': 'rapidprod-sendgrid-v1.p.rapidapi.com'
          },
          body: jsonEncode(model.toJson()));
      print(res.body);
      print(res.statusCode);
      return res.statusCode;
    } catch (e) {
      print(e);
    }
  }

}