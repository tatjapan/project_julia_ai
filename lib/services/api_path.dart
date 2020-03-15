class APIPath {
  static String chat(String uid, String chatId) => 'users/$uid/chats/$chatId';
  static String chats(String uid) => 'users/$uid/chats/';
}
