class CancelBookingRequest {
  final String reason;
  final String bankName;
  final String accountNumber;
  final String accountHolderName;

  const CancelBookingRequest({
    this.reason = '',
    this.bankName = '',
    this.accountNumber = '',
    this.accountHolderName = '',
  });

  Map<String, dynamic> toJson() => {
    'reason': reason,
    'bankName': bankName,
    'accountNumber': accountNumber,
    'accountHolderName': accountHolderName,
  };
}
