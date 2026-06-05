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
  static const String adminAddHotelInfo = '/admin/create-hotel/info';
  static const String adminCreateVehicle = '/admin/create-vehicle';
  static String adminUpdateHotelWithId(String hotelId) =>
      '/admin/update-hotel/$hotelId';
  static String adminUpdateVehicleWithId(String vehicleId) =>
      '/admin/update-vehicle/$vehicleId';
  static String adminViewDetailAccountWithId(String id) =>
      '/admin/view-detail-account/$id';
  static String adminViewHotelRoomList(String hotelId) =>
      '/admin/hotels/$hotelId/rooms';
  static const String adminViewProfile = '/admin/view-profile';
  static const String adminUpdateProfile = '/admin/update-profile';

  // Admin Hotel Detail
  static const String adminHotelDetail = '/admin/hotel-detail';
  static const String adminImageManagement = '/admin/image-management';

  // Admin Room Type
  static const String adminViewRoomtypeList = '/admin/room-types';
  static const String adminViewRoomtype = '/admin/room-types/view';
  static const String adminCreateRoomType = '/admin/room-types/create';
  static const String adminUpdateRoomType = '/admin/room-types/update';

  // Admin Hotel Service
  static const String adminHotelServiceList = '/admin/hotel-services';
  static const String adminCreateHotelService = '/admin/hotel-services/create';
  static const String adminUpdateHotelService = '/admin/hotel-services/update';

  // Admin Amenity
  static const String adminAmenityManagement = '/admin/amenities';
  static const String adminCreateAmenity = '/admin/amenities/create';
  static const String adminUpdateAmenity = '/admin/amenities/update';

  // Admin Refund Policy
  static const String adminRefundPolicyManagement = '/admin/refund-policies';
  static const String adminCreateRefundPolicy = '/admin/refund-policies/create';
  static const String adminUpdateRefundPolicy = '/admin/refund-policies/update';

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
  static const String coordinatorSelection = '/coordinator/selection';
  
  // Coordinator Tour
  static const String coordinatorTourDetail = '/coordinator/tour-detail';
  static const String coordinatorTourTemplateList = '/coordinator/tour-templates';
  static const String coordinatorCreateTourTemplate = '/coordinator/create-tour-template';
  static const String coordinatorCreateTour = '/coordinator/create-tour';
  static const String coordinatorViewTemplate = '/coordinator/view-template';
  static const String coordinatorViewEndedTour = '/coordinator/ended-tour';

  // Coordinator Coach
  static const String coordinatorViewCoachList = '/coordinator/coach-list';
  static const String coordinatorViewCoach = '/coordinator/coach-view';
  static const String coordinatorCreateCoach = '/coordinator/create-coach';
  static const String coordinatorViewCoachTemplateList = '/coordinator/coach-templates';
  static const String coordinatorCreateCoachTemplate = '/coordinator/create-coach-template';

  // Coordinator Misc
  static const String coordinatorViewReviews = '/coordinator/reviews';
  static const String coordinatorViewTaskList = '/coordinator/tasks';

  static const String coordinatorMain = '/coordinator-main';
  static const String coordinatorViewProfile = '/coordinator/view-profile';
  static const String coordinatorUpdateProfile = '/coordinator/update-profile';

  // Guide
  static const String guideHome = '/guide/home';
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
  static const String recepAddOnList = '/recep/add-on';
  static const String recepBookingBill = '/recep/booking-bill';
  static const String recepProfile = '/recep/profile';
  static const String recepRoomSelection = '/recep/room-selection/:id';
  static const String recepDetailBooking = '/recep/detail-booking/:id';

  // User Profile
  static const String userProfile = '/user/profile';
  static const String userEditProfile = '/user/profile/edit';
  static const String userChangePassword = '/user/profile/change-password';
  static const String userSettings = '/user/profile/settings';
}
