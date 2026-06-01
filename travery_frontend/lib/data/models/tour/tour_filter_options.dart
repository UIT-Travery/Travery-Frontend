class DestinationOption {
  final String id;
  final String name;
  final String region;

  const DestinationOption({
    required this.id,
    required this.name,
    required this.region,
  });
}

const kPopularDestinations = [
  DestinationOption(id: 'dest_hanoi', name: 'Hà Nội', region: 'Miền Bắc'),
  DestinationOption(id: 'dest_halong', name: 'Hạ Long', region: 'Miền Bắc'),
  DestinationOption(id: 'dest_sapa', name: 'Sapa', region: 'Miền Bắc'),
  DestinationOption(id: 'dest_hue', name: 'Huế', region: 'Miền Trung'),
  DestinationOption(id: 'dest_danang', name: 'Đà Nẵng', region: 'Miền Trung'),
  DestinationOption(id: 'dest_hoian', name: 'Hội An', region: 'Miền Trung'),
  DestinationOption(
    id: 'dest_nhatrang',
    name: 'Nha Trang',
    region: 'Miền Trung',
  ),
  DestinationOption(id: 'dest_dalat', name: 'Đà Lạt', region: 'Miền Trung'),
  DestinationOption(
    id: 'dest_hochiminh',
    name: 'TP. Hồ Chí Minh',
    region: 'Miền Nam',
  ),
  DestinationOption(id: 'dest_phuquoc', name: 'Phú Quốc', region: 'Miền Nam'),
  DestinationOption(id: 'destcantho', name: 'Cần Thơ', region: 'Miền Nam'),
];

const kPriceRangePresets = [
  (label: 'Dưới 500K', min: null, max: 500000.0),
  (label: '500K - 1Triệu', min: 500000.0, max: 1000000.0),
  (label: '1-2 Triệu', min: 1000000.0, max: 2000000.0),
  (label: '2-5 Triệu', min: 2000000.0, max: 5000000.0),
  (label: 'Trên 5 Triệu', min: 5000000.0, max: null),
];

const kRatingOptions = [
  (label: '3 sao', minRating: 3),
  (label: '4 sao', minRating: 4),
  (label: '5 sao', minRating: 5),
];
