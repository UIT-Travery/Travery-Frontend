import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:travery_frontend/ui/core/themes/app_colors.dart';
import 'package:travery_frontend/ui/core/themes/app_text_theme.dart';
import 'package:travery_frontend/ui/coordinator/view_models/coordinator_tour_template_list_view_model.dart';
import 'package:travery_frontend/domain/models/coordinator/coordinator_tour_template/coordinator_tour_template.dart';
import 'package:travery_frontend/routing/routes.dart';
import 'package:travery_frontend/utils/core_result.dart' as core_result;

class CoordinatorViewTourTemplateListScreen extends StatefulWidget {
  final CoordinatorTourTemplateListViewModel viewModel;

  const CoordinatorViewTourTemplateListScreen({
    super.key,
    required this.viewModel,
  });

  @override
  State<CoordinatorViewTourTemplateListScreen> createState() =>
      _CoordinatorViewTourTemplateListScreenState();
}

class _CoordinatorViewTourTemplateListScreenState
    extends State<CoordinatorViewTourTemplateListScreen> {
  final TextEditingController _searchController = TextEditingController();

  @override
  void initState() {
    super.initState();
    WidgetsBinding.instance.addPostFrameCallback((_) {
      widget.viewModel.loadTemplates.execute();
    });
  }

  @override
  void dispose() {
    _searchController.dispose();
    widget.viewModel.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.background,
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 16.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              const SizedBox(height: 8.0),
              // Back Button
              IconButton(
                padding: EdgeInsets.zero,
                constraints: const BoxConstraints(),
                icon: const Icon(
                  Icons.arrow_back,
                  color: AppColors.textPrimary,
                  size: 28,
                ),
                onPressed: () => Navigator.of(context).pop(),
              ),
              const SizedBox(height: 16.0),
              // Title and "+ Tạo lộ trình" Button Row
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Expanded(
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        const Text(
                          'Chọn lộ trình',
                          style: TextStyle(
                            fontSize: AppTextTheme.headlineLarge,
                            fontWeight: FontWeight.bold,
                            color: AppColors.textPrimary,
                          ),
                        ),
                        const SizedBox(height: 4.0),
                        const Text(
                          'Chọn lộ trình để tiếp tục tạo tour',
                          style: TextStyle(
                            fontSize: AppTextTheme.bodyMedium,
                            color: AppColors.textSecondary,
                          ),
                        ),
                      ],
                    ),
                  ),
                  const SizedBox(width: 8.0),
                  // Create route button
                  Material(
                    color: AppColors.primaryDarkBlackBlue,
                    borderRadius: BorderRadius.circular(8.0),
                    child: InkWell(
                      borderRadius: BorderRadius.circular(8.0),
                      onTap: () async {
                        await context.push(
                          Routes.coordinatorCreateTourTemplate,
                        );
                        // Refresh list after returning from create screen
                        widget.viewModel.loadTemplates.execute();
                      },
                      child: const Padding(
                        padding: EdgeInsets.symmetric(
                          horizontal: 12.0,
                          vertical: 8.0,
                        ),
                        child: Row(
                          mainAxisSize: MainAxisSize.min,
                          children: [
                            Icon(Icons.add, color: Colors.white, size: 16),
                            SizedBox(width: 4.0),
                            Text(
                              'Tạo lộ trình',
                              style: TextStyle(
                                color: Colors.white,
                                fontWeight: FontWeight.bold,
                                fontSize: AppTextTheme.bodySmall,
                              ),
                            ),
                          ],
                        ),
                      ),
                    ),
                  ),
                ],
              ),
              const SizedBox(height: 20.0),
              // Search Bar
              _buildSearchBar(),
              const SizedBox(height: 16.0),
              // List / Grid of cards
              Expanded(
                child: ListenableBuilder(
                  listenable: Listenable.merge([
                    widget.viewModel.loadTemplates,
                    widget.viewModel.filteredTemplates,
                  ]),
                  builder: (context, child) {
                    final viewModel = widget.viewModel;
                    if (viewModel.loadTemplates.running) {
                      return const Center(child: CircularProgressIndicator());
                    }
                    if (viewModel.loadTemplates.error) {
                      final error =
                          (viewModel.loadTemplates.result as core_result.Error)
                              .error;
                      return Center(
                        child: Text(
                          error.toString(),
                          style: const TextStyle(color: AppColors.error),
                        ),
                      );
                    }

                    final templates = viewModel.filteredTemplates.value;
                    if (templates.isEmpty) {
                      return const Center(
                        child: Text(
                          'Không tìm thấy lộ trình nào',
                          style: TextStyle(color: AppColors.textSecondary),
                        ),
                      );
                    }
                    return GridView.builder(
                      physics: const BouncingScrollPhysics(),
                      gridDelegate:
                          const SliverGridDelegateWithFixedCrossAxisCount(
                            crossAxisCount: 2,
                            crossAxisSpacing: 12.0,
                            mainAxisSpacing: 12.0,
                            childAspectRatio: 0.85,
                          ),
                      itemCount: templates.length,
                      itemBuilder: (context, index) {
                        final template = templates[index];
                        return _buildTemplateCard(template);
                      },
                    );
                  },
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }

  Widget _buildSearchBar() {
    return Container(
      decoration: BoxDecoration(
        color: const Color(
          0xFFF3F4FB,
        ), // Light grey/blue color matching the mockup
        borderRadius: BorderRadius.circular(12.0),
      ),
      child: TextField(
        controller: _searchController,
        onChanged: (query) {
          widget.viewModel.searchQuery.value = query;
        },
        style: const TextStyle(
          fontSize: AppTextTheme.bodyMedium,
          color: AppColors.textPrimary,
        ),
        decoration: const InputDecoration(
          prefixIcon: Icon(Icons.search, color: AppColors.textSecondary),
          hintText: 'Tìm kiếm lộ trình...',
          hintStyle: TextStyle(
            color: AppColors.textHint,
            fontSize: AppTextTheme.bodyMedium,
          ),
          border: InputBorder.none,
          contentPadding: EdgeInsets.symmetric(vertical: 14.0),
        ),
      ),
    );
  }

  Widget _buildTemplateCard(CoordinatorTourTemplate template) {
    return Container(
      decoration: BoxDecoration(
        color: AppColors.surface,
        borderRadius: BorderRadius.circular(16.0),
        boxShadow: [
          BoxShadow(
            color: Colors.black.withValues(alpha: 0.04),
            blurRadius: 10,
            offset: const Offset(0, 4),
          ),
        ],
      ),
      child: Material(
        color: Colors.transparent,
        child: InkWell(
          borderRadius: BorderRadius.circular(16.0),
          onTap: () {
            // Return selected template
            Navigator.of(context).pop(template);
          },
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              // Top Image
              Expanded(
                child: ClipRRect(
                  borderRadius: const BorderRadius.only(
                    topLeft: Radius.circular(16.0),
                    topRight: Radius.circular(16.0),
                  ),
                  child: Image.network(
                    template.imageUrl,
                    width: double.infinity,
                    fit: BoxFit.cover,
                    errorBuilder: (context, error, stackTrace) {
                      return Container(
                        color: Colors.grey[200],
                        child: const Icon(
                          Icons.image_not_supported,
                          color: Colors.grey,
                        ),
                      );
                    },
                  ),
                ),
              ),
              // Info section
              Padding(
                padding: const EdgeInsets.all(10.0),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      template.name,
                      maxLines: 1,
                      overflow: TextOverflow.ellipsis,
                      style: const TextStyle(
                        fontSize: AppTextTheme.bodyMedium,
                        fontWeight: FontWeight.bold,
                        color: AppColors.textPrimary,
                      ),
                    ),
                    const SizedBox(height: 4.0),
                    Text(
                      _formatPrice(template.adultPrice),
                      style: const TextStyle(
                        fontSize: AppTextTheme.bodyMedium,
                        fontWeight: FontWeight.bold,
                        color: AppColors.primary,
                      ),
                    ),
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }

  String _formatPrice(String priceStr) {
    try {
      final value = int.parse(priceStr);
      final buffer = StringBuffer();
      final s = value.toString();
      for (int i = 0; i < s.length; i++) {
        if (i > 0 && (s.length - i) % 3 == 0) {
          buffer.write('.');
        }
        buffer.write(s[i]);
      }
      return '${buffer.toString()}đ';
    } catch (e) {
      return '$priceStr đ';
    }
  }
}
