class Routes {
  // Authentication nhóm
  static const String splash = '/splash';
  static const String login = '/login';
  static const String register = '/register';
  static const String otp = '/otp';
  static const String forgotPassword = '/forgot-password';
  static const String confirmPassword = '/confirm-password';
  static const String roleSelection = '/role-selection';

  // Main Features nhóm
  static const String home = '/home';
  static const String testHome = '/test-home';
  static const String tourHome = '/tour-home';

  // Tour nhóm
  static const String tourList = '/tours';
  static const String tourDetail = '/tour/:id';
  static const String tourBooking = '/tour/:id/book';
  static const String tourBookingReview = '/tour/:id/book/review';
  static const String vnpayPayment = '/payment/vnpay';
  static const String bookingSuccess = '/payment/success';
  static const String paymentResult = '/payment/result';
  static const String bookingDetail = '/booking/:id';

  // Admin screen
  static const String adminMain = '/admin/main';
  static const String adminDashboard = '/admin/dashboard';
  static const String adminCreateAccount = '/admin/create-account';
  static const String adminAccountManagement = '/admin/account-management';
  static const String adminHotelManagement = '/admin/hotel-management';
  static const String adminTourManagement = '/admin/tour-management';
  static const String adminVehicleManagement = '/admin/vehicle-management';
  static const String adminCreateHotel = '/admin/create-hotel';
  static const String adminCreateVehicle = '/admin/create-vehicle';
  static String adminUpdateHotelWithId(String hotelId) =>
      '/admin/update-hotel/$hotelId';
  static String adminUpdateVehicleWithId(String vehicleId) =>
      '/admin/update-vehicle/$vehicleId';
  static String adminViewDetailAccountWithId(String id) =>
      '/admin/view-detail-account/$id';
  static const String adminUpdateProfile = '/admin/update-profile';

  /* HƯỚNG DẪN: Khi thêm Repository/Feature mới (ví dụ: Hotel, Car):
  Hãy thêm các hằng số đường dẫn vào đây.
  static const String hotelList = '/hotels';
  static const String hotelDetail = '/hotel/:id'; // :id là tham số truyền vào
  */
  // Booking Detail
  static const String bookingDetailScreen = '/booking-detail';

  // Cancel Confirmation
  static const String cancelConfirmation = '/booking/:id/cancel';

  // Cancellation Success
  static const String cancellationSuccess = '/booking/:id/cancel/success';

  // Coordinator
  static const String coordinatorHome = '/coordinator-home';
  static const String coordinatorTourDetail = '/coordinator/tour-detail';
  static const String coordinatorTourTemplateList =
      '/coordinator/tour-templates';
  static const String coordinatorCreateTourTemplate =
      '/coordinator/create-tour-template';
  static const String coordinatorCreateTour = '/coordinator/create-tour';
  static const String coordinatorViewTemplate = '/coordinator/view-template';
  static const String coordinatorMain = '/coordinator-main';
  static const String coordinatorViewProfile = '/coordinator/view-profile';
  static const String coordinatorUpdateProfile = '/coordinator/update-profile';

  // Guide
  static const String guideHome = '/guide/home';
  static const String missionDetail = '/guide/mission/:id';
  static const String checkIn = '/guide/mission/:id/check-in';
  static const String tourProgress = '/guide/mission/:id/progress';
  static const String tourCompleted = '/guide/mission/:id/completed';

  // Chat
  static const String chat = '/chat';
}
