import 'package:travery_frontend/utils/core_result.dart';
import '../../services/api/model/chat/chat_session_response.dart';

abstract class ChatRepository {
  Future<Result<ChatSessionResponse>> initiateChat();
  Future<Result<ChatSessionResponse>> initiateGroupChat(String tourInstanceId);
  Future<Result<void>> requestCloseChat(String sessionId);
  Future<Result<void>> closeInstanceChat(String instanceId);
}
