import 'package:meta/meta.dart';
import 'package:project_julia_ai/model/chat.dart';
import 'package:project_julia_ai/services/firestore_service.dart';
import 'api_path.dart';

abstract class Database {
  Future<void> createChat(Chat chat);
  Stream<List<Chat>> chatsStream();
}

class FirestoreDatabase implements Database {
  FirestoreDatabase({@required this.uid}) : assert(uid != null);
  final String uid;

  final _service = FirestoreService.instance;

  // Modelの数だけFuture<void>createとStream<List<Model>>を追加していく
  Future<void> createChat(Chat chat) async => await _service.setData(
        path: APIPath.chat(uid, chat.id),
        data: chat.toMap(),
      );

  Stream<List<Chat>> chatsStream() => _service.collectionStream(
        path: APIPath.chats(uid),
        builder: (data, documentId) => Chat.fromMap(data, documentId),
      );
}
