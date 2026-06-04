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
  static const String home = '/tour-home';
  static const String testHome = '/test-home';
  static const String tourHome = '/tour-home';

  // Tour nhóm
  static const String tourList = '/tours';
  static const String tourDetail = '/tour/:id';
  static const String tourBooking = '/tour/:id/book';
  static const String tourBookingReview = '/tour/:id/book/review';
  static const String vnpayPayment = '/payment/vnpay';
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

  // Trip/Coach Booking nhóm
  static const String tripHome = '/trip-home';
  static const String tripList = '/trip/list';
  static const String tripSeatPicker = '/trip/seat-picker';
  static const String tripBookingInput = '/trip/book/input';
  static const String tripBookingReview = '/trip/book/review';
  static const String tripPayment = '/trip/payment';
  static const String tripPaymentResult = '/trip/payment/result';
  static const String tripMyBookings = '/trip/my-bookings';
  static const String tripBookingDetail = '/trip/booking/:id';
  static const String tripCancelConfirmation = '/trip/booking/:id/cancel';
  static const String tripCancelSuccess = '/trip/booking/:id/cancel/success';

  // Coordinator
  static const String coordinatorHome = '/coordinator/main';
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
  static const String guideCoachTrips = '/guide/coach-trips';
  static const String guideCoachTripDetail = '/guide/coach-trips/:id';
  static const String guideCoachTripPassengers =
      '/guide/coach-trips/:id/passengers';
  static const String missionDetail = '/guide/mission/:id';
  static const String checkIn = '/guide/mission/:id/check-in';
  static const String tourProgress = '/guide/mission/:id/progress';
  static const String tourCompleted = '/guide/mission/:id/completed';
  static const String guideEditProfile = '/guide/profile/edit';
  static const String guideChangePassword = '/guide/profile/change-password';

  // Hotel nhóm
  static const String hotelHome = '/hotel/home';
  static const String hotelList = '/hotel/list';
  static const String hotelDetail = '/hotel/:id';
  static const String hotelRoomList = '/hotel/:id/rooms';
  static const String hotelBookingInput = '/hotel/book/input';
  static const String hotelBookingReview = '/hotel/book/review';
  static const String hotelPayment = '/hotel/payment';
  static const String hotelPaymentResult = '/hotel/payment/result';
  static const String hotelMyBookings = '/hotel/my-bookings';
  static const String hotelBookingDetail = '/hotel/booking/:id';
  static const String hotelCancel = '/hotel/booking/:id/cancel';
  static const String hotelCancelSuccess = '/hotel/booking/:id/cancel/success';
  static const String hotelAddonList = '/hotel/booking/:id/addons';
  static const String hotelAddonPayment = '/hotel/addon/payment';
  static const String hotelAddonPaymentResult = '/hotel/addon/payment/result';
  static const String hotelCheckout = '/hotel/booking/:id/checkout';
  static const String hotelCheckoutSuccess = '/hotel/checkout/success';
  // Recep
  static const String recepMain = '/recep/main';
  static const String recepDashboard = '/recep/dashboard';
  static const String recepCheckInOut = '/recep/check-in-out';
  static const String recepHotel = '/recep/hotel';
  static const String recepAddon = '/recep/addon';
  static const String recepProfile = '/recep/profile';

  // User Profile
  static const String userProfile = '/user/profile';
  static const String userEditProfile = '/user/profile/edit';
  static const String userChangePassword = '/user/profile/change-password';
  static const String userSettings = '/user/profile/settings';
}
