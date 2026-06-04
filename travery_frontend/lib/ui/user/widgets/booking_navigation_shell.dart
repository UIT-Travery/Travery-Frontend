import 'package:flutter/material.dart';
import 'package:travery_frontend/ui/core/themes/app_colors.dart';

class BookingDestination {
  final IconData icon;
  final IconData selectedIcon;
  final String label;

  const BookingDestination({
    required this.icon,
    required this.selectedIcon,
    required this.label,
  });
}

class BookingNavigationShell extends StatefulWidget {
  const BookingNavigationShell({
    super.key,
    required this.titles,
    required this.onIndexChanged,
    this.initialIndex = 0,
    required this.children,
    this.showBackButton = false,
    this.onBackPressed,
    this.actions,
    this.destinations = const [],
  });

  final List<String> titles;
  final int initialIndex;
  final ValueChanged<int> onIndexChanged;
  final List<Widget> children;
  final bool showBackButton;
  final VoidCallback? onBackPressed;
  final List<Widget>? actions;
  final List<BookingDestination> destinations;

  static const List<BookingDestination> defaultDestinations = [
    BookingDestination(
      icon: Icons.confirmation_number_outlined,
      selectedIcon: Icons.confirmation_number,
      label: 'Tour',
    ),
    BookingDestination(
      icon: Icons.directions_bus_outlined,
      selectedIcon: Icons.directions_bus,
      label: 'Xe khách',
    ),
    BookingDestination(
      icon: Icons.hotel_outlined,
      selectedIcon: Icons.hotel,
      label: 'Khách sạn',
    ),
  ];

  @override
  State<BookingNavigationShell> createState() => _BookingNavigationShellState();
}

class _BookingNavigationShellState extends State<BookingNavigationShell> {
  late int _selectedIndex;
  bool _showRail = false;

  @override
  void initState() {
    super.initState();
    _selectedIndex = widget.initialIndex;
  }

  @override
  Widget build(BuildContext context) {
    final destinations = widget.destinations.isNotEmpty
        ? widget.destinations
        : BookingNavigationShell.defaultDestinations;

    return Scaffold(
      backgroundColor: const Color(0xFFFAFAFF),
      appBar: _buildAppBar(destinations),
      body: Row(
        children: [
          Expanded(
            child: IndexedStack(
              index: _selectedIndex,
              children: widget.children,
            ),
          ),
          if (widget.children.length > 1)
            AnimatedContainer(
              duration: const Duration(milliseconds: 200),
              curve: Curves.easeInOut,
              width: _showRail ? 80 : 0,
              child: _showRail
                  ? NavigationRail(
                      selectedIndex: _selectedIndex,
                      onDestinationSelected: _onDestinationSelected,
                      backgroundColor: Colors.white,
                      indicatorColor: AppColors.primary.withValues(alpha: 0.1),
                      labelType: NavigationRailLabelType.selected,
                      destinations: destinations
                          .take(widget.children.length)
                          .map(
                            (d) => NavigationRailDestination(
                              icon: Icon(d.icon),
                              selectedIcon: Icon(
                                d.selectedIcon,
                                color: AppColors.primary,
                              ),
                              label: Text(
                                d.label,
                                style: const TextStyle(fontSize: 11),
                              ),
                            ),
                          )
                          .toList(),
                    )
                  : const SizedBox.shrink(),
            ),
        ],
      ),
    );
  }

  AppBar _buildAppBar(List<BookingDestination> destinations) {
    final currentTitle = _selectedIndex < widget.titles.length
        ? widget.titles[_selectedIndex]
        : widget.titles.first;

    return AppBar(
      backgroundColor: Colors.white,
      elevation: 0,
      scrolledUnderElevation: 0,
      leading: widget.showBackButton
          ? IconButton(
              icon: const Icon(Icons.arrow_back, color: AppColors.primary),
              onPressed:
                  widget.onBackPressed ?? () => Navigator.of(context).pop(),
            )
          : null,
      automaticallyImplyLeading: !widget.showBackButton,
      title: Text(
        currentTitle,
        style: const TextStyle(
          fontSize: 18,
          fontWeight: FontWeight.w700,
          color: Color(0xFF131B2E),
        ),
      ),
      centerTitle: true,
      actions: widget.children.length > 1
          ? [
              IconButton(
                onPressed: () => setState(() => _showRail = !_showRail),
                icon: Icon(
                  _showRail ? Icons.view_sidebar : Icons.view_sidebar_outlined,
                  color: AppColors.primary,
                ),
              ),
            ]
          : widget.actions,
      bottom: PreferredSize(
        preferredSize: const Size.fromHeight(1),
        child: Container(color: const Color(0xFFE8EAF0), height: 1),
      ),
    );
  }

  void _onDestinationSelected(int index) {
    setState(() {
      _selectedIndex = index;
      _showRail = false;
    });
    widget.onIndexChanged(index);
  }
}
