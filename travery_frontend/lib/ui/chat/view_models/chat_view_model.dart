import 'package:flutter/material.dart';
import 'package:travery_frontend/data/repositories/chat/chat_repository.dart';
import 'package:travery_frontend/utils/core_result.dart';

class ChatViewModel extends ChangeNotifier {
  final ChatRepository _chatRepository;

  ChatViewModel({required ChatRepository chatRepository})
      : _chatRepository = chatRepository;

  bool _isLoading = false;
  bool get isLoading => _isLoading;

  String? _errorMessage;
  String? get errorMessage => _errorMessage;

  void _setLoading(bool value) {
    _isLoading = value;
    notifyListeners();
  }

  void _setError(String? value) {
    _errorMessage = value;
    notifyListeners();
  }

  Future<String?> initiateChat() async {
    debugPrint("ChatViewModel: initiateChat called");
    _setLoading(true);
    _setError(null);

    final result = await _chatRepository.initiateChat();
    _setLoading(false);

    switch (result) {
      case Ok():
        debugPrint("ChatViewModel: initiateChat success. GUID: ${result.value.cometchatGuid}");
        return result.value.cometchatGuid;
      case Error():
        debugPrint("ChatViewModel: initiateChat error: ${result.error}");
        _setError(result.error.toString());
        return null;
    }
  }

  Future<String?> initiateGroupChat(String tourInstanceId) async {
    debugPrint("ChatViewModel: initiateGroupChat called for instance: $tourInstanceId");
    _setLoading(true);
    _setError(null);

    final result = await _chatRepository.initiateGroupChat(tourInstanceId);
    _setLoading(false);

    switch (result) {
      case Ok():
        debugPrint("ChatViewModel: initiateGroupChat success. GUID: ${result.value.cometchatGuid}");
        return result.value.cometchatGuid;
      case Error():
        debugPrint("ChatViewModel: initiateGroupChat error: ${result.error}");
        _setError(result.error.toString());
        return null;
    }
  }

  Future<bool> requestCloseChat(String sessionId) async {
    _setLoading(true);
    _setError(null);

    final result = await _chatRepository.requestCloseChat(sessionId);
    _setLoading(false);

    switch (result) {
      case Ok():
        return true;
      case Error():
        _setError(result.error.toString());
        return false;
    }
  }

  Future<bool> closeInstanceChat(String instanceId) async {
    _setLoading(true);
    _setError(null);

    final result = await _chatRepository.closeInstanceChat(instanceId);
    _setLoading(false);

    switch (result) {
      case Ok():
        return true;
      case Error():
        _setError(result.error.toString());
        return false;
    }
  }
}
