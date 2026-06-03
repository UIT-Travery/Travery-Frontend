"components": {
    "schemas": {
      "BaseUserProfileResponse": {
        "type": "object",
        "properties": {
          "id": {
            "type": "string",
            "format": "uuid"
          },
          "fullName": {
            "type": "string"
          },
          "email": {
            "type": "string"
          },
          "phoneNumber": {
            "type": "string"
          },
          "avatarUrl": {
            "type": "string"
          },
          "status": {
            "type": "string",
            "enum": [
              "ACTIVE",
              "PENDING",
              "DELETED",
              "BANNED"
            ]
          },
          "role": {
            "type": "string",
            "enum": [
              "TOURIST",
              "RECEPTIONIST",
              "COORDINATOR",
              "GUIDE",
              "ADMIN"
            ]
          },
          "createdAt": {
            "type": "string",
            "format": "date-time"
          }
        }
      },
      "SingleResponseBaseUserProfileResponse": {
        "type": "object",
        "properties": {
          "httpStatus": {
            "type": "integer",
            "format": "int32"
          },
          "message": {
            "type": "string"
          },
          "data": {
            "$ref": "#/components/schemas/BaseUserProfileResponse"
          }
        }
      },
      "UpdateCoachTripStatusRequest": {
        "required": [
          "status"
        ],
        "type": "object",
        "properties": {
          "status": {
            "type": "string",
            "enum": [
              "OPEN",
              "FULL",
              "IN_PROGRESS",
              "COMPLETED",
              "CANCELLED"
            ]
          }
        }
      },
      "CoachTripDetailResponse": {
        "type": "object",
        "properties": {
          "id": {
            "type": "string",
            "format": "uuid"
          },
          "departureTime": {
            "type": "string",
            "format": "date-time"
          },
          "arrivalTime": {
            "type": "string",
            "format": "date-time"
          },
          "status": {
            "type": "string",
            "enum": [
              "OPEN",
              "FULL",
              "IN_PROGRESS",
              "COMPLETED",
              "CANCELLED"
            ]
          },
          "routeId": {
            "type": "string",
            "format": "uuid"
          },
          "originDestinationName": {
            "type": "string"
          },
          "destinationDestinationName": {
            "type": "string"
          },
          "basePrice": {
            "type": "number"
          },
          "coachId": {
            "type": "string",
            "format": "uuid"
          },
          "coachLicensePlate": {
            "type": "string"
          },
          "coachType": {
            "type": "string"
          },
          "driverId": {
            "type": "string",
            "format": "uuid"
          },
          "driverName": {
            "type": "string"
          },
          "driverPhone": {
            "type": "string"
          },
          "totalSeats": {
            "type": "integer",
            "format": "int32"
          },
          "availableSeats": {
            "type": "integer",
            "format": "int32"
          },
          "bookingsCount": {
            "type": "integer",
            "format": "int32"
          },
          "passengersCount": {
            "type": "integer",
            "format": "int32"
          }
        }
      },
      "SingleResponseCoachTripDetailResponse": {
        "type": "object",
        "properties": {
          "httpStatus": {
            "type": "integer",
            "format": "int32"
          },
          "message": {
            "type": "string"
          },
          "data": {
            "$ref": "#/components/schemas/CoachTripDetailResponse"
          }
        }
      },
      "SuccessResponse": {
        "type": "object",
        "properties": {
          "httpStatus": {
            "type": "integer",
            "format": "int32"
          },
          "message": {
            "type": "string"
          }
        }
      },
      "ReassignDriverRequest": {
        "required": [
          "driverId"
        ],
        "type": "object",
        "properties": {
          "driverId": {
            "type": "string",
            "format": "uuid"
          }
        }
      },
      "ReassignCoachRequest": {
        "required": [
          "coachId"
        ],
        "type": "object",
        "properties": {
          "coachId": {
            "type": "string",
            "format": "uuid"
          }
        }
      },
      "UpdateCoachRequest": {
        "required": [
          "coachType",
          "licensePlate",
          "seatLayoutId"
        ],
        "type": "object",
        "properties": {
          "licensePlate": {
            "maxLength": 20,
            "minLength": 0,
            "type": "string"
          },
          "coachType": {
            "type": "string",
            "enum": [
              "SEAT",
              "BED",
              "LIMOUSINE"
            ]
          },
          "capacity": {
            "minimum": 1,
            "type": "integer",
            "format": "int32"
          },
          "seatLayoutId": {
            "type": "string",
            "format": "uuid"
          }
        }
      },
      "CoachResponse": {
        "type": "object",
        "properties": {
          "id": {
            "type": "string",
            "format": "uuid"
          },
          "licensePlate": {
            "type": "string"
          },
          "coachType": {
            "type": "string",
            "enum": [
              "SEAT",
              "BED",
              "LIMOUSINE"
            ]
          },
          "capacity": {
            "type": "integer",
            "format": "int32"
          },
          "status": {
            "type": "string",
            "enum": [
              "ACTIVE",
              "MAINTENANCE",
              "INACTIVE"
            ]
          },
          "seatLayoutName": {
            "type": "string"
          }
        }
      },
      "SingleResponseCoachResponse": {
        "type": "object",
        "properties": {
          "httpStatus": {
            "type": "integer",
            "format": "int32"
          },
          "message": {
            "type": "string"
          },
          "data": {
            "$ref": "#/components/schemas/CoachResponse"
          }
        }
      },
      "SingleResponseTourResponse": {
        "type": "object",
        "properties": {
          "httpStatus": {
            "type": "integer",
            "format": "int32"
          },
          "message": {
            "type": "string"
          },
          "data": {
            "$ref": "#/components/schemas/TourResponse"
          }
        }
      },
      "TourResponse": {
        "type": "object",
        "properties": {
          "id": {
            "type": "string",
            "format": "uuid"
          },
          "name": {
            "type": "string"
          },
          "description": {
            "type": "string"
          },
          "destinationName": {
            "type": "string"
          },
          "hotelName": {
            "type": "string"
          },
          "pickupLocation": {
            "type": "string"
          },
          "pricePerAdult": {
            "type": "number"
          },
          "pricePerChild": {
            "type": "number"
          },
          "minParticipants": {
            "type": "integer",
            "format": "int32"
          },
          "maxParticipants": {
            "type": "integer",
            "format": "int32"
          },
          "custom": {
            "type": "boolean"
          }
        }
      },
      "BookingMemberRequest": {
        "required": [
          "dateOfBirth",
          "fullName",
          "identityNumber",
          "memberType"
        ],
        "type": "object",
        "properties": {
          "fullName": {
            "type": "string"
          },
          "identityNumber": {
            "type": "string"
          },
          "dateOfBirth": {
            "type": "string",
            "format": "date"
          },
          "memberType": {
            "type": "string",
            "enum": [
              "ADULT",
              "CHILD"
            ]
          }
        }
      },
      "CreateTourBookingRequest": {
        "required": [
          "members"
        ],
        "type": "object",
        "properties": {
          "members": {
            "type": "array",
            "items": {
              "$ref": "#/components/schemas/BookingMemberRequest"
            }
          },
          "specialRequests": {
            "type": "string"
          }
        }
      },
      "BookingMemberResponse": {
        "type": "object",
        "properties": {
          "id": {
            "type": "string",
            "format": "uuid"
          },
          "fullName": {
            "type": "string"
          },
          "identityNumber": {
            "type": "string"
          },
          "dateOfBirth": {
            "type": "string",
            "format": "date"
          },
          "attendanceStatus": {
            "type": "string",
            "enum": [
              "NOT_CHECKED",
              "PRESENT",
              "NO_SHOW"
            ]
          },
          "memberType": {
            "type": "string",
            "enum": [
              "ADULT",
              "CHILD"
            ]
          }
        }
      },
      "PaymentInitiationResponse": {
        "type": "object",
        "properties": {
          "transactionId": {
            "type": "string",
            "format": "uuid"
          },
          "amount": {
            "type": "number"
          },
          "paymentUrl": {
            "type": "string"
          },
          "expiresAt": {
            "type": "string",
            "format": "date-time"
          }
        }
      },
      "SingleResponseTourBookingResponse": {
        "type": "object",
        "properties": {
          "httpStatus": {
            "type": "integer",
            "format": "int32"
          },
          "message": {
            "type": "string"
          },
          "data": {
            "$ref": "#/components/schemas/TourBookingResponse"
          }
        }
      },
      "TourBookingResponse": {
        "type": "object",
        "properties": {
          "id": {
            "type": "string",
            "format": "uuid"
          },
          "customerName": {
            "type": "string"
          },
          "customerPhone": {
            "type": "string"
          },
          "specialRequests": {
            "type": "string"
          },
          "status": {
            "type": "string",
            "enum": [
              "PENDING",
              "PAID",
              "CHECKED_IN",
              "CHECKED_OUT",
              "CANCELLED",
              "NO_SHOW"
            ]
          },
          "totalPrice": {
            "type": "number"
          },
          "pricePerAdultAtBooking": {
            "type": "number"
          },
          "pricePerChildAtBooking": {
            "type": "number"
          },
          "paymentDeadline": {
            "type": "string",
            "format": "date-time"
          },
          "tourName": {
            "type": "string"
          },
          "startDate": {
            "type": "string",
            "format": "date"
          },
          "endDate": {
            "type": "string",
            "format": "date"
          },
          "members": {
            "type": "array",
            "items": {
              "$ref": "#/components/schemas/BookingMemberResponse"
            }
          },
          "payment": {
            "$ref": "#/components/schemas/PaymentInitiationResponse"
          }
        }
      },
      "TourIncidentReportRequest": {
        "required": [
          "description",
          "severity",
          "title"
        ],
        "type": "object",
        "properties": {
          "title": {
            "type": "string"
          },
          "description": {
            "type": "string"
          },
          "severity": {
            "type": "string",
            "enum": [
              "LOW",
              "MEDIUM",
              "HIGH",
              "CRITICAL"
            ]
          }
        }
      },
      "SingleResponseTourIncidentResponse": {
        "type": "object",
        "properties": {
          "httpStatus": {
            "type": "integer",
            "format": "int32"
          },
          "message": {
            "type": "string"
          },
          "data": {
            "$ref": "#/components/schemas/TourIncidentResponse"
          }
        }
      },
      "TourIncidentResponse": {
        "type": "object",
        "properties": {
          "id": {
            "type": "string",
            "format": "uuid"
          },
          "tourInstanceId": {
            "type": "string",
            "format": "uuid"
          },
          "reporterId": {
            "type": "string",
            "format": "uuid"
          },
          "reporterName": {
            "type": "string"
          },
          "title": {
            "type": "string"
          },
          "description": {
            "type": "string"
          },
          "severity": {
            "type": "string",
            "enum": [
              "LOW",
              "MEDIUM",
              "HIGH",
              "CRITICAL"
            ]
          },
          "status": {
            "type": "string",
            "enum": [
              "PENDING",
              "PROCESSING",
              "RESOLVED",
              "CLOSED"
            ]
          },
          "createdAt": {
            "type": "string",
            "format": "date-time"
          },
          "updatedAt": {
            "type": "string",
            "format": "date-time"
          }
        }
      },
      "TourInstanceCreateRequest": {
        "required": [
          "endDate",
          "startDate",
          "tourId"
        ],
        "type": "object",
        "properties": {
          "tourId": {
            "type": "string",
            "format": "uuid"
          },
          "startDate": {
            "type": "string",
            "format": "date"
          },
          "endDate": {
            "type": "string",
            "format": "date"
          }
        }
      },
      "SingleResponseTourInstanceDetailResponse": {
        "type": "object",
        "properties": {
          "httpStatus": {
            "type": "integer",
            "format": "int32"
          },
          "message": {
            "type": "string"
          },
          "data": {
            "$ref": "#/components/schemas/TourInstanceDetailResponse"
          }
        }
      },
      "TourInstanceDetailResponse": {
        "type": "object",
        "properties": {
          "id": {
            "type": "string",
            "format": "uuid"
          },
          "tourName": {
            "type": "string"
          },
          "destinationName": {
            "type": "string"
          },
          "pickupLocation": {
            "type": "string"
          },
          "startDate": {
            "type": "string",
            "format": "date"
          },
          "endDate": {
            "type": "string",
            "format": "date"
          },
          "minParticipants": {
            "type": "integer",
            "format": "int32"
          },
          "maxParticipants": {
            "type": "integer",
            "format": "int32"
          },
          "currentParticipants": {
            "type": "integer",
            "format": "int32"
          },
          "status": {
            "type": "string",
            "enum": [
              "PLANNING",
              "OPEN",
              "FULL",
              "IN_PROGRESS",
              "COMPLETED",
              "CANCELLED"
            ]
          },
          "guideId": {
            "type": "string",
            "format": "uuid"
          },
          "guideName": {
            "type": "string"
          },
          "guidePhone": {
            "type": "string"
          },
          "coachId": {
            "type": "string",
            "format": "uuid"
          },
          "coachLicensePlate": {
            "type": "string"
          },
          "coachType": {
            "type": "string"
          },
          "driverId": {
            "type": "string",
            "format": "uuid"
          },
          "driverName": {
            "type": "string"
          },
          "driverPhone": {
            "type": "string"
          }
        }
      },
      "CreateCoachTripRequest": {
        "required": [
          "coachId",
          "departureTime",
          "driverId",
          "routeId"
        ],
        "type": "object",
        "properties": {
          "routeId": {
            "type": "string",
            "format": "uuid"
          },
          "coachId": {
            "type": "string",
            "format": "uuid"
          },
          "driverId": {
            "type": "string",
            "format": "uuid"
          },
          "departureTime": {
            "type": "string",
            "format": "date-time"
          }
        }
      },
      "SearchCoachTripRequest": {
        "required": [
          "departureDate",
          "destinationId",
          "originId"
        ],
        "type": "object",
        "properties": {
          "originId": {
            "type": "string",
            "format": "uuid"
          },
          "destinationId": {
            "type": "string",
            "format": "uuid"
          },
          "departureDate": {
            "type": "string",
            "format": "date"
          },
          "coachType": {
            "type": "string",
            "enum": [
              "SEAT",
              "BED",
              "LIMOUSINE"
            ]
          },
          "departureTimeSlot": {
            "type": "string",
            "enum": [
              "EARLY_MORNING",
              "MORNING",
              "AFTERNOON",
              "EVENING"
            ]
          },
          "sortByPriceAsc": {
            "type": "boolean"
          }
        }
      },
      "CoachTripResponse": {
        "type": "object",
        "properties": {
          "id": {
            "type": "string",
            "format": "uuid"
          },
          "departureTime": {
            "type": "string",
            "format": "date-time"
          },
          "arrivalTime": {
            "type": "string",
            "format": "date-time"
          },
          "coachType": {
            "type": "string",
            "enum": [
              "SEAT",
              "BED",
              "LIMOUSINE"
            ]
          },
          "totalSeats": {
            "type": "integer",
            "format": "int32"
          },
          "availableSeats": {
            "type": "integer",
            "format": "int32"
          },
          "basePrice": {
            "type": "number"
          },
          "originDestination": {
            "$ref": "#/components/schemas/DestinationWithStationsResponse"
          },
          "destinationDestination": {
            "$ref": "#/components/schemas/DestinationWithStationsResponse"
          },
          "status": {
            "type": "string",
            "enum": [
              "OPEN",
              "FULL",
              "IN_PROGRESS",
              "COMPLETED",
              "CANCELLED"
            ]
          }
        }
      },
      "DestinationWithStationsResponse": {
        "type": "object",
        "properties": {
          "id": {
            "type": "string",
            "format": "uuid"
          },
          "name": {
            "type": "string"
          },
          "code": {
            "type": "string"
          },
          "stations": {
            "type": "array",
            "items": {
              "$ref": "#/components/schemas/StationResponse"
            }
          }
        }
      },
      "SingleResponseListCoachTripResponse": {
        "type": "object",
        "properties": {
          "httpStatus": {
            "type": "integer",
            "format": "int32"
          },
          "message": {
            "type": "string"
          },
          "data": {
            "type": "array",
            "items": {
              "$ref": "#/components/schemas/CoachTripResponse"
            }
          }
        }
      },
      "StationResponse": {
        "type": "object",
        "properties": {
          "id": {
            "type": "string",
            "format": "uuid"
          },
          "name": {
            "type": "string"
          },
          "address": {
            "type": "string"
          },
          "destinationId": {
            "type": "string",
            "format": "uuid"
          },
          "destinationName": {
            "type": "string"
          }
        }
      },
      "CreateCoachBookingRequest": {
        "required": [
          "contactName",
          "contactPhone",
          "seatLayoutItemIds",
          "tripId"
        ],
        "type": "object",
        "properties": {
          "tripId": {
            "type": "string",
            "format": "uuid"
          },
          "seatLayoutItemIds": {
            "type": "array",
            "items": {
              "type": "string",
              "format": "uuid"
            }
          },
          "contactName": {
            "type": "string"
          },
          "contactPhone": {
            "type": "string"
          }
        }
      },
      "CoachBookingResponse": {
        "type": "object",
        "properties": {
          "id": {
            "type": "string",
            "format": "uuid"
          },
          "tripId": {
            "type": "string",
            "format": "uuid"
          },
          "departureTime": {
            "type": "string",
            "format": "date-time"
          },
          "originDestination": {
            "type": "string"
          },
          "destinationDestination": {
            "type": "string"
          },
          "basePrice": {
            "type": "number"
          },
          "totalPrice": {
            "type": "number"
          },
          "paymentDeadline": {
            "type": "string",
            "format": "date-time"
          },
          "contactName": {
            "type": "string"
          },
          "contactPhone": {
            "type": "string"
          },
          "status": {
            "type": "string",
            "enum": [
              "PENDING",
              "PAID",
              "CHECKED_IN",
              "CHECKED_OUT",
              "CANCELLED",
              "NO_SHOW"
            ]
          },
          "bookedSeatNames": {
            "type": "array",
            "items": {
              "type": "string"
            }
          },
          "payment": {
            "$ref": "#/components/schemas/PaymentInitiationResponse"
          }
        }
      },
      "SingleResponseCoachBookingResponse": {
        "type": "object",
        "properties": {
          "httpStatus": {
            "type": "integer",
            "format": "int32"
          },
          "message": {
            "type": "string"
          },
          "data": {
            "$ref": "#/components/schemas/CoachBookingResponse"
          }
        }
      },
      "SingleResponsePaymentInitiationResponse": {
        "type": "object",
        "properties": {
          "httpStatus": {
            "type": "integer",
            "format": "int32"
          },
          "message": {
            "type": "string"
          },
          "data": {
            "$ref": "#/components/schemas/PaymentInitiationResponse"
          }
        }
      },
      "CancelBookingRequest": {
        "type": "object",
        "properties": {
          "reason": {
            "type": "string"
          }
        }
      },
      "CancelBookingResponse": {
        "type": "object",
        "properties": {
          "bookingId": {
            "type": "string",
            "format": "uuid"
          },
          "bookingStatus": {
            "type": "string",
            "enum": [
              "PENDING",
              "PAID",
              "CHECKED_IN",
              "CHECKED_OUT",
              "CANCELLED",
              "NO_SHOW"
            ]
          },
          "refundAmount": {
            "type": "number"
          },
          "refundPercentage": {
            "type": "number"
          },
          "refundStatus": {
            "type": "string",
            "enum": [
              "PENDING",
              "PROCESSING",
              "COMPLETED",
              "REJECTED"
            ]
          },
          "refundMessage": {
            "type": "string"
          }
        }
      },
      "SingleResponseCancelBookingResponse": {
        "type": "object",
        "properties": {
          "httpStatus": {
            "type": "integer",
            "format": "int32"
          },
          "message": {
            "type": "string"
          },
          "data": {
            "$ref": "#/components/schemas/CancelBookingResponse"
          }
        }
      },
      "ChatSessionResponse": {
        "type": "object",
        "properties": {
          "id": {
            "type": "string",
            "format": "uuid"
          },
          "userId": {
            "type": "string",
            "format": "uuid"
          },
          "coordinatorId": {
            "type": "string",
            "format": "uuid"
          },
          "tourId": {
            "type": "string",
            "format": "uuid"
          },
          "cometchatGuid": {
            "type": "string"
          },
          "status": {
            "type": "string",
            "enum": [
              "OPEN",
              "CLOSED"
            ]
          }
        }
      },
      "SingleResponseChatSessionResponse": {
        "type": "object",
        "properties": {
          "httpStatus": {
            "type": "integer",
            "format": "int32"
          },
          "message": {
            "type": "string"
          },
          "data": {
            "$ref": "#/components/schemas/ChatSessionResponse"
          }
        }
      },
      "CreateReviewRequest": {
        "required": [
          "content",
          "rating"
        ],
        "type": "object",
        "properties": {
          "rating": {
            "maximum": 5,
            "minimum": 1,
            "type": "integer",
            "format": "int32"
          },
          "content": {
            "type": "string"
          }
        }
      },
      "ReviewResponse": {
        "type": "object",
        "properties": {
          "id": {
            "type": "string",
            "format": "uuid"
          },
          "rating": {
            "type": "integer",
            "format": "int32"
          },
          "content": {
            "type": "string"
          },
          "reviewerName": {
            "type": "string"
          },
          "createdAt": {
            "type": "string",
            "format": "date-time"
          }
        }
      },
      "SingleResponseReviewResponse": {
        "type": "object",
        "properties": {
          "httpStatus": {
            "type": "integer",
            "format": "int32"
          },
          "message": {
            "type": "string"
          },
          "data": {
            "$ref": "#/components/schemas/ReviewResponse"
          }
        }
      },
      "VerifyOtpRequest": {
        "required": [
          "email",
          "otp"
        ],
        "type": "object",
        "properties": {
          "email": {
            "type": "string"
          },
          "otp": {
            "pattern": "^[0-9]{6}$",
            "type": "string"
          }
        }
      },
      "RegisterRequest": {
        "required": [
          "confirmPassword",
          "email",
          "fullName",
          "password"
        ],
        "type": "object",
        "properties": {
          "email": {
            "type": "string"
          },
          "password": {
            "maxLength": 2147483647,
            "minLength": 8,
            "type": "string"
          },
          "confirmPassword": {
            "type": "string"
          },
          "fullName": {
            "type": "string"
          }
        }
      },
      "RegisterResponse": {
        "type": "object",
        "properties": {
          "email": {
            "type": "string"
          },
          "requiresOtp": {
            "type": "boolean"
          }
        }
      },
      "SingleResponseRegisterResponse": {
        "type": "object",
        "properties": {
          "httpStatus": {
            "type": "integer",
            "format": "int32"
          },
          "message": {
            "type": "string"
          },
          "data": {
            "$ref": "#/components/schemas/RegisterResponse"
          }
        }
      },
      "ResetPasswordRequest": {
        "required": [
          "confirmPassword",
          "email",
          "newPassword",
          "otp"
        ],
        "type": "object",
        "properties": {
          "email": {
            "type": "string"
          },
          "otp": {
            "type": "string"
          },
          "newPassword": {
            "maxLength": 2147483647,
            "minLength": 8,
            "type": "string"
          },
          "confirmPassword": {
            "type": "string"
          }
        }
      },
      "ResendOtpRequest": {
        "required": [
          "email"
        ],
        "type": "object",
        "properties": {
          "email": {
            "type": "string"
          }
        }
      },
      "RefreshRequest": {
        "required": [
          "refreshToken"
        ],
        "type": "object",
        "properties": {
          "refreshToken": {
            "type": "string"
          }
        }
      },
      "RefreshResponse": {
        "type": "object",
        "properties": {
          "accessToken": {
            "type": "string"
          },
          "refreshToken": {
            "type": "string"
          }
        }
      },
      "SingleResponseRefreshResponse": {
        "type": "object",
        "properties": {
          "httpStatus": {
            "type": "integer",
            "format": "int32"
          },
          "message": {
            "type": "string"
          },
          "data": {
            "$ref": "#/components/schemas/RefreshResponse"
          }
        }
      },
      "LogoutRequest": {
        "required": [
          "refreshToken"
        ],
        "type": "object",
        "properties": {
          "refreshToken": {
            "type": "string"
          }
        }
      },
      "LoginRequest": {
        "required": [
          "email",
          "password"
        ],
        "type": "object",
        "properties": {
          "email": {
            "type": "string"
          },
          "password": {
            "maxLength": 2147483647,
            "minLength": 8,
            "type": "string"
          }
        }
      },
      "LoginResponse": {
        "type": "object",
        "properties": {
          "accessToken": {
            "type": "string"
          },
          "refreshToken": {
            "type": "string"
          },
          "cometchatUid": {
            "type": "string"
          }
        }
      },
      "SingleResponseLoginResponse": {
        "type": "object",
        "properties": {
          "httpStatus": {
            "type": "integer",
            "format": "int32"
          },
          "message": {
            "type": "string"
          },
          "data": {
            "$ref": "#/components/schemas/LoginResponse"
          }
        }
      },
      "ForgotPasswordRequest": {
        "required": [
          "email"
        ],
        "type": "object",
        "properties": {
          "email": {
            "type": "string"
          }
        }
      },
      "CreateStaffRequest": {
        "required": [
          "email",
          "fullName",
          "password",
          "role"
        ],
        "type": "object",
        "properties": {
          "email": {
            "type": "string"
          },
          "password": {
            "maxLength": 2147483647,
            "minLength": 8,
            "type": "string"
          },
          "fullName": {
            "type": "string"
          },
          "role": {
            "type": "string",
            "enum": [
              "TOURIST",
              "RECEPTIONIST",
              "COORDINATOR",
              "GUIDE",
              "ADMIN"
            ]
          },
          "department": {
            "type": "string",
            "enum": [
              "TOUR",
              "HOTEL",
              "COACH"
            ]
          },
          "guideLicense": {
            "type": "string"
          },
          "hotelId": {
            "type": "string",
            "format": "uuid"
          }
        }
      },
      "ChangePasswordRequest": {
        "required": [
          "confirmPassword",
          "currentPassword",
          "newPassword"
        ],
        "type": "object",
        "properties": {
          "currentPassword": {
            "type": "string"
          },
          "newPassword": {
            "maxLength": 2147483647,
            "minLength": 8,
            "type": "string"
          },
          "confirmPassword": {
            "type": "string"
          }
        }
      },
      "AccountDeletionRequest": {
        "required": [
          "password"
        ],
        "type": "object",
        "properties": {
          "password": {
            "type": "string"
          }
        }
      },
      "CreateSeatLayoutRequest": {
        "required": [
          "coachType",
          "items",
          "name"
        ],
        "type": "object",
        "properties": {
          "name": {
            "maxLength": 100,
            "minLength": 0,
            "type": "string"
          },
          "coachType": {
            "type": "string",
            "enum": [
              "SEAT",
              "BED",
              "LIMOUSINE"
            ]
          },
          "items": {
            "type": "array",
            "items": {
              "$ref": "#/components/schemas/SeatLayoutItemRequest"
            }
          }
        }
      },
      "SeatLayoutItemRequest": {
        "required": [
          "position",
          "seatName",
          "tier"
        ],
        "type": "object",
        "properties": {
          "seatName": {
            "maxLength": 10,
            "minLength": 0,
            "type": "string"
          },
          "tier": {
            "type": "string",
            "enum": [
              "UPPER",
              "LOWER"
            ]
          },
          "position": {
            "type": "string",
            "enum": [
              "FRONT",
              "MIDDLE",
              "BACK"
            ]
          },
          "rowNumber": {
            "minimum": 0,
            "type": "integer",
            "format": "int32"
          },
          "columnNumber": {
            "minimum": 0,
            "type": "integer",
            "format": "int32"
          }
        }
      },
      "SeatLayoutItemResponse": {
        "type": "object",
        "properties": {
          "id": {
            "type": "string",
            "format": "uuid"
          },
          "seatName": {
            "type": "string"
          },
          "tier": {
            "type": "string",
            "enum": [
              "UPPER",
              "LOWER"
            ]
          },
          "position": {
            "type": "string",
            "enum": [
              "FRONT",
              "MIDDLE",
              "BACK"
            ]
          },
          "rowNumber": {
            "type": "integer",
            "format": "int32"
          },
          "columnNumber": {
            "type": "integer",
            "format": "int32"
          }
        }
      },
      "SeatLayoutResponse": {
        "type": "object",
        "properties": {
          "id": {
            "type": "string",
            "format": "uuid"
          },
          "name": {
            "type": "string"
          },
          "coachType": {
            "type": "string",
            "enum": [
              "SEAT",
              "BED",
              "LIMOUSINE"
            ]
          },
          "totalSeats": {
            "type": "integer",
            "format": "int32"
          },
          "items": {
            "type": "array",
            "items": {
              "$ref": "#/components/schemas/SeatLayoutItemResponse"
            }
          }
        }
      },
      "SingleResponseSeatLayoutResponse": {
        "type": "object",
        "properties": {
          "httpStatus": {
            "type": "integer",
            "format": "int32"
          },
          "message": {
            "type": "string"
          },
          "data": {
            "$ref": "#/components/schemas/SeatLayoutResponse"
          }
        }
      },
      "CreateCoachRequest": {
        "required": [
          "coachType",
          "licensePlate",
          "seatLayoutId"
        ],
        "type": "object",
        "properties": {
          "licensePlate": {
            "maxLength": 20,
            "minLength": 0,
            "type": "string"
          },
          "coachType": {
            "type": "string",
            "enum": [
              "SEAT",
              "BED",
              "LIMOUSINE"
            ]
          },
          "capacity": {
            "minimum": 1,
            "type": "integer",
            "format": "int32"
          },
          "seatLayoutId": {
            "type": "string",
            "format": "uuid"
          }
        }
      },
      "TourProgressUpdateRequest": {
        "required": [
          "status"
        ],
        "type": "object",
        "properties": {
          "status": {
            "type": "string",
            "enum": [
              "PLANNING",
              "OPEN",
              "FULL",
              "IN_PROGRESS",
              "COMPLETED",
              "CANCELLED"
            ]
          }
        }
      },
      "GuideTourInstanceDetailResponse": {
        "type": "object",
        "properties": {
          "id": {
            "type": "string",
            "format": "uuid"
          },
          "tourName": {
            "type": "string"
          },
          "destinationName": {
            "type": "string"
          },
          "pickupLocation": {
            "type": "string"
          },
          "startDate": {
            "type": "string",
            "format": "date"
          },
          "endDate": {
            "type": "string",
            "format": "date"
          },
          "status": {
            "type": "string",
            "enum": [
              "PLANNING",
              "OPEN",
              "FULL",
              "IN_PROGRESS",
              "COMPLETED",
              "CANCELLED"
            ]
          },
          "coachId": {
            "type": "string",
            "format": "uuid"
          },
          "coachLicensePlate": {
            "type": "string"
          },
          "coachType": {
            "type": "string"
          },
          "driverId": {
            "type": "string",
            "format": "uuid"
          },
          "driverName": {
            "type": "string"
          },
          "driverPhone": {
            "type": "string"
          },
          "bookings": {
            "type": "array",
            "items": {
              "$ref": "#/components/schemas/TourBookingResponse"
            }
          }
        }
      },
      "SingleResponseGuideTourInstanceDetailResponse": {
        "type": "object",
        "properties": {
          "httpStatus": {
            "type": "integer",
            "format": "int32"
          },
          "message": {
            "type": "string"
          },
          "data": {
            "$ref": "#/components/schemas/GuideTourInstanceDetailResponse"
          }
        }
      },
      "GuideAttendanceRequest": {
        "required": [
          "attendances"
        ],
        "type": "object",
        "properties": {
          "attendances": {
            "type": "array",
            "items": {
              "$ref": "#/components/schemas/MemberAttendance"
            }
          }
        }
      },
      "MemberAttendance": {
        "required": [
          "memberId",
          "status"
        ],
        "type": "object",
        "properties": {
          "memberId": {
            "type": "string",
            "format": "uuid"
          },
          "status": {
            "type": "string",
            "enum": [
              "NOT_CHECKED",
              "PRESENT",
              "NO_SHOW"
            ]
          }
        }
      },
      "TourInstanceUpdateRequest": {
        "type": "object",
        "properties": {
          "coordinatorId": {
            "type": "string",
            "format": "uuid"
          },
          "guideId": {
            "type": "string",
            "format": "uuid"
          },
          "coachId": {
            "type": "string",
            "format": "uuid"
          },
          "driverId": {
            "type": "string",
            "format": "uuid"
          },
          "hotelBookingId": {
            "type": "string",
            "format": "uuid"
          },
          "startDate": {
            "type": "string",
            "format": "date"
          },
          "endDate": {
            "type": "string",
            "format": "date"
          },
          "status": {
            "type": "string",
            "enum": [
              "PLANNING",
              "OPEN",
              "FULL",
              "IN_PROGRESS",
              "COMPLETED",
              "CANCELLED"
            ]
          }
        }
      },
      "UpdateTouristProfileRequest": {
        "type": "object",
        "properties": {
          "fullName": {
            "type": "string"
          },
          "phoneNumber": {
            "pattern": "^\\+?[0-9]{10,15}$",
            "type": "string"
          },
          "passportNumber": {
            "type": "string"
          },
          "dateOfBirth": {
            "type": "string",
            "format": "date"
          },
          "gender": {
            "type": "string",
            "enum": [
              "MALE",
              "FEMALE",
              "OTHER"
            ]
          }
        }
      },
      "UpdateAdminProfileRequest": {
        "type": "object",
        "properties": {
          "fullName": {
            "type": "string"
          },
          "phoneNumber": {
            "pattern": "^\\+?[0-9]{10,15}$",
            "type": "string"
          }
        }
      },
      "UpdateReceptionistProfileRequest": {
        "type": "object",
        "properties": {
          "fullName": {
            "type": "string"
          },
          "phoneNumber": {
            "pattern": "^\\+?[0-9]{10,15}$",
            "type": "string"
          },
          "shiftType": {
            "type": "string",
            "enum": [
              "MORNING",
              "EVENING",
              "NIGHT"
            ]
          },
          "hotelId": {
            "type": "string",
            "format": "uuid"
          }
        }
      },
      "UpdateGuideProfileRequest": {
        "type": "object",
        "properties": {
          "fullName": {
            "type": "string"
          },
          "phoneNumber": {
            "pattern": "^\\+?[0-9]{10,15}$",
            "type": "string"
          },
          "guideLicense": {
            "type": "string"
          },
          "yearsExperience": {
            "type": "integer",
            "format": "int32"
          },
          "languages": {
            "type": "array",
            "items": {
              "type": "string"
            }
          }
        }
      },
      "UpdateCoordinatorProfileRequest": {
        "type": "object",
        "properties": {
          "fullName": {
            "type": "string"
          },
          "phoneNumber": {
            "pattern": "^\\+?[0-9]{10,15}$",
            "type": "string"
          },
          "department": {
            "type": "string",
            "enum": [
              "TOUR",
              "HOTEL",
              "COACH"
            ]
          }
        }
      },
      "UpdateCoachStatusRequest": {
        "required": [
          "status"
        ],
        "type": "object",
        "properties": {
          "status": {
            "type": "string",
            "enum": [
              "ACTIVE",
              "MAINTENANCE",
              "INACTIVE"
            ]
          }
        }
      },
      "TourSearchRequest": {
        "type": "object",
        "properties": {
          "keyword": {
            "type": "string"
          },
          "minPrice": {
            "type": "number"
          },
          "maxPrice": {
            "type": "number"
          },
          "startDate": {
            "type": "string",
            "format": "date"
          },
          "destinationId": {
            "type": "string",
            "format": "uuid"
          },
          "minRating": {
            "maximum": 5,
            "minimum": 1,
            "type": "integer",
            "format": "int32"
          }
        }
      },
      "Pageable": {
        "type": "object",
        "properties": {
          "page": {
            "minimum": 0,
            "type": "integer",
            "format": "int32"
          },
          "size": {
            "minimum": 1,
            "type": "integer",
            "format": "int32"
          },
          "sort": {
            "type": "array",
            "items": {
              "type": "string"
            }
          }
        }
      },
      "PageObject": {
        "type": "object",
        "properties": {
          "totalElements": {
            "type": "integer",
            "format": "int64"
          },
          "totalPages": {
            "type": "integer",
            "format": "int32"
          },
          "size": {
            "type": "integer",
            "format": "int32"
          },
          "content": {
            "type": "array",
            "items": {
              "$ref": "#/components/schemas/TourSummaryResponse"
            }
          },
          "number": {
            "type": "integer",
            "format": "int32"
          },
          "first": {
            "type": "boolean"
          },
          "last": {
            "type": "boolean"
          },
          "numberOfElements": {
            "type": "integer",
            "format": "int32"
          },
          "pageable": {
            "$ref": "#/components/schemas/PageableObject"
          },
          "sort": {
            "$ref": "#/components/schemas/SortObject"
          },
          "empty": {
            "type": "boolean"
          }
        }
      },
      "PageableObject": {
        "type": "object",
        "properties": {
          "offset": {
            "type": "integer",
            "format": "int64"
          },
          "unpaged": {
            "type": "boolean"
          },
          "pageSize": {
            "type": "integer",
            "format": "int32"
          },
          "pageNumber": {
            "type": "integer",
            "format": "int32"
          },
          "paged": {
            "type": "boolean"
          },
          "sort": {
            "$ref": "#/components/schemas/SortObject"
          }
        }
      },
      "SingleResponsePageTourSummaryResponse": {
        "type": "object",
        "properties": {
          "httpStatus": {
            "type": "integer",
            "format": "int32"
          },
          "message": {
            "type": "string"
          },
          "data": {
            "$ref": "#/components/schemas/PageObject"
          }
        }
      },
      "SortObject": {
        "type": "object",
        "properties": {
          "empty": {
            "type": "boolean"
          },
          "unsorted": {
            "type": "boolean"
          },
          "sorted": {
            "type": "boolean"
          }
        }
      },
      "TourSummaryResponse": {
        "type": "object",
        "properties": {
          "id": {
            "type": "string",
            "format": "uuid"
          },
          "name": {
            "type": "string"
          },
          "averageRating": {
            "type": "number",
            "format": "double"
          },
          "price": {
            "type": "number"
          },
          "thumbnailUrl": {
            "type": "string"
          },
          "destinationName": {
            "type": "string"
          },
          "durationDays": {
            "type": "integer",
            "format": "int32"
          }
        }
      },
      "DestinationResponse": {
        "type": "object",
        "properties": {
          "id": {
            "type": "string",
            "format": "uuid"
          },
          "code": {
            "type": "string"
          },
          "name": {
            "type": "string"
          }
        }
      },
      "ImageResponse": {
        "type": "object",
        "properties": {
          "url": {
            "type": "string"
          },
          "isThumnail": {
            "type": "boolean"
          }
        }
      },
      "RefundPolicyResponse": {
        "type": "object",
        "properties": {
          "id": {
            "type": "string",
            "format": "uuid"
          },
          "name": {
            "type": "string"
          },
          "serviceType": {
            "type": "string",
            "enum": [
              "TOUR",
              "HOTEL",
              "COACH"
            ]
          },
          "rules": {
            "type": "array",
            "items": {
              "$ref": "#/components/schemas/RefundPolicyRuleResponse"
            }
          }
        }
      },
      "RefundPolicyRuleResponse": {
        "type": "object",
        "properties": {
          "id": {
            "type": "string",
            "format": "uuid"
          },
          "timeBefore": {
            "type": "integer",
            "format": "int32"
          },
          "timeUnit": {
            "type": "string",
            "enum": [
              "HOURS",
              "DAYS"
            ]
          },
          "refundPercentage": {
            "type": "number"
          }
        }
      },
      "SingleResponseTourDetailResponse": {
        "type": "object",
        "properties": {
          "httpStatus": {
            "type": "integer",
            "format": "int32"
          },
          "message": {
            "type": "string"
          },
          "data": {
            "$ref": "#/components/schemas/TourDetailResponse"
          }
        }
      },
      "TourDetailResponse": {
        "type": "object",
        "properties": {
          "id": {
            "type": "string",
            "format": "uuid"
          },
          "name": {
            "type": "string"
          },
          "description": {
            "type": "string"
          },
          "pricePerAdult": {
            "type": "number"
          },
          "pricePerChild": {
            "type": "number"
          },
          "averageRating": {
            "type": "number",
            "format": "double"
          },
          "ratingCount": {
            "type": "integer",
            "format": "int32"
          },
          "startLocation": {
            "type": "string"
          },
          "itineraryList": {
            "type": "array",
            "items": {
              "$ref": "#/components/schemas/TourItineraryResponse"
            }
          },
          "images": {
            "type": "array",
            "items": {
              "$ref": "#/components/schemas/ImageResponse"
            }
          },
          "destination": {
            "$ref": "#/components/schemas/DestinationResponse"
          },
          "refundPolicy": {
            "$ref": "#/components/schemas/RefundPolicyResponse"
          },
          "durationDays": {
            "type": "integer",
            "format": "int32"
          }
        }
      },
      "TourItineraryResponse": {
        "type": "object",
        "properties": {
          "dayNumber": {
            "type": "integer",
            "format": "int32"
          },
          "title": {
            "type": "string"
          },
          "description": {
            "type": "string"
          },
          "images": {
            "type": "array",
            "items": {
              "$ref": "#/components/schemas/ImageResponse"
            }
          }
        }
      },
      "SingleResponseListTourInstanceResponse": {
        "type": "object",
        "properties": {
          "httpStatus": {
            "type": "integer",
            "format": "int32"
          },
          "message": {
            "type": "string"
          },
          "data": {
            "type": "array",
            "items": {
              "$ref": "#/components/schemas/TourInstanceResponse"
            }
          }
        }
      },
      "TourInstanceResponse": {
        "type": "object",
        "properties": {
          "id": {
            "type": "string",
            "format": "uuid"
          },
          "tourName": {
            "type": "string"
          },
          "startDate": {
            "type": "string",
            "format": "date"
          },
          "status": {
            "type": "string",
            "enum": [
              "PLANNING",
              "OPEN",
              "FULL",
              "IN_PROGRESS",
              "COMPLETED",
              "CANCELLED"
            ]
          },
          "currentParticipants": {
            "type": "integer",
            "format": "int32"
          },
          "maxParticipants": {
            "type": "integer",
            "format": "int32"
          }
        }
      },
      "SingleResponseListTourSummaryResponse": {
        "type": "object",
        "properties": {
          "httpStatus": {
            "type": "integer",
            "format": "int32"
          },
          "message": {
            "type": "string"
          },
          "data": {
            "type": "array",
            "items": {
              "$ref": "#/components/schemas/TourSummaryResponse"
            }
          }
        }
      },
      "SingleResponseListStationResponse": {
        "type": "object",
        "properties": {
          "httpStatus": {
            "type": "integer",
            "format": "int32"
          },
          "message": {
            "type": "string"
          },
          "data": {
            "type": "array",
            "items": {
              "$ref": "#/components/schemas/StationResponse"
            }
          }
        }
      },
      "SingleResponseListBookingMemberResponse": {
        "type": "object",
        "properties": {
          "httpStatus": {
            "type": "integer",
            "format": "int32"
          },
          "message": {
            "type": "string"
          },
          "data": {
            "type": "array",
            "items": {
              "$ref": "#/components/schemas/BookingMemberResponse"
            }
          }
        }
      },
      "SingleResponseListTourIncidentResponse": {
        "type": "object",
        "properties": {
          "httpStatus": {
            "type": "integer",
            "format": "int32"
          },
          "message": {
            "type": "string"
          },
          "data": {
            "type": "array",
            "items": {
              "$ref": "#/components/schemas/TourIncidentResponse"
            }
          }
        }
      },
      "SingleResponseListDestinationResponse": {
        "type": "object",
        "properties": {
          "httpStatus": {
            "type": "integer",
            "format": "int32"
          },
          "message": {
            "type": "string"
          },
          "data": {
            "type": "array",
            "items": {
              "$ref": "#/components/schemas/DestinationResponse"
            }
          }
        }
      },
      "SingleResponseListDestinationWithStationsResponse": {
        "type": "object",
        "properties": {
          "httpStatus": {
            "type": "integer",
            "format": "int32"
          },
          "message": {
            "type": "string"
          },
          "data": {
            "type": "array",
            "items": {
              "$ref": "#/components/schemas/DestinationWithStationsResponse"
            }
          }
        }
      },
      "SingleResponsePageCoachTripResponse": {
        "type": "object",
        "properties": {
          "httpStatus": {
            "type": "integer",
            "format": "int32"
          },
          "message": {
            "type": "string"
          },
          "data": {
            "$ref": "#/components/schemas/PageObject"
          }
        }
      },
      "SeatMapResponse": {
        "type": "object",
        "properties": {
          "tripId": {
            "type": "string",
            "format": "uuid"
          },
          "coachType": {
            "type": "string",
            "enum": [
              "SEAT",
              "BED",
              "LIMOUSINE"
            ]
          },
          "totalSeats": {
            "type": "integer",
            "format": "int32"
          },
          "availableSeats": {
            "type": "integer",
            "format": "int32"
          },
          "seats": {
            "type": "array",
            "items": {
              "$ref": "#/components/schemas/SeatStatusResponse"
            }
          }
        }
      },
      "SeatStatusResponse": {
        "type": "object",
        "properties": {
          "seatLayoutItemId": {
            "type": "string",
            "format": "uuid"
          },
          "seatName": {
            "type": "string"
          },
          "tier": {
            "type": "string",
            "enum": [
              "UPPER",
              "LOWER"
            ]
          },
          "position": {
            "type": "string",
            "enum": [
              "FRONT",
              "MIDDLE",
              "BACK"
            ]
          },
          "rowNumber": {
            "type": "integer",
            "format": "int32"
          },
          "columnNumber": {
            "type": "integer",
            "format": "int32"
          },
          "status": {
            "type": "string",
            "enum": [
              "AVAILABLE",
              "BOOKED"
            ]
          }
        }
      },
      "SingleResponseSeatMapResponse": {
        "type": "object",
        "properties": {
          "httpStatus": {
            "type": "integer",
            "format": "int32"
          },
          "message": {
            "type": "string"
          },
          "data": {
            "$ref": "#/components/schemas/SeatMapResponse"
          }
        }
      },
      "SingleResponsePageCoachBookingSummaryResponse": {
        "type": "object",
        "properties": {
          "httpStatus": {
            "type": "integer",
            "format": "int32"
          },
          "message": {
            "type": "string"
          },
          "data": {
            "$ref": "#/components/schemas/PageObject"
          }
        }
      },
      "CoachBookingDetailResponse": {
        "type": "object",
        "properties": {
          "id": {
            "type": "string",
            "format": "uuid"
          },
          "status": {
            "type": "string",
            "enum": [
              "PENDING",
              "PAID",
              "CHECKED_IN",
              "CHECKED_OUT",
              "CANCELLED",
              "NO_SHOW"
            ]
          },
          "basePrice": {
            "type": "number"
          },
          "totalPrice": {
            "type": "number"
          },
          "paymentDeadline": {
            "type": "string",
            "format": "date-time"
          },
          "contactName": {
            "type": "string"
          },
          "contactPhone": {
            "type": "string"
          },
          "tripId": {
            "type": "string",
            "format": "uuid"
          },
          "departureTime": {
            "type": "string",
            "format": "date-time"
          },
          "estimatedArrivalTime": {
            "type": "string",
            "format": "date-time"
          },
          "originDestination": {
            "type": "string"
          },
          "destinationDestination": {
            "type": "string"
          },
          "coachLicensePlate": {
            "type": "string"
          },
          "bookedSeatNames": {
            "type": "array",
            "items": {
              "type": "string"
            }
          },
          "paymentMethod": {
            "type": "string",
            "enum": [
              "VNPAY",
              "MOMO",
              "CASH"
            ]
          },
          "paymentStatus": {
            "type": "string",
            "enum": [
              "PENDING",
              "SUCCESS",
              "FAILED",
              "REFUNDED"
            ]
          },
          "transactionId": {
            "type": "string",
            "format": "uuid"
          },
          "gatewayTransactionId": {
            "type": "string"
          }
        }
      },
      "SingleResponseCoachBookingDetailResponse": {
        "type": "object",
        "properties": {
          "httpStatus": {
            "type": "integer",
            "format": "int32"
          },
          "message": {
            "type": "string"
          },
          "data": {
            "$ref": "#/components/schemas/CoachBookingDetailResponse"
          }
        }
      },
      "SingleResponseTourBookingDetailResponse": {
        "type": "object",
        "properties": {
          "httpStatus": {
            "type": "integer",
            "format": "int32"
          },
          "message": {
            "type": "string"
          },
          "data": {
            "$ref": "#/components/schemas/TourBookingDetailResponse"
          }
        }
      },
      "TourBookingDetailResponse": {
        "type": "object",
        "properties": {
          "id": {
            "type": "string",
            "format": "uuid"
          },
          "status": {
            "type": "string",
            "enum": [
              "PENDING",
              "PAID",
              "CHECKED_IN",
              "CHECKED_OUT",
              "CANCELLED",
              "NO_SHOW"
            ]
          },
          "totalPrice": {
            "type": "number"
          },
          "pricePerAdultAtBooking": {
            "type": "number"
          },
          "pricePerChildAtBooking": {
            "type": "number"
          },
          "paymentDeadline": {
            "type": "string",
            "format": "date-time"
          },
          "specialRequests": {
            "type": "string"
          },
          "createdAt": {
            "type": "string",
            "format": "date-time"
          },
          "tourName": {
            "type": "string"
          },
          "startDate": {
            "type": "string",
            "format": "date"
          },
          "endDate": {
            "type": "string",
            "format": "date"
          },
          "members": {
            "type": "array",
            "items": {
              "$ref": "#/components/schemas/BookingMemberResponse"
            }
          },
          "paymentMethod": {
            "type": "string",
            "enum": [
              "VNPAY",
              "MOMO",
              "CASH"
            ]
          },
          "paymentStatus": {
            "type": "string",
            "enum": [
              "PENDING",
              "SUCCESS",
              "FAILED",
              "REFUNDED"
            ]
          },
          "transactionId": {
            "type": "string",
            "format": "uuid"
          },
          "gatewayTransactionId": {
            "type": "string"
          }
        }
      },
      "SingleResponsePageTourBookingSummaryResponse": {
        "type": "object",
        "properties": {
          "httpStatus": {
            "type": "integer",
            "format": "int32"
          },
          "message": {
            "type": "string"
          },
          "data": {
            "$ref": "#/components/schemas/PageObject"
          }
        }
      },
      "SingleResponsePageBaseUserProfileResponse": {
        "type": "object",
        "properties": {
          "httpStatus": {
            "type": "integer",
            "format": "int32"
          },
          "message": {
            "type": "string"
          },
          "data": {
            "$ref": "#/components/schemas/PageObject"
          }
        }
      },
      "SingleResponseListSeatLayoutResponse": {
        "type": "object",
        "properties": {
          "httpStatus": {
            "type": "integer",
            "format": "int32"
          },
          "message": {
            "type": "string"
          },
          "data": {
            "type": "array",
            "items": {
              "$ref": "#/components/schemas/SeatLayoutResponse"
            }
          }
        }
      },
      "SingleResponseListCoachResponse": {
        "type": "object",
        "properties": {
          "httpStatus": {
            "type": "integer",
            "format": "int32"
          },
          "message": {
            "type": "string"
          },
          "data": {
            "type": "array",
            "items": {
              "$ref": "#/components/schemas/CoachResponse"
            }
          }
        }
      },
      "SingleResponseVoid": {
        "type": "object",
        "properties": {
          "httpStatus": {
            "type": "integer",
            "format": "int32"
          },
          "message": {
            "type": "string"
          },
          "data": {
            "type": "object"
          }
        }
      }
    },
    "securitySchemes": {
      "bearerAuth": {
        "type": "http",
        "name": "bearerAuth",
        "scheme": "bearer",
        "bearerFormat": "JWT"
      }
    }
  }