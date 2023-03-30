
class SendSimpleModel {
  final String email;
  final String subject;
  final String desc;
  final String name;

  SendSimpleModel(
      {required this.email,
      required this.subject,
      required this.desc,
      required this.name});

  Map toJson() {
    return
      {
        "personalizations": [
          {
            "to": [
              {
                "email": "muhammadyunusxonabdumannopov9@gmail.com"
              }
            ],
            "subject": "$subject"
          }
        ],
        "from": {
          "email": "$email)"
        },
        "content": [
          {
            "type": "text/plain",
            "value": "Ismi: $name : Xabar:$desc"
          }
        ]
      };
  }
}
