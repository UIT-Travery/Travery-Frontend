import 'package:flutter/material.dart';
import 'package:travery_frontend/ui/core/themes/app_colors.dart';
import 'package:travery_frontend/ui/core/themes/app_text_theme.dart';
import 'package:travery_frontend/ui/coordinator/view/widgets/coordinator_filter_button.dart';
import 'package:travery_frontend/ui/coordinator/view/widgets/coordinator_searchbar.dart';

class CoordinatorViewCoachListScreen extends StatefulWidget {
  const CoordinatorViewCoachListScreen({super.key});

  @override
  State<CoordinatorViewCoachListScreen> createState() =>
      _CoordinatorViewCoachListScreenState();
}

class _CoordinatorViewCoachListScreenState
    extends State<CoordinatorViewCoachListScreen>
    with AutomaticKeepAliveClientMixin {
  final TextEditingController _searchController = TextEditingController();

  @override
  void dispose() {
    _searchController.dispose();
    super.dispose();
  }

  @override
  bool get wantKeepAlive => true;

  @override
  Widget build(BuildContext context) {
    super.build(context);
    return Scaffold(
      backgroundColor: AppColors.background,
      body: Column(
        children: [
          _buildHeader(context),
          const SizedBox(height: 16),
          _buildSearchAndFilter(),
          const SizedBox(height: 12),
          Expanded(child: _buildList()),
        ],
      ),
    );
  }

  Widget _buildHeader(BuildContext context) {
    final statusBarHeight = MediaQuery.of(context).padding.top;
    return Container(
      width: double.infinity,
      padding: EdgeInsets.fromLTRB(16, statusBarHeight + 16, 16, 24),
      decoration: const BoxDecoration(
        gradient: LinearGradient(
          colors: [AppColors.primary, AppColors.primaryDarkBlackBlue],
          begin: Alignment.topLeft,
          end: Alignment.bottomRight,
        ),
        borderRadius: BorderRadius.only(
          bottomLeft: Radius.circular(28),
          bottomRight: Radius.circular(28),
        ),
      ),
      child: Stack(
        alignment: Alignment.center,
        children: [
          const Text(
            'Danh sách đặt xe',
            style: TextStyle(
              fontSize: AppTextTheme.headlineSmall,
              fontWeight: FontWeight.bold,
              color: Colors.white,
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildSearchAndFilter() {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 16),
      child: Row(
        children: [
          Expanded(
            child: CoordinatorSearchBar(
              title: 'Tìm kiếm',
              hint: 'Search',
              controller: _searchController,
              onSearchTap: () {}, // Stub
            ),
          ),
          const SizedBox(width: 12),
          CoordinatorFilterButton(
            onFilterTap: () {
              // TODO: open filter dialog
            },
          ),
        ],
      ),
    );
  }

  Widget _buildList() {
    return const Center(
      child: Padding(
        padding: EdgeInsets.all(32.0),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Icon(
              Icons.directions_bus_outlined,
              color: AppColors.textSecondary,
              size: 56,
            ),
            SizedBox(height: 16),
            Text(
              'Chức năng đặt xe đang được phát triển',
              textAlign: TextAlign.center,
              style: TextStyle(
                color: AppColors.textSecondary,
                fontSize: AppTextTheme.bodyMedium,
              ),
            ),
          ],
        ),
      ),
    );
  }
}
