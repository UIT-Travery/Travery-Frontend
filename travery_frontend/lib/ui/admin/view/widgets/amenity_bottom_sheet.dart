import 'package:flutter/material.dart';
import 'large_button.dart';

import 'package:travery_frontend/data/services/api/model/hotel/amenity_response.dart';

class AmenityBottomSheet extends StatefulWidget {
  final List<AmenityResponse> amenities;
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
  late List<String> _selectedAmenityIds;

  @override
  void initState() {
    super.initState();
    _selectedAmenityIds = List.from(widget.initialSelected);
  }

  void _toggleAmenity(String amenityId) {
    setState(() {
      if (_selectedAmenityIds.contains(amenityId)) {
        _selectedAmenityIds.remove(amenityId);
      } else {
        _selectedAmenityIds.add(amenityId);
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      constraints: BoxConstraints(
        maxHeight: MediaQuery.of(context).size.height * 0.7,
      ),
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
                final isSelected = _selectedAmenityIds.contains(amenity.id);
                return InkWell(
                  onTap: () => _toggleAmenity(amenity.id),
                  child: Padding(
                    padding: const EdgeInsets.symmetric(vertical: 12.0),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Row(
                          children: [
                            if (amenity.iconUrl != null && amenity.iconUrl!.isNotEmpty)
                              Padding(
                                padding: const EdgeInsets.only(right: 12.0),
                                child: Image.network(
                                  amenity.iconUrl!,
                                  width: 24,
                                  height: 24,
                                  color: Colors.blue,
                                  errorBuilder: (_, __, ___) => const Icon(Icons.star, color: Colors.blue, size: 24),
                                ),
                              ),
                            Text(
                              amenity.name,
                              style: const TextStyle(
                                fontSize: 16,
                                fontWeight: FontWeight.w500,
                              ),
                            ),
                          ],
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
              widget.onConfirm(_selectedAmenityIds);
              Navigator.of(context).pop();
            },
          ),
        ],
      ),
    );
  }
}
