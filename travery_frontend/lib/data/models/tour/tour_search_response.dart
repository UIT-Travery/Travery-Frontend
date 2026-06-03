import 'tour_search_item.dart';

class TourSearchResponse {
  const TourSearchResponse({
    required this.httpStatus,
    this.message,
    required this.data,
  });

  final int httpStatus;
  final String? message;
  final TourSearchPageData data;

  factory TourSearchResponse.fromJson(Map<String, dynamic> json) {
    return TourSearchResponse(
      httpStatus: json['httpStatus'] as int,
      message: json['message'] as String?,
      data: TourSearchPageData.fromJson(json['data'] as Map<String, dynamic>),
    );
  }
}

class TourSearchPageData {
  const TourSearchPageData({
    required this.totalElements,
    required this.totalPages,
    required this.size,
    required this.content,
    required this.number,
    required this.first,
    required this.last,
    required this.numberOfElements,
    required this.empty,
  });

  final int totalElements;
  final int totalPages;
  final int size;
  final List<TourSearchItem> content;
  final int number;
  final bool first;
  final bool last;
  final int numberOfElements;
  final bool empty;

  factory TourSearchPageData.fromJson(Map<String, dynamic> json) {
    final page = json['page'] as Map<String, dynamic>?;
    return TourSearchPageData(
      totalElements:
          (page?['totalElements'] ?? json['totalElements']) as int? ?? 0,
      totalPages: (page?['totalPages'] ?? json['totalPages']) as int? ?? 0,
      size: (page?['size'] ?? json['size']) as int? ?? 0,
      content: (json['content'] as List<dynamic>)
          .map((e) => TourSearchItem.fromJson(e as Map<String, dynamic>))
          .toList(),
      number: (page?['number'] ?? json['number']) as int? ?? 0,
      first: (page?['first'] ?? json['first']) as bool? ?? true,
      last: (page?['last'] ?? json['last']) as bool? ?? true,
      numberOfElements:
          (page?['numberOfElements'] ?? json['numberOfElements']) as int? ?? 0,
      empty: (page?['empty'] ?? json['empty']) as bool? ?? false,
    );
  }
}
