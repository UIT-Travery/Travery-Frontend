class DashboardSummary {
  final String hotelId;
  final int totalRooms;
  final int totalClean;
  final int totalDirty;
  final int totalMaintenance;

  const DashboardSummary({
    required this.hotelId,
    required this.totalRooms,
    required this.totalClean,
    required this.totalDirty,
    required this.totalMaintenance,
  });
}
