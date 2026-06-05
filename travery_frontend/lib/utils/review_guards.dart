bool readHasReview(Map<String, dynamic> json) {
  final explicit = _readBool(
    json['hasReview'] ??
        json['reviewed'] ??
        json['hasReviewed'] ??
        json['alreadyReviewed'] ??
        json['reviewExists'] ??
        json['canReview'],
  );

  if (explicit != null) {
    return json.containsKey('canReview') && !json.containsKey('hasReview')
        ? !explicit
        : explicit;
  }

  return _hasReviewObject(json['review']) ||
      _hasReviewObject(json['reviewData']) ||
      _hasReviewObject(json['myReview']) ||
      _hasReviewObject(json['userReview']) ||
      _hasReviewObject(json['rating']);
}

bool isDuplicateReviewError(Object error) {
  final message = error.toString().toLowerCase();
  return message.contains('review already exists') ||
      message.contains('already reviewed') ||
      message.contains('already exists for this booking') ||
      message.contains('duplicate review') ||
      message.contains('đã đánh giá');
}

String friendlyReviewError(Object error) {
  if (isDuplicateReviewError(error)) {
    return 'Bạn đã gửi đánh giá cho đơn này rồi. Cảm ơn bạn đã chia sẻ trải nghiệm.';
  }

  final message = error.toString();
  if (message.startsWith('HttpException: ')) {
    return message.substring('HttpException: '.length);
  }
  return message;
}

bool _hasReviewObject(dynamic value) {
  if (value == null) return false;
  if (value is bool) return value;
  if (value is num) return value > 0;
  if (value is String) return value.trim().isNotEmpty;
  if (value is Map) return value.isNotEmpty;
  if (value is List) return value.isNotEmpty;
  return false;
}

bool? _readBool(dynamic value) {
  if (value is bool) return value;
  if (value is num) return value != 0;
  if (value is String) {
    final normalized = value.trim().toLowerCase();
    if (normalized == 'true' || normalized == 'yes' || normalized == '1') {
      return true;
    }
    if (normalized == 'false' || normalized == 'no' || normalized == '0') {
      return false;
    }
  }
  return null;
}
