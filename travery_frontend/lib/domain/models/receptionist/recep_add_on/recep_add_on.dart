enum RecepAddonType { spa, breakfast, lunch, dinner, laundry }

class RecepAddon {
  final String bookingId;
  final RecepAddonType type;
  final int quantity;

  const RecepAddon({
    required this.bookingId,
    required this.type,
    required this.quantity,
  });
}
