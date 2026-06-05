String guideFriendlyErrorMessage(
  Object? error, {
  String fallback = 'Đã xảy ra lỗi. Vui lòng thử lại.',
}) {
  final message = _normalizeErrorText(error);
  if (message.isEmpty) return fallback;

  final lower = message.toLowerCase();

  if (_containsAny(lower, const [
    'socketexception',
    'failed host lookup',
    'connection refused',
    'connection reset',
    'connection closed',
    'network',
    'internet',
    'clientexception',
    'no host specified',
    'kết nối',
  ])) {
    return 'Không kết nối được máy chủ. Vui lòng kiểm tra mạng và thử lại.';
  }

  if (_containsAny(lower, const ['timeout', 'timed out', 'quá thời gian'])) {
    return 'Yêu cầu mất quá nhiều thời gian. Vui lòng thử lại.';
  }

  if (_containsAny(lower, const [
    '401',
    '403',
    'unauthorized',
    'forbidden',
    'auth',
    'token',
    'hết hạn',
  ])) {
    return 'Phiên đăng nhập đã hết hạn. Vui lòng đăng nhập lại.';
  }

  if (_containsAny(lower, const ['404', 'not found', 'không tìm thấy'])) {
    return 'Không tìm thấy dữ liệu. Vui lòng làm mới và thử lại.';
  }

  if (_containsAny(lower, const [
    '409',
    'conflict',
    'already',
    'đã điểm danh',
    'đã check-in',
    'đã cập nhật',
  ])) {
    return 'Thông tin đã được cập nhật trước đó. Vui lòng tải lại danh sách.';
  }

  if (_containsAny(lower, const [
    'completed',
    'cancelled',
    'đã kết thúc',
    'đã hủy',
  ])) {
    return 'Mục này đã kết thúc nên không thể cập nhật.';
  }

  if (_containsAny(lower, const [
    '400',
    'invalid',
    'validation',
    'bad request',
    'không hợp lệ',
  ])) {
    return 'Thông tin gửi lên chưa hợp lệ. Vui lòng kiểm tra lại.';
  }

  if (_containsAny(lower, const [
    '500',
    '502',
    '503',
    '504',
    'internal server',
    'server error',
    'máy chủ',
  ])) {
    return 'Máy chủ đang gặp sự cố. Vui lòng thử lại sau.';
  }

  if (_containsAny(lower, const [
    'thất bại',
    'failed',
    'failure',
    'không thành công',
  ])) {
    return fallback;
  }

  if (_looksTechnical(lower)) return fallback;

  return message;
}

String _normalizeErrorText(Object? error) {
  var message = error?.toString().trim() ?? '';
  if (message.isEmpty) return '';

  final resultMatch = RegExp(
    r'^Result<.+>\.error\((.*)\)$',
  ).firstMatch(message);
  if (resultMatch != null) {
    message = resultMatch.group(1) ?? message;
  }

  message = message
      .replaceFirst(
        RegExp(
          r'^(HttpException|Exception|SocketException|TimeoutException|FormatException|ClientException):\s*',
          caseSensitive: false,
        ),
        '',
      )
      .replaceFirst(RegExp(r',\s*uri\s*=.*$', caseSensitive: false), '')
      .replaceAll(RegExp(r'\s+'), ' ')
      .trim();

  return message;
}

bool _containsAny(String value, List<String> patterns) {
  return patterns.any(value.contains);
}

bool _looksTechnical(String message) {
  return _containsAny(message, const [
    '/api/',
    'statuscode',
    'status code',
    'null check operator',
    'is not a subtype',
    'type \'',
    'format exception',
    'unexpected character',
    'xmlhttprequest',
    '<html',
    '<!doctype',
    '#0',
    'stack trace',
  ]);
}
