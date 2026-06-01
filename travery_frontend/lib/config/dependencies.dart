import 'package:provider/provider.dart';
import 'package:provider/single_child_widget.dart';

import 'package:travery_frontend/data/repositories/admin/admin_repository.dart';
import 'package:travery_frontend/data/repositories/admin/admin_repository_remote.dart';
import 'package:travery_frontend/data/repositories/coordinator/coordinator_repository.dart';
import 'package:travery_frontend/data/repositories/coordinator/coordinator_repository_remote.dart';
import 'package:travery_frontend/data/repositories/authentication/auth_repository.dart';
import 'package:travery_frontend/data/repositories/authentication/auth_repository_remote.dart';
import 'package:travery_frontend/data/repositories/mission_repository.dart';
import 'package:travery_frontend/data/repositories/check_in_repository.dart';
import 'package:travery_frontend/data/repositories/tour_completed_repository_impl.dart';
import 'package:travery_frontend/data/repositories/tour_progress_repository.dart';
import 'package:travery_frontend/data/repositories/tour_completed_repository.dart';
import 'package:travery_frontend/data/repositories/user/user_booking_repository.dart';

import 'package:travery_frontend/data/services/api/admin_api_service.dart';
import 'package:travery_frontend/data/services/api/auth_service.dart';
import 'package:travery_frontend/data/services/api/coordinator_api_service.dart';
import 'package:travery_frontend/data/services/security_storage_service.dart';
import 'package:travery_frontend/data/services/token_refresh_service.dart';
import 'package:travery_frontend/data/services/tour/tour_service.dart';
import 'package:travery_frontend/data/services/guide/guide_service.dart';
import 'package:travery_frontend/data/services/guide/guide_service_impl.dart';
import 'package:travery_frontend/data/services/trip/trip_service.dart';
import 'package:travery_frontend/data/services/trip/trip_service_impl.dart';
import 'package:travery_frontend/data/services/trip/trip_booking_repository.dart';
import 'package:travery_frontend/data/services/api/profile_service.dart';
import 'package:travery_frontend/data/repositories/profile/profile_repository.dart';
import 'package:travery_frontend/data/repositories/profile/profile_repository_remote.dart';

import 'package:travery_frontend/data/services/booking/booking_service.dart';
import 'package:travery_frontend/data/repositories/mission_repository_impl.dart';
import 'package:travery_frontend/data/repositories/check_in_repository_impl.dart';
import 'package:travery_frontend/data/repositories/tour_progress_repository_impl.dart';

import 'package:travery_frontend/ui/user/home/view_models/home_view_model.dart';
// import 'package:travery_frontend/ui/user/providers/user_info_provider.dart';
import 'package:travery_frontend/ui/user/tour/list/view_models/tour_list_view_model.dart';
import 'package:travery_frontend/ui/user/tour/detail/view_models/tour_detail_view_model.dart';
import 'package:travery_frontend/ui/user/tour/booking_input/view_models/booking_input_view_model.dart';
import 'package:travery_frontend/ui/user/tour/booking_review/view_models/booking_review_view_model.dart';
import 'package:travery_frontend/ui/user/tour/payment/view_models/vnpay_payment_view_model.dart';
import 'package:travery_frontend/ui/user/tour/payment_result/view_models/payment_result_view_model.dart';
import 'package:travery_frontend/ui/user/tour/booking_list/view_models/booking_list_view_model.dart';
import 'package:travery_frontend/ui/user/tour/booking_detail/view_models/booking_detail_view_model.dart';
import 'package:travery_frontend/ui/user/tour/cancel/view_models/cancel_booking_view_model.dart';

import 'package:travery_frontend/ui/user/trip/home/view_models/trip_home_view_model.dart';
import 'package:travery_frontend/ui/user/trip/list/view_models/trip_list_view_model.dart';
import 'package:travery_frontend/ui/user/trip/seat_picker/view_models/seat_picker_view_model.dart';
import 'package:travery_frontend/ui/user/trip/booking_input/view_models/trip_booking_input_view_model.dart';
import 'package:travery_frontend/ui/user/trip/booking_review/view_models/trip_booking_review_view_model.dart';
import 'package:travery_frontend/ui/user/trip/payment/view_models/trip_payment_view_model.dart';
import 'package:travery_frontend/ui/user/trip/payment_result/view_models/trip_payment_result_view_model.dart';
import 'package:travery_frontend/ui/user/trip/my_booking/view_models/my_trip_booking_view_model.dart';
import 'package:travery_frontend/ui/user/trip/booking_detail/view_models/trip_booking_detail_view_model.dart';

import 'package:travery_frontend/ui/guide/home/view_models/guide_home_view_model.dart';
import 'package:travery_frontend/ui/guide/mission/view_models/mission_detail_view_model.dart';
import 'package:travery_frontend/ui/guide/mission/check_in/view_models/check_in_view_model.dart';
import 'package:travery_frontend/ui/guide/mission/tour_progress/view_models/tour_progress_view_model.dart';
import 'package:travery_frontend/ui/guide/mission/tour_completed/view_models/our_completed_view_model.dart';

import '../data/services/tour/tour_service_impl.dart';

List<SingleChildWidget> get providers => [
  Provider(create: (context) => AuthService()),
  Provider(create: (context) => SecurityStorageService()),
  Provider(
    create: (context) => TokenRefreshService(
      authService: context.read<AuthService>(),
      securityStorageService: context.read<SecurityStorageService>(),
    ),
  ),
  ChangeNotifierProvider(
    create: (context) =>
        AuthRepositoryRemote(
              authService: context.read(),
              securityStorageService: context.read(),
              tokenRefreshService: context.read<TokenRefreshService>(),
            )
            as AuthRepository,
  ),
  // ChangeNotifierProvider(
  //   create: (context) => UserInfoProvider(
  //     storage: context.read<SecurityStorageService>(),
  //     tokenRefreshService: context.read<TokenRefreshService>(),
  //   ),
  // ),
  Provider<TourService>(
    create: (context) => TourServiceImpl(
      tokenRefreshService: context.read<TokenRefreshService>(),
    ),
  ),
  Provider<TripService>(
    create: (context) => TripServiceImpl(
      securityStorageService: context.read<SecurityStorageService>(),
    ),
  ),
  Provider<TripBookingRepository>(
    create: (context) => TripBookingRepository(
      securityStorageService: context.read<SecurityStorageService>(),
    ),
  ),

  // ── Trip ViewModels ────────────────────────────────────────────────────────
  ChangeNotifierProvider(
    create: (context) =>
        TripHomeViewModel(tripService: context.read<TripService>()),
  ),
  ChangeNotifierProvider(
    create: (context) =>
        TripListViewModel(tripService: context.read<TripService>()),
  ),
  ChangeNotifierProvider(
    create: (context) =>
        SeatPickerViewModel(tripService: context.read<TripService>()),
  ),
  ChangeNotifierProvider(create: (_) => TripBookingInputViewModel()),
  ChangeNotifierProvider(
    create: (context) =>
        TripBookingReviewViewModel(tripService: context.read<TripService>()),
  ),
  ChangeNotifierProvider(
    create: (context) =>
        TripPaymentViewModel(tripService: context.read<TripService>()),
  ),
  ChangeNotifierProvider(
    create: (context) =>
        TripPaymentResultViewModel(tripService: context.read<TripService>()),
  ),
  ChangeNotifierProvider(
    create: (context) => MyTripBookingViewModel(
      repository: context.read<TripBookingRepository>(),
    ),
  ),
  ChangeNotifierProvider(
    create: (context) =>
        TripBookingDetailViewModel(tripService: context.read<TripService>()),
  ),

  // ── Admin service ─────────────────────────────────────────────────────────
  Provider<AdminApiService>(create: (context) => AdminApiService()),

  // ── Admin repository (remote — hits real API) ────────────────────────────
  ChangeNotifierProvider<AdminRepository>(
    create: (context) => AdminRepositoryRemote(
      adminApiService: context.read<AdminApiService>(),
      tokenRefreshService: context.read<TokenRefreshService>(),
    ),
  ),

  // ── Profile service ──────────────────────────────────────────────────────
  Provider<ProfileService>(create: (context) => ProfileService()),

  // ── Profile repository (remote) ──────────────────────────────────────────
  ChangeNotifierProvider<ProfileRepository>(
    create: (context) => ProfileRepositoryRemote(
      profileService: context.read<ProfileService>(),
      tokenRefreshService: context.read<TokenRefreshService>(),
    ),
  ),

  // ── Coordinator service ───────────────────────────────────────────────
  Provider<CoordinatorApiService>(create: (context) => CoordinatorApiService()),

  // ── Coordinator repository (remote — hits real API) ──────────────────────
  ChangeNotifierProvider<CoordinatorRepository>(
    create: (context) => CoordinatorRepositoryRemote(
      apiService: context.read<CoordinatorApiService>(),
      tokenRefreshService: context.read<TokenRefreshService>(),
    ),
  ),

  // ── User ViewModels ───────────────────────────────────────────────────────
  Provider<BookingService>(
    create: (context) => UserBookingRepository(
      tokenRefreshService: context.read<TokenRefreshService>(),
    ),
  ),
  ChangeNotifierProvider(
    create: (context) =>
        HomeViewModel(tourService: context.read<TourService>()),
  ),
  ChangeNotifierProvider(
    create: (context) =>
        TourListViewModel(tourService: context.read<TourService>()),
  ),
  ChangeNotifierProvider(
    create: (context) =>
        TourDetailViewModel(tourService: context.read<TourService>()),
  ),
  ChangeNotifierProvider(
    create: (context) =>
        BookingInputViewModel(tourService: context.read<TourService>()),
  ),
  ChangeNotifierProvider(
    create: (context) => BookingReviewViewModel(
      tourService: context.read<TourService>(),
      tokenRefreshService: context.read<TokenRefreshService>(),
    ),
  ),
  ChangeNotifierProvider(
    create: (context) =>
        VNPayPaymentViewModel(tourService: context.read<TourService>()),
  ),
  ChangeNotifierProvider(
    create: (context) =>
        PaymentResultViewModel(tourService: context.read<TourService>()),
  ),
  ChangeNotifierProvider(
    create: (context) =>
        BookingListViewModel(bookingService: context.read<BookingService>()),
  ),
  ChangeNotifierProvider(
    create: (context) =>
        BookingDetailViewModel(bookingService: context.read<BookingService>()),
  ),
  ChangeNotifierProvider(
    create: (context) =>
        CancelBookingViewModel(bookingService: context.read<BookingService>()),
  ),

  // ── Guide Service & ViewModels ─────────────────────────────────────────────
  Provider<GuideService>(
    create: (context) => GuideServiceImpl(
      tokenRefreshService: context.read<TokenRefreshService>(),
    ),
  ),
  Provider<MissionRepository>(
    create: (context) => MissionRepositoryImpl(
      tokenRefreshService: context.read<TokenRefreshService>(),
    ),
  ),
  Provider<CheckInRepository>(
    create: (context) => CheckInRepositoryImpl(
      tokenRefreshService: context.read<TokenRefreshService>(),
    ),
  ),
  Provider<TourProgressRepository>(
    create: (context) => TourProgressRepositoryImpl(
      tokenRefreshService: context.read<TokenRefreshService>(),
    ),
  ),
  Provider<TourCompletedRepository>(
    create: (context) => TourCompletedRepositoryImpl(
      tokenRefreshService: context.read<TokenRefreshService>(),
    ),
  ),
  ChangeNotifierProvider(
    create: (context) =>
        GuideHomeViewModel(guideService: context.read<GuideService>()),
  ),
  ChangeNotifierProvider(
    create: (context) => MissionDetailViewModel(
      missionRepository: context.read<MissionRepository>(),
    ),
  ),
  ChangeNotifierProvider(
    create: (context) =>
        CheckInViewModel(checkInRepository: context.read<CheckInRepository>()),
  ),
  ChangeNotifierProvider(
    create: (context) => TourProgressViewModel(
      repository: context.read<TourProgressRepository>(),
    ),
  ),
  ChangeNotifierProvider(
    create: (context) => TourCompletedViewModel(
      repository: context.read<TourCompletedRepository>(),
    ),
  ),
];
