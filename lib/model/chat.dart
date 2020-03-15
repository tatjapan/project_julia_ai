import 'package:meta/meta.dart';

class Chat {
  Chat({
    @required this.chatbotName,
    @required this.message,
  });
  final String chatbotName;
  final String message;

  factory Chat.fromMap(Map<String, dynamic> data) {
    if (data == null) {
      return null;
    }
    final String chatbotName = data['chatbotName'];
    final String message = data['message'];
    return Chat(
      chatbotName: chatbotName,
      message: message,
    );
  }

  Map<String, dynamic> toMap() {
    return {
      'chatbotName': chatbotName,
      'message': message,
    };
  }
}
