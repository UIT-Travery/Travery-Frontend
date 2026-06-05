import 'package:json_annotation/json_annotation.dart';

part 'chat_session_response.g.dart';

@JsonSerializable()
class ChatSessionResponse {
  final String cometchatGuid;
  final String status;

  ChatSessionResponse({
    required this.cometchatGuid,
    required this.status,
  });

  factory ChatSessionResponse.fromJson(Map<String, dynamic> json) =>
      _$ChatSessionResponseFromJson(json);

  Map<String, dynamic> toJson() => _$ChatSessionResponseToJson(this);
}
