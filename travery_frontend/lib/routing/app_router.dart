import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:provider/provider.dart';
import 'package:travery_frontend/data/repositories/admin/admin_repository.dart';
import 'package:travery_frontend/data/repositories/profile/profile_repository.dart';
import 'package:travery_frontend/data/repositories/authentication/auth_repository.dart';
import 'package:travery_frontend/data/repositories/coordinator/coordinator_repository.dart';
import 'package:travery_frontend/data/services/security_storage_service.dart';
import 'package:travery_frontend/domain/models/coordinator/coordinator_coach/coordinator_coach.dart';
import 'package:travery_frontend/ui/admin/view_model/update_hotel_view_model.dart';
import 'package:travery_frontend/ui/admin/view_model/update_vehicle_view_model.dart';
import 'package:travery_frontend/ui/admin/view/admin_main_screen.dart';
import 'package:travery_frontend/ui/admin/view/view_detail_account_screen.dart';
import 'package:travery_frontend/ui/admin/view_model/view_detail_account_view_model.dart';
import 'package:travery_frontend/ui/authentication/view_models/confirm_password_view_model.dart';
import 'package:travery_frontend/ui/authentication/view_models/forgot_password_view_model.dart';
import 'package:travery_frontend/ui/authentication/view_models/register_view_model.dart';
import 'package:travery_frontend/ui/coordinator/view/coordinator_main_screen.dart';
import 'package:travery_frontend/ui/guide/home/guide_home_screen.dart';
import 'package:travery_frontend/ui/guide/home/view_models/guide_home_view_model.dart';
import 'package:travery_frontend/ui/guide/mission/mission_detail_screen.dart';
import 'package:travery_frontend/ui/guide/mission/view_models/mission_detail_view_model.dart';
import 'package:travery_frontend/ui/guide/mission/check_in/check_in_screen.dart';
import 'package:travery_frontend/ui/guide/mission/check_in/view_models/check_in_view_model.dart';
import 'package:travery_frontend/ui/guide/mission/tour_progress/tour_progress_screen.dart';
import 'package:travery_frontend/ui/guide/mission/tour_progress/view_models/tour_progress_view_model.dart';
import 'package:travery_frontend/ui/guide/mission/tour_completed/our_completed_screen.dart';
import 'package:travery_frontend/ui/guide/mission/tour_completed/view_models/our_completed_view_model.dart';
import 'package:travery_frontend/ui/receptionist/view/recep_dashboard_screen.dart';
import 'package:travery_frontend/ui/receptionist/view/recep_main_screen.dart';
import 'package:travery_frontend/ui/receptionist/view/recep_view_addon_list_screen.dart';
import 'package:travery_frontend/ui/receptionist/view/recep_view_checkinout_list_screen.dart';
import 'package:travery_frontend/ui/receptionist/view/recep_view_hotel_room_screen.dart';
import 'package:travery_frontend/ui/receptionist/view/recep_view_profile_sceen.dart';
import 'package:travery_frontend/ui/user/tour/list/tour_list_screen.dart';
import 'package:travery_frontend/ui/user/tour/list/view_models/tour_list_view_model.dart';
import 'package:travery_frontend/ui/user/tour/detail/tour_detail_screen.dart';
import 'package:travery_frontend/ui/user/tour/detail/view_models/tour_detail_view_model.dart';
import 'package:travery_frontend/ui/user/tour/booking_input/booking_input_screen.dart';
import 'package:travery_frontend/ui/user/tour/booking_input/view_models/booking_input_view_model.dart';
import 'package:travery_frontend/ui/user/tour/booking_review/booking_review_screen.dart';
import 'package:travery_frontend/ui/user/tour/booking_review/view_models/booking_review_view_model.dart';
import 'package:travery_frontend/ui/user/tour/payment/vnpay_payment_screen.dart';
import 'package:travery_frontend/ui/user/tour/payment/view_models/vnpay_payment_view_model.dart';
import 'package:travery_frontend/ui/user/tour/payment_result/payment_result_screen.dart';
import 'package:travery_frontend/ui/user/tour/payment_result/view_models/payment_result_view_model.dart';
import 'package:travery_frontend/ui/user/tour/booking_detail/booking_detail_screen.dart';
import 'package:travery_frontend/ui/user/tour/booking_detail/view_models/booking_detail_view_model.dart';
import 'package:travery_frontend/ui/user/tour/cancel/cancel_booking_screen.dart';
import 'package:travery_frontend/ui/user/tour/cancel/view_models/cancel_booking_view_model.dart';
import 'package:travery_frontend/ui/user/tour/cancel_success/cancel_success_screen.dart';
import 'package:travery_frontend/ui/user/trip/home/trip_home_screen.dart';
import 'package:travery_frontend/ui/user/trip/list/trip_list_screen.dart';
import 'package:travery_frontend/ui/user/trip/seat_picker/seat_picker_screen.dart';
import 'package:travery_frontend/ui/user/trip/booking_input/trip_booking_input_screen.dart';
import 'package:travery_frontend/ui/user/trip/booking_review/trip_booking_review_screen.dart';
import 'package:travery_frontend/ui/user/trip/booking_review/view_models/trip_booking_review_view_model.dart';
import 'package:travery_frontend/data/services/trip/trip_service.dart';
import 'package:travery_frontend/ui/user/trip/payment/trip_payment_screen.dart';
import 'package:travery_frontend/ui/user/trip/payment_result/trip_payment_result_screen.dart';
import 'package:travery_frontend/ui/user/trip/my_booking/my_trip_booking_screen.dart';
import 'package:travery_frontend/ui/user/trip/booking_detail/trip_booking_detail_screen.dart';
import 'package:travery_frontend/ui/user/trip/cancel/trip_cancel_screen.dart';
import 'package:travery_frontend/ui/user/trip/cancel_success/trip_cancel_success_screen.dart';
import 'package:travery_frontend/ui/user/widgets/user_bottom_nav.dart';
import 'package:travery_frontend/domain/models/coordinator/coordinator_tour/coordinator_tour.dart';
import 'package:travery_frontend/domain/models/coordinator/coordinator_tour_template/coordinator_tour_template.dart';
import 'package:travery_frontend/ui/admin/view_model/dashboard_view_model.dart';
import 'package:travery_frontend/ui/admin/view_model/account_management_view_model.dart';
import 'package:travery_frontend/ui/admin/view_model/create_account_view_model.dart';
import 'package:travery_frontend/ui/authentication/view/login_screen.dart';
import 'package:travery_frontend/ui/authentication/view/register_screen.dart';
import 'package:travery_frontend/ui/authentication/view/otp_verification_screen.dart';
import 'package:travery_frontend/ui/authentication/view/forgot_password_screen.dart';
import 'package:travery_frontend/ui/authentication/view/confirm_password_screen.dart';
import 'package:travery_frontend/ui/authentication/view/splash_screen.dart';
import 'package:travery_frontend/ui/authentication/widgets/role_selection_screen.dart';
import 'package:travery_frontend/ui/authentication/view_models/login_view_model.dart';
import 'package:travery_frontend/ui/authentication/view_models/otp_verification_view_model.dart';
import 'package:travery_frontend/ui/admin/view/create_account_screen.dart';
import 'package:travery_frontend/ui/admin/view/account_management_screen.dart';
import 'package:travery_frontend/ui/admin/view/tour_management_screen.dart';
import 'package:travery_frontend/ui/admin/view/vehicle_management_screen.dart';
import 'package:travery_frontend/ui/admin/view/hotel_management_screen.dart';
import '../ui/admin/view/create_hotel_screen.dart';
import '../ui/admin/view/update_hotel_screen.dart';
import '../ui/admin/view/create_vehicle_screen.dart';
import '../ui/admin/view/update_vehicle_screen.dart';
import '../ui/admin/view/update_profile_screen.dart';
import 'package:travery_frontend/ui/admin/view_model/admin_profile_view_model.dart';
import 'package:travery_frontend/ui/coordinator/view/coordinator_view_tour_list_screen.dart';
import 'package:travery_frontend/ui/coordinator/view_models/coordinator_tour_list_view_model.dart';
import 'package:travery_frontend/ui/coordinator/view/coordinator_view_profile_screen.dart';
import 'package:travery_frontend/ui/coordinator/view/coordinator_update_profile_screen.dart';
import 'package:travery_frontend/ui/coordinator/view/coordinator_view_tour_screen.dart';
import 'package:travery_frontend/ui/coordinator/view/coordinator_view_tour_template_list_screen.dart';
import 'package:travery_frontend/ui/coordinator/view_models/coordinator_tour_template_list_view_model.dart';
import 'package:travery_frontend/ui/coordinator/view/coordinator_create_tour_template_screen.dart';
import 'package:travery_frontend/ui/coordinator/view_models/coordinator_create_tour_template_view_model.dart';
import 'package:travery_frontend/ui/coordinator/view/coordinator_create_tour_screen.dart';
import 'package:travery_frontend/ui/coordinator/view_models/coordinator_create_tour_view_model.dart';
import 'package:travery_frontend/ui/coordinator/view/coordinator_view_template_screen.dart';
import 'package:travery_frontend/ui/coordinator/view_models/coordinator_tour_detail_view_model.dart';
import 'package:travery_frontend/ui/coordinator/view_models/coordinator_tour_template_detail_view_model.dart';
import 'package:travery_frontend/ui/user/hotel/home/hotel_home_screen.dart';
import 'package:travery_frontend/ui/user/hotel/home/hotel_detail_screen.dart';
import 'package:travery_frontend/ui/user/hotel/home/view_models/hotel_home_view_model.dart';
import 'package:travery_frontend/ui/user/hotel/home/view_models/hotel_detail_view_model.dart';
import 'package:travery_frontend/ui/user/hotel/room_list/hotel_room_list_screen.dart';
import 'package:travery_frontend/ui/user/hotel/booking_input/hotel_booking_input_screen.dart';
import 'package:travery_frontend/ui/user/hotel/booking_review/hotel_booking_review_screen.dart';
import 'package:travery_frontend/ui/user/hotel/payment/hotel_payment_screen.dart';
import 'package:travery_frontend/ui/user/hotel/payment_result/hotel_payment_result_screen.dart';
import 'package:travery_frontend/ui/user/hotel/my_booking/hotel_my_booking_screen.dart';
import 'package:travery_frontend/ui/user/hotel/my_booking/view_models/hotel_my_booking_view_model.dart';
import 'package:travery_frontend/ui/user/hotel/booking_detail/hotel_booking_detail_screen.dart';
import 'package:travery_frontend/ui/user/hotel/booking_detail/view_models/hotel_booking_detail_view_model.dart';
import 'package:travery_frontend/ui/user/hotel/cancel/hotel_cancel_screen.dart';
import 'package:travery_frontend/ui/user/hotel/cancel_success/hotel_cancel_success_screen.dart';
import 'package:travery_frontend/ui/user/hotel/addon_list/hotel_addon_list_screen.dart';
import 'package:travery_frontend/ui/user/hotel/addon_payment/hotel_addon_payment_screen.dart';
import 'package:travery_frontend/ui/user/hotel/addon_payment_success/hotel_addon_payment_success_screen.dart';
import 'package:travery_frontend/ui/user/hotel/checkout/hotel_checkout_screen.dart';
import 'package:travery_frontend/ui/user/hotel/checkout_success/hotel_checkout_success_screen.dart';
import 'package:travery_frontend/ui/user/profile/view/user_profile_screen.dart';
import 'package:travery_frontend/ui/user/profile/view/user_edit_profile_screen.dart';
import 'package:travery_frontend/ui/user/profile/view/user_change_password_screen.dart';
import 'package:travery_frontend/ui/user/profile/view/user_settings_screen.dart';
import 'package:travery_frontend/ui/user/profile/view_model/profile_view_model.dart';
import 'package:travery_frontend/data/services/api/profile_service.dart';
import 'routes.dart';
import 'package:travery_frontend/ui/admin/view_model/vehicle_management_view_model.dart';
import 'package:travery_frontend/ui/admin/view_model/tour_management_view_model.dart';
import 'package:travery_frontend/ui/admin/view_model/hotel_management_view_model.dart';
import 'package:travery_frontend/ui/admin/view_model/create_hotel_view_model.dart';
import 'package:travery_frontend/ui/admin/view_model/create_vehicle_view_model.dart';

// Admin new imports
import '../ui/admin/view/view_roomtype_list_sreen.dart';
import '../ui/admin/view/view_roomtype_screen.dart';
import '../ui/admin/view/create_room_type_screen.dart';
import '../ui/admin/view/update_room_type_screen.dart';
import '../ui/admin/view/amenity_management_screen.dart';
import '../ui/admin/view/create_amenity_screen.dart';
import '../ui/admin/view/update_amenity_screen.dart';
import '../ui/admin/view/view_hotel_service_list_screen.dart';
import '../ui/admin/view/create_hotel_service.dart';
import '../ui/admin/view/update_hotel_service_screen.dart';
import '../ui/admin/view/admin_view_profile_screen.dart';

// Coordinator new imports
import 'package:travery_frontend/ui/coordinator/view/coordinator_create_coach_screen.dart';
import 'package:travery_frontend/ui/coordinator/view/coordinator_create_coach_template_screen.dart';
import 'package:travery_frontend/ui/coordinator/view/coordinator_selection_screen.dart';
import 'package:travery_frontend/ui/coordinator/view/coordinator_view_coach_list_screen.dart';
import 'package:travery_frontend/ui/coordinator/view/coordinator_view_coach_screen.dart';
import 'package:travery_frontend/ui/coordinator/view/coordinator_view_coach_template_list_screen.dart';
import 'package:travery_frontend/ui/coordinator/view/coordinator_view_ended_tour_screen.dart';
import 'package:travery_frontend/ui/coordinator/view/coordinator_view_reviews_screen.dart';
import 'package:travery_frontend/ui/coordinator/view/coordinator_view_task_list_screen.dart';
import 'package:travery_frontend/ui/coordinator/view_models/coordinator_coach_template_list_view_model.dart';

GoRouter appRouter(
  AuthRepository authRepository, {
  void Function(GoRouter router)? onInitialized,
}) {
  final router = GoRouter(
    initialLocation: Routes.splash,
    debugLogDiagnostics: true,
    routes: [
      // --- SPLASH ---
      GoRoute(
        path: Routes.splash,
        builder: (context, state) => const SplashScreen(),
      ),

      // --- AUTHENTICATION ROUTES ---
      GoRoute(
        path: Routes.login,
        builder: (context, state) => LoginScreen(
          viewModel: LoginViewModel(
            authRepository: context.read<AuthRepository>(),
          ),
        ),
      ),
      GoRoute(
        path: Routes.roleSelection,
        builder: (context, state) => const RoleSelectionScreen(),
      ),
      GoRoute(
        path: Routes.register,
        builder: (context, state) => RegisterScreen(
          viewModel: RegisterViewModel(
            authRepository: context.read<AuthRepository>(),
          ),
        ),
      ),
      GoRoute(
        path: Routes.otp,
        builder: (context, state) {
          final extra = state.extra as Map<String, dynamic>;
          final email = extra['email'] as String;
          final password = extra['password'] as String?;
          final confirmPassword = extra['confirmPassword'] as String?;

          return OtpVerificationScreen(
            viewModel: OtpVerificationViewModel(
              authRepository: context.read<AuthRepository>(),
            ),
            email: email,
            password: password,
            confirmPassword: confirmPassword,
          );
        },
      ),
      GoRoute(
        path: Routes.forgotPassword,
        builder: (context, state) => ForgotPasswordScreen(
          viewModel: ForgotPasswordViewModel(
            authRepository: context.read<AuthRepository>(),
          ),
        ),
      ),
      GoRoute(
        path: Routes.confirmPassword,
        builder: (context, state) {
          final extra = state.extra as Map<String, dynamic>;
          final email = extra['email'] as String;
          final otp = extra['otp'] as String;

          return ConfirmPasswordScreen(
            viewModel: ConfirmPasswordViewModel(
              authRepository: context.read<AuthRepository>(),
            ),
            email: email,
            otp: otp,
          );
        },
      ),

      // --- COORDINATOR ROUTES ---
      GoRoute(
        path: Routes.coordinatorMain,
        builder: (context, state) => ChangeNotifierProvider(
          create: (context) => CoordinatorTourListViewModel(
            coordinatorRepository: context.read<CoordinatorRepository>(),
          ),
          child: const CoordinatorMainScreen(),
        ),
      ),
      GoRoute(
        path: Routes.coordinatorHome,
        builder: (context, state) => CoordinatorTourListScreen(
          viewModel: CoordinatorTourListViewModel(
            coordinatorRepository: context.read<CoordinatorRepository>(),
          ),
        ),
      ),
      GoRoute(
        path: Routes.coordinatorTourDetail,
        builder: (context, state) {
          final tour = state.extra as CoordinatorTour;
          return CoordinatorViewTourScreen(
            tour: tour,
            viewModel: CoordinatorTourDetailViewModel(
              coordinatorRepository: context.read<CoordinatorRepository>(),
            ),
          );
        },
      ),
      GoRoute(
        path: Routes.coordinatorTourTemplateList,
        builder: (context, state) => CoordinatorViewTourTemplateListScreen(
          viewModel: CoordinatorTourTemplateListViewModel(
            coordinatorRepository: context.read<CoordinatorRepository>(),
          ),
        ),
      ),
      GoRoute(
        path: Routes.coordinatorCreateTourTemplate,
        builder: (context, state) => CoordinatorCreateTourTemplateScreen(
          viewModel: CoordinatorCreateTourTemplateViewModel(
            coordinatorRepository: context.read<CoordinatorRepository>(),
          ),
        ),
      ),
      GoRoute(
        path: Routes.coordinatorCreateTour,
        builder: (context, state) {
          final template = state.extra as CoordinatorTourTemplate?;
          return CoordinatorCreateTourScreen(
            viewModel: CoordinatorCreateTourViewModel(
              coordinatorRepository: context.read<CoordinatorRepository>(),
            ),
            template: template,
          );
        },
      ),
      GoRoute(
        path: Routes.coordinatorViewTemplate,
        builder: (context, state) {
          final template = state.extra as CoordinatorTourTemplate;
          return CoordinatorViewTemplateScreen(
            template: template,
            viewModel: CoordinatorTourTemplateDetailViewModel(
              coordinatorRepository: context.read<CoordinatorRepository>(),
            ),
          );
        },
      ),
      GoRoute(
        path: Routes.coordinatorViewProfile,
        builder: (context, state) => CoordinatorViewProfileScreen(
          viewModel: AdminProfileViewModel(
            authRepository: context.read<AuthRepository>(),
            profileRepository: context.read<ProfileRepository>(),
          ),
        ),
      ),
      GoRoute(
        path: Routes.coordinatorUpdateProfile,
        builder: (context, state) => CoordinatorUpdateProfileScreen(
          viewModel: AdminProfileViewModel(
            authRepository: context.read<AuthRepository>(),
            profileRepository: context.read<ProfileRepository>(),
          ),
        ),
      ),
      GoRoute(
        path: Routes.coordinatorSelection,
        builder: (context, state) => const CoordinatorSelectionScreen(),
      ),
      GoRoute(
        path: Routes.coordinatorViewEndedTour,
        builder: (context, state) => const CoordinatorViewEndedTourScreen(),
      ),
      GoRoute(
        path: Routes.coordinatorViewCoachList,
        builder: (context, state) => const CoordinatorViewCoachListScreen(),
      ),
      GoRoute(
        path: Routes.coordinatorViewCoach,
        builder: (context, state) {
          final coach =
              state.extra
                  as CoordinatorCoach; // It needs a dynamic or specific type, passing what was in extra
          return CoordinatorViewCoachScreen(coach: coach);
        },
      ),
      GoRoute(
        path: Routes.coordinatorCreateCoach,
        builder: (context, state) => const CoordinatorCreateCoachScreen(),
      ),
      GoRoute(
        path: Routes.coordinatorViewCoachTemplateList,
        builder: (context, state) => CoordinatorViewCoachTemplateListScreen(
          viewModel: CoordinatorCoachTemplateListViewModel(
            coordinatorRepository: context.read<CoordinatorRepository>(),
          ),
        ),
      ),
      GoRoute(
        path: Routes.coordinatorCreateCoachTemplate,
        builder: (context, state) =>
            const CoordinatorCreateCoachTemplateScreen(),
      ),
      GoRoute(
        path: Routes.coordinatorViewReviews,
        builder: (context, state) => const CoordinatorViewReviewsScreen(),
      ),
      GoRoute(
        path: Routes.coordinatorViewTaskList,
        builder: (context, state) => const CoordinatorViewTaskListScreen(),
      ),

      // --- GUIDE ROUTES ---
      GoRoute(
        path: Routes.guideHome,
        builder: (context, state) =>
            GuideHomeScreen(viewModel: context.read<GuideHomeViewModel>()),
      ),
      GoRoute(
        path: Routes.missionDetail,
        builder: (context, state) {
          final missionId = state.pathParameters['id'] ?? '';
          return MissionDetailScreen(
            missionId: missionId,
            viewModel: context.read<MissionDetailViewModel>(),
          );
        },
      ),
      GoRoute(
        path: Routes.checkIn,
        builder: (context, state) {
          final missionId = state.pathParameters['id'] ?? '';
          return CheckInScreen(
            missionId: missionId,
            viewModel: context.read<CheckInViewModel>(),
          );
        },
      ),
      GoRoute(
        path: Routes.tourProgress,
        builder: (context, state) {
          final missionId = state.pathParameters['id'] ?? '';
          return TourProgressScreen(
            missionId: missionId,
            viewModel: context.read<TourProgressViewModel>(),
          );
        },
      ),
      GoRoute(
        path: Routes.tourCompleted,
        builder: (context, state) {
          final missionId = state.pathParameters['id'] ?? '';
          return TourCompletedScreen(
            missionId: missionId,
            viewModel: context.read<TourCompletedViewModel>(),
          );
        },
      ),

      // --- USER ROUTES ---
      GoRoute(
        path: Routes.tourHome,
        builder: (context, state) => const UserBottomNav(initialIndex: 0),
      ),
      GoRoute(
        path: Routes.tourList,
        builder: (context, state) {
          final keyword = state.uri.queryParameters['keyword'];
          final destinationId = state.uri.queryParameters['destinationId'];
          return TourListScreen(
            viewModel: context.read<TourListViewModel>(),
            keyword: keyword,
          );
        },
      ),
      GoRoute(
        path: Routes.tourDetail,
        builder: (context, state) {
          final tourId = state.pathParameters['id'] ?? '';
          return TourDetailScreen(
            viewModel: context.read<TourDetailViewModel>(),
            tourId: tourId,
          );
        },
      ),
      GoRoute(
        path: Routes.tourBooking,
        builder: (context, state) {
          final extra = state.extra as Map<String, dynamic>?;
          final tourId = state.pathParameters['id'] ?? '';
          final instanceId = extra?['instanceId'] as String? ?? '';
          final tourName = extra?['tourName'] as String? ?? '';
          final pricePerAdult = (extra?['pricePerAdult'] as num?)?.toDouble();
          final pricePerChild = (extra?['pricePerChild'] as num?)?.toDouble();
          return BookingInputScreen(
            viewModel: context.read<BookingInputViewModel>(),
            tourId: tourId,
            instanceId: instanceId,
            tourName: tourName,
            destinationName: extra?['destinationName'] as String? ?? '',
            // 'startLocation': extra?['startLocation'] as String? ?? '',
            pricePerAdult: pricePerAdult,
            pricePerChild: pricePerChild,
            startDate: extra?['startDate'] as String?,
            endDate: extra?['endDate'] as String?,
          );
        },
      ),
      GoRoute(
        path: Routes.tourBookingReview,
        builder: (context, state) {
          final extra = state.extra as Map<String, dynamic>;
          return BookingReviewScreen(
            viewModel: context.read<BookingReviewViewModel>(),
            tourId: extra['tourId'] as String,
            instanceId: extra['instanceId'] as String,
            tourName: extra['tourName'] as String,
            destinationName: extra['destinationName'] as String? ?? '',
            // startLocation: extra['startLocation'] as String? ?? '',
            tourImageUrl: extra['tourImageUrl'] as String?,
            members: extra['members'] as List<Map<String, dynamic>>,
            adultCount: extra['adultCount'] as int,
            childCount: extra['childCount'] as int,
            pricePerAdult: extra['pricePerAdult'] as double,
            pricePerChild: extra['pricePerChild'] as double,
            specialRequests: extra['specialRequests'] as String,
            startDate: extra['startDate'] as String,
            endDate: extra['endDate'] as String,
          );
        },
      ),
      GoRoute(
        path: Routes.vnpayPayment,
        builder: (context, state) {
          final extra = state.extra as Map<String, dynamic>;
          return VNPayPaymentScreen(
            viewModel: context.read<VNPayPaymentViewModel>(),
            bookingId: extra['bookingId'] as String,
            paymentUrl: extra['paymentUrl'] as String,
            transactionId: extra['transactionId'] as String,
            amount: extra['amount'] as double,
            expiresAt: extra['expiresAt'] as String?,
            tourName: extra['tourName'] as String,
          );
        },
      ),
      GoRoute(
        path: Routes.paymentResult,
        builder: (context, state) {
          final extra = state.extra as Map<String, dynamic>?;
          return PaymentResultScreen(
            viewModel: context.read<PaymentResultViewModel>(),
            txnRef: extra?['txnRef'] as String?,
            deeplinkStatus: extra?['deeplinkStatus'] as String?,
            responseCode: extra?['responseCode'] as String?,
            bookingId: extra?['bookingId'] as String?,
          );
        },
      ),
      GoRoute(
        path: Routes.bookingDetailScreen,
        builder: (context, state) {
          final pathId = state.pathParameters['id'];
          final extra = state.extra as Map<String, dynamic>?;
          final bookingId = pathId ?? (extra?['bookingId'] as String?) ?? '';
          return BookingDetailScreen(
            viewModel: context.read<BookingDetailViewModel>(),
            bookingId: bookingId,
          );
        },
      ),
      GoRoute(
        path: Routes.cancelConfirmation,
        builder: (context, state) {
          final pathId = state.pathParameters['id'];
          final extra = state.extra as Map<String, dynamic>?;
          final bookingId = pathId ?? (extra?['bookingId'] as String?) ?? '';
          return CancelBookingScreen(
            viewModel: context.read<CancelBookingViewModel>(),
            bookingId: bookingId,
            bookingDetail: extra?['bookingDetail'],
          );
        },
      ),
      GoRoute(
        path: Routes.cancellationSuccess,
        builder: (context, state) {
          final extra = state.extra as Map<String, dynamic>?;
          return CancelSuccessScreen(
            bookingId: extra?['bookingId'] as String? ?? '',
            tourName: extra?['tourName'] as String? ?? '',
            refundAmount: extra?['refundAmount'] as double? ?? 0,
            refundPercentage: extra?['refundPercentage'] as double? ?? 0,
          );
        },
      ),

      // --- TRIP (COACH BOOKING) ROUTES ---
      GoRoute(
        path: Routes.tripHome,
        builder: (context, state) => const TripHomeScreen(),
      ),
      GoRoute(
        path: Routes.tripList,
        builder: (context, state) {
          return TripListScreen();
        },
      ),
      GoRoute(
        path: Routes.tripSeatPicker,
        builder: (context, state) {
          return const SeatPickerScreen();
        },
      ),
      GoRoute(
        path: Routes.tripBookingInput,
        builder: (context, state) {
          return TripBookingInputScreen();
        },
      ),
      GoRoute(
        path: Routes.tripBookingReview,
        builder: (context, state) {
          return ChangeNotifierProvider(
            create: (_) => TripBookingReviewViewModel(
              tripService: context.read<TripService>(),
            ),
            child: const TripBookingReviewScreen(),
          );
        },
      ),
      GoRoute(
        path: Routes.tripPayment,
        builder: (context, state) {
          return TripPaymentScreen();
        },
      ),
      GoRoute(
        path: Routes.tripPaymentResult,
        builder: (context, state) {
          final extra = state.extra as Map<String, dynamic>?;
          return TripPaymentResultScreen(
            txnRef: extra?['txnRef'] as String?,
            deeplinkStatus: extra?['deeplinkStatus'] as String?,
            responseCode: extra?['responseCode'] as String?,
            bookingId: extra?['bookingId'] as String?,
          );
        },
      ),
      GoRoute(
        path: Routes.tripMyBookings,
        builder: (context, state) {
          return const MyTripBookingScreen();
        },
      ),
      GoRoute(
        path: Routes.tripBookingDetail,
        builder: (context, state) {
          final bookingId = state.pathParameters['id'] ?? '';
          return TripBookingDetailScreen(bookingId: bookingId);
        },
      ),
      GoRoute(
        path: Routes.tripCancelConfirmation,
        builder: (context, state) {
          final bookingId = state.pathParameters['id'] ?? '';
          final extra = state.extra as Map<String, dynamic>?;
          return TripCancelScreen(
            bookingId: bookingId,
            booking: extra?['booking'],
          );
        },
      ),
      GoRoute(
        path: Routes.tripCancelSuccess,
        builder: (context, state) {
          final extra = state.extra as Map<String, dynamic>?;
          return TripCancelSuccessScreen(
            cancelData: extra?['cancelData'],
            booking: extra?['booking'],
          );
        },
      ),

      // --- HOTEL ROUTES ---
      GoRoute(
        path: Routes.hotelHome,
        builder: (context, state) => ChangeNotifierProvider(
          create: (_) => HotelHomeViewModel(),
          child: const HotelHomeScreen(),
        ),
      ),
      GoRoute(
        path: Routes.hotelDetail,
        builder: (context, state) {
          return ChangeNotifierProvider(
            create: (_) => HotelDetailViewModel(),
            child: const HotelDetailScreen(),
          );
        },
      ),
      GoRoute(
        path: Routes.hotelRoomList,
        builder: (context, state) => const HotelRoomListScreen(),
      ),
      GoRoute(
        path: Routes.hotelBookingInput,
        builder: (context, state) => const HotelBookingInputScreen(),
      ),
      GoRoute(
        path: Routes.hotelBookingReview,
        builder: (context, state) => const HotelBookingReviewScreen(),
      ),
      GoRoute(
        path: Routes.hotelPayment,
        builder: (context, state) => const HotelPaymentScreen(),
      ),
      GoRoute(
        path: Routes.hotelPaymentResult,
        builder: (context, state) => const HotelPaymentResultScreen(),
      ),
      GoRoute(
        path: Routes.hotelMyBookings,
        builder: (context, state) => ChangeNotifierProvider(
          create: (_) => HotelMyBookingViewModel(),
          child: const HotelMyBookingScreen(),
        ),
      ),
      GoRoute(
        path: Routes.hotelBookingDetail,
        builder: (context, state) {
          final bookingId = state.pathParameters['id'] ?? '';
          return ChangeNotifierProvider(
            create: (_) => HotelBookingDetailViewModel(),
            child: HotelBookingDetailScreen(),
          );
        },
      ),
      GoRoute(
        path: Routes.hotelCancel,
        builder: (context, state) => const HotelCancelScreen(),
      ),
      GoRoute(
        path: Routes.hotelCancelSuccess,
        builder: (context, state) => const HotelCancelSuccessScreen(),
      ),
      GoRoute(
        path: Routes.hotelAddonList,
        builder: (context, state) => const HotelAddonListScreen(),
      ),
      GoRoute(
        path: Routes.hotelAddonPayment,
        builder: (context, state) => const HotelAddonPaymentScreen(),
      ),
      GoRoute(
        path: Routes.hotelAddonPaymentResult,
        builder: (context, state) => const HotelAddonPaymentSuccessScreen(),
      ),
      GoRoute(
        path: Routes.hotelCheckout,
        builder: (context, state) => const HotelCheckoutScreen(),
      ),
      GoRoute(
        path: Routes.hotelCheckoutSuccess,
        builder: (context, state) => const HotelCheckoutSuccessScreen(),
      ),

      // --- ADMIN ROUTES ---
      GoRoute(
        path: Routes.adminMain,
        builder: (context, state) => MultiProvider(
          providers: [
            ChangeNotifierProvider(
              create: (context) => DashboardViewModel(
                adminRepository: context.read<AdminRepository>(),
              ),
            ),
            ChangeNotifierProvider(
              create: (context) => AccountManagementViewModel(
                adminRepository: context.read<AdminRepository>(),
              ),
            ),
            ChangeNotifierProvider(
              create: (context) => CreateAccountViewModel(
                adminRepository: context.read<AdminRepository>(),
              ),
            ),
            ChangeNotifierProvider(
              create: (context) => AdminProfileViewModel(
                authRepository: context.read<AuthRepository>(),
                profileRepository: context.read<ProfileRepository>(),
              ),
            ),
            ChangeNotifierProvider(
              create: (context) => TourManagementViewModel(
                adminRepository: context.read<AdminRepository>(),
              ),
            ),
            ChangeNotifierProvider(
              create: (context) => VehicleManagementViewModel(
                adminRepository: context.read<AdminRepository>(),
              ),
            ),
            ChangeNotifierProvider(
              create: (context) => HotelManagementViewModel(
                adminRepository: context.read<AdminRepository>(),
              ),
            ),
          ],
          child: const AdminMainScreen(),
        ),
      ),
      // GoRoute(
      //   path: Routes.adminDashboard,
      //   builder: (context, state) => ChangeNotifierProvider(
      //     create: (context) => DashboardViewModel(
      //       adminRepository: context.read<AdminRepository>(),
      //     ),
      //     child: DashboardScreen(
      //       viewModel: context.read<DashboardViewModel>(),
      //     ),
      //   ),
      // ),
      GoRoute(
        path: Routes.adminCreateAccount,
        builder: (context, state) => CreateAccountScreen(
          viewModel: CreateAccountViewModel(
            adminRepository: context.read<AdminRepository>(),
          ),
        ),
      ),
      GoRoute(
        path: Routes.adminCreateHotel,
        builder: (context, state) => CreateHotelScreen(
          viewModel: CreateHotelViewModel(
            adminRepository: context.read<AdminRepository>(),
          ),
        ),
      ),
      GoRoute(
        path: Routes.adminHotelManagement,
        builder: (context, state) {
          return (HotelManagementScreen(
            viewModel: HotelManagementViewModel(
              adminRepository: context.read<AdminRepository>(),
            ),
          ));
        },
      ),
      GoRoute(
        path: Routes.adminCreateVehicle,
        builder: (context, state) => CreateVehicleScreen(
          viewModel: CreateVehicleViewModel(
            adminRepository: context.read<AdminRepository>(),
          ),
        ),
      ),
      GoRoute(
        path: Routes.adminAccountManagement,
        builder: (context, state) => AccountManagementScreen(
          viewModel: AccountManagementViewModel(
            adminRepository: context.read<AdminRepository>(),
          ),
        ),
      ),
      GoRoute(
        path: Routes.adminViewDetailAccountWithId(':id'),
        builder: (context, state) {
          final accountId = state.pathParameters['id']!;
          return ChangeNotifierProvider(
            create: (context) => ViewDetailAccountViewModel(
              adminRepository: context.read<AdminRepository>(),
            ),
            child: Consumer<ViewDetailAccountViewModel>(
              builder: (context, viewModel, child) {
                return ViewDetailAccountScreen(
                  viewModel: viewModel,
                  accountId: accountId,
                );
              },
            ),
          );
        },
      ),
      GoRoute(
        path: Routes.adminUpdateHotelWithId(':id'),
        builder: (context, state) {
          final hotelId = state.pathParameters['id']!;
          return ChangeNotifierProvider(
            create: (context) => UpdateHotelViewModel(
              adminRepository: context.read<AdminRepository>(),
            ),
            child: Consumer<UpdateHotelViewModel>(
              builder: (context, viewModel, child) {
                return UpdateHotelScreen(
                  viewModel: viewModel, 
                  hotelId: hotelId,
                );
              },
            ),
          );
        },
      ),
      GoRoute(
        path: Routes.adminVehicleManagement,
        builder: (context, state) => VehicleManagementScreen(
          viewModel: VehicleManagementViewModel(
            adminRepository: context.read<AdminRepository>(),
          ),
        ),
      ),
      GoRoute(
        path: Routes.adminUpdateVehicleWithId(':id'),
        builder: (context, state) {
          final vehicleId = state.pathParameters['id']!;
          return ChangeNotifierProvider(
            create: (context) => UpdateVehicleViewModel(
              adminRepository: context.read<AdminRepository>(),
            ),
            child: Consumer<UpdateVehicleViewModel>(
              builder: (context, viewModel, child) {
                return UpdateVehicleScreen(
                  viewModel: viewModel,
                  vehicleId: vehicleId,
                );
              },
            ),
          );
        },
      ),
      GoRoute(
        path: Routes.adminTourManagement,
        builder: (context, state) => TourManagementScreen(
          viewModel: TourManagementViewModel(
            adminRepository: context.read<AdminRepository>(),
          ),
        ),
      ),
      GoRoute(
        path: Routes.adminUpdateProfile,
        builder: (context, state) => UpdateProfileScreen(
          viewModel: AdminProfileViewModel(
            authRepository: context.read<AuthRepository>(),
            profileRepository: context.read<ProfileRepository>(),
          ),
        ),
      ),
      GoRoute(
        path: Routes.adminViewProfile,
        builder: (context, state) => AdminViewProfileScreen(
          viewModel: AdminProfileViewModel(
            authRepository: context.read<AuthRepository>(),
            profileRepository: context.read<ProfileRepository>(),
          ),
        ),
      ),
      GoRoute(
        path: Routes.adminViewRoomtypeList,
        builder: (context, state) => const ViewRoomtypeListScreen(),
      ),
      GoRoute(
        path: Routes.adminViewRoomtype,
        builder: (context, state) {
          final extra = state.extra as Map<String, dynamic>?;
          return ViewRoomtypeScreen(roomType: extra?['roomType']);
        },
      ),
      GoRoute(
        path: Routes.adminCreateRoomType,
        builder: (context, state) => const CreateRoomTypeScreen(),
      ),
      GoRoute(
        path: Routes.adminUpdateRoomType,
        builder: (context, state) {
          final extra = state.extra as Map<String, dynamic>?;
          return UpdateRoomTypeScreen(roomType: extra?['roomType']);
        },
      ),
      GoRoute(
        path: Routes.adminAmenityManagement,
        builder: (context, state) => const AmenityManagementScreen(),
      ),
      GoRoute(
        path: Routes.adminCreateAmenity,
        builder: (context, state) => const CreateAmenityScreen(),
      ),
      GoRoute(
        path: Routes.adminUpdateAmenity,
        builder: (context, state) {
          final extra = state.extra as Map<String, dynamic>?;
          return UpdateAmenityScreen(
            amenityType: extra?['amenityType'] as String?,
            amenityName: extra?['amenityName'] as String?,
            iconData: extra?['iconData'] as IconData?,
          );
        },
      ),
      GoRoute(
        path: Routes.adminHotelServiceList,
        builder: (context, state) => const ViewHotelServiceListScreen(),
      ),
      GoRoute(
        path: Routes.adminCreateHotelService,
        builder: (context, state) => const CreateHotelServiceScreen(),
      ),
      GoRoute(
        path: Routes.adminUpdateHotelService,
        builder: (context, state) {
          final extra = state.extra as Map<String, dynamic>?;
          return UpdateHotelServiceScreen(
            serviceType: extra?['serviceType'] as String?,
            serviceName: extra?['serviceName'] as String?,
            unit: extra?['unit'] as String?,
            price: extra?['price'] as String?,
          );
        },
      ),

      //======Receptionist========
      GoRoute(
        path: Routes.recepMain,
        builder: (context, state) => const RecepMainScreen(),
      ),
      GoRoute(
        path: Routes.recepDashboard,
        builder: (context, state) => const RecepDashboardScreen(),
      ),
      GoRoute(
        path: Routes.recepCheckInOut,
        builder: (context, state) => const RecepViewCheckinoutListScreen(),
      ),
      GoRoute(
        path: Routes.recepHotel,
        builder: (context, state) => const RecepViewHotelRoomScreen(),
      ),
      GoRoute(
        path: Routes.recepAddon,
        builder: (context, state) => const RecepViewAddonListScreen(),
      ),
      GoRoute(
        path: Routes.recepProfile,
        builder: (context, state) => const RecepViewProfileScreen(),
      ),

      // ==== User Profile Routes ====
      GoRoute(
        path: Routes.userProfile,
        builder: (context, state) => ChangeNotifierProvider(
          create: (context) => ProfileViewModel(
            profileService: context.read<ProfileService>(),
            securityStorageService: context.read<SecurityStorageService>(),
            authRepository: context.read<AuthRepository>(),
          ),
          child: const UserProfileScreen(),
        ),
      ),
      GoRoute(
        path: Routes.userEditProfile,
        builder: (context, state) => ChangeNotifierProvider(
          create: (context) => ProfileViewModel(
            profileService: context.read<ProfileService>(),
            securityStorageService: context.read<SecurityStorageService>(),
            authRepository: context.read<AuthRepository>(),
          ),
          child: const UserEditProfileScreen(),
        ),
      ),
      GoRoute(
        path: Routes.userChangePassword,
        builder: (context, state) => ChangeNotifierProvider(
          create: (context) => ProfileViewModel(
            profileService: context.read<ProfileService>(),
            securityStorageService: context.read<SecurityStorageService>(),
            authRepository: context.read<AuthRepository>(),
          ),
          child: const UserChangePasswordScreen(),
        ),
      ),
      GoRoute(
        path: Routes.userSettings,
        builder: (context, state) => ChangeNotifierProvider(
          create: (context) => ProfileViewModel(
            profileService: context.read<ProfileService>(),
            securityStorageService: context.read<SecurityStorageService>(),
            authRepository: context.read<AuthRepository>(),
          ),
          child: const UserSettingsScreen(),
        ),
      ),
    ],
  );

  onInitialized?.call(router);
  return router;
}
