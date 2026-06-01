import 'package:flutter/material.dart';
import 'large_button.dart';

class AmenityBottomSheet extends StatefulWidget {
  final List<String> amenities;
  final List<String> initialSelected;
  final Function(List<String>) onConfirm;

  const AmenityBottomSheet({
    super.key,
    required this.amenities,
    required this.initialSelected,
    required this.onConfirm,
  });

  @override
  State<AmenityBottomSheet> createState() => _AmenityBottomSheetState();
}

class _AmenityBottomSheetState extends State<AmenityBottomSheet> {
  late List<String> _selectedAmenities;

  @override
  void initState() {
    super.initState();
    _selectedAmenities = List.from(widget.initialSelected);
  }

  void _toggleAmenity(String amenity) {
    setState(() {
      if (_selectedAmenities.contains(amenity)) {
        _selectedAmenities.remove(amenity);
      } else {
        _selectedAmenities.add(amenity);
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.fromLTRB(16, 16, 16, 24),
      decoration: const BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.vertical(top: Radius.circular(16)),
      ),
      child: Column(
        mainAxisSize: MainAxisSize.min,
        children: [
          Stack(
            alignment: Alignment.center,
            children: [
              const Align(
                alignment: Alignment.center,
                child: Text(
                  'Cơ sở vật chất',
                  style: TextStyle(
                    fontSize: 18,
                    fontWeight: FontWeight.bold,
                  ),
                ),
              ),
              Align(
                alignment: Alignment.centerRight,
                child: IconButton(
                  icon: const Icon(Icons.close),
                  onPressed: () => Navigator.of(context).pop(),
                ),
              ),
            ],
          ),
          const Divider(),
          const SizedBox(height: 8),
          Flexible(
            child: ListView.builder(
              shrinkWrap: true,
              itemCount: widget.amenities.length,
              itemBuilder: (context, index) {
                final amenity = widget.amenities[index];
                final isSelected = _selectedAmenities.contains(amenity);
                return InkWell(
                  onTap: () => _toggleAmenity(amenity),
                  child: Padding(
                    padding: const EdgeInsets.symmetric(vertical: 12.0),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Text(
                          amenity,
                          style: const TextStyle(
                            fontSize: 16,
                            fontWeight: FontWeight.w500,
                          ),
                        ),
                        Icon(
                          isSelected
                              ? Icons.check_circle_outline
                              : Icons.radio_button_unchecked,
                          color: Colors.black,
                        ),
                      ],
                    ),
                  ),
                );
              },
            ),
          ),
          const SizedBox(height: 16),
          LargeButton(
            text: 'Xác nhận',
            onTap: () {
              widget.onConfirm(_selectedAmenities);
              Navigator.of(context).pop();
            },
          ),
        ],
      ),
    );
  }
}
