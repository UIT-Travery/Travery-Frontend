import 'dart:async';
import 'package:go_router/go_router.dart';
import 'package:app_links/app_links.dart';
import 'package:travery_frontend/data/services/payment_session_storage.dart';

class DeepLinkService {
  DeepLinkService._();
  static final DeepLinkService instance = DeepLinkService._();

  final _appLinks = AppLinks();
  final _streamController = StreamController<Uri>.broadcast();
  Stream<Uri> get uriStream => _streamController.stream;

  GoRouter? _router;
  StreamSubscription<Uri>? _uriSubscription;

  // Queue for URIs received before router is registered (cold start)
  final List<Uri> _pendingUris = [];

  void registerRouter(GoRouter router) {
    _router = router;

    // Handle pending URIs from cold start
    for (final uri in _pendingUris) {
      _processUri(uri);
    }
    _pendingUris.clear();
  }

  /// Public method to handle URI from both cold and hot start
  void handleUri(Uri uri) {
    _streamController.add(uri);

    if (uri.scheme == 'travery' && uri.host == 'payment-result') {
      if (_router != null) {
        _processUri(uri);
      } else {
        // Router not yet ready (cold start) — queue it
        _pendingUris.add(uri);
      }
    }
  }

  Future<void> _processUri(Uri uri) async {
    // Backend sends: travery://payment-result?txnRef=xxx&status=success&responseCode=00
    final txnRef = uri.queryParameters['txnRef'];
    final status = uri.queryParameters['status'];
    final responseCode = uri.queryParameters['responseCode'];

    // Look up bookingId from txnRef using PaymentSessionStorage
    String? bookingId;
    if (txnRef != null && txnRef.isNotEmpty) {
      bookingId = PaymentSessionStorage.getBookingIdByTxnRef(txnRef);
    }

    // Use pushReplacement to replace current screen instead of stacking
    _router?.pushReplacement(
      '/payment/result',
      extra: {
        'txnRef': txnRef,
        'deeplinkStatus': status,
        'responseCode': responseCode,
        'bookingId': bookingId,
      },
    );
  }

  void dispose() {
    _uriSubscription?.cancel();
    _streamController.close();
  }
}
