void main() {
  List<dynamic> amenities = [
    {
      "id": "123e4567-e89b-12d3-a456-426614174000",
      "name": "string",
      "iconUrl": "string",
      "type": "HOTEL_AMENITY"
    }
  ];
  
  List<String> _selectedAmenityIds = [];
  try {
    _selectedAmenityIds = amenities.map((e) => e['id'] as String).toList();
    print("Success: $_selectedAmenityIds");
  } catch (e) {
    print("Error: $e");
  }
}
