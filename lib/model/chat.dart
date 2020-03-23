import 'package:meta/meta.dart';

class Chat {
  Chat({
    @required this.id,
    @required this.chatbotName,
    @required this.message,
  });
  final String id;
  final String chatbotName;
  final String message;

  factory Chat.fromMap(Map<String, dynamic> data, documentId) {
    if (data == null) {
      return null;
    }
    final String chatbotName = data['chatbotName'];
    final String message = data['message'];
    return Chat(
      id: documentId,
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
