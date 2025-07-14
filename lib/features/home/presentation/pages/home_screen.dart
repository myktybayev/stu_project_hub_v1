import 'package:flutter/material.dart';
import 'package:flutter_mobx/flutter_mobx.dart';
import 'package:stu_project_hub/di/service_locator.dart';
import 'package:stu_project_hub/features/home/presentation/pages/project_details_screen.dart';
import 'package:stu_project_hub/features/home/store/project_store.dart';
import 'package:stu_project_hub/core/widgets/custom_typography.dart';
import 'package:stu_project_hub/core/widgets/custom_input_field.dart';
import 'package:stu_project_hub/core/widgets/custom_card.dart';
import 'package:stu_project_hub/core/constants/colors.dart';

class HomeScreen extends StatefulWidget {
  HomeScreen({Key? key}) : super(key: key);

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  final projectStore = serviceLocator<ProjectStore>();
  final TextEditingController _searchController = TextEditingController();

  @override
  void initState() {
    super.initState();
    _searchController.text = projectStore.searchQuery;
    _searchController.addListener(() {
      projectStore.setSearch(_searchController.text);
    });
  }

  @override
  void dispose() {
    _searchController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: SingleChildScrollView(
        padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 8),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const CustomSectionTitle('Project Ideas'),
            const SizedBox(height: 16),
            CustomInputField(
              hintText: 'Search projects...',
              controller: _searchController,
            ),
            const SizedBox(height: 16),
            SizedBox(
              height: 36,
              child: Observer(
                builder:
                    (_) => ListView.separated(
                      key: ValueKey(projectStore.selectedCategory),
                      scrollDirection: Axis.horizontal,
                      shrinkWrap: true,
                      physics: const ClampingScrollPhysics(),
                      itemCount: projectStore.categories.length,
                      separatorBuilder: (_, __) => const SizedBox(width: 8),
                      itemBuilder: (context, i) {
                        final cat = projectStore.categories[i];
                        final isSelected = projectStore.selectedCategory == cat;
                        return ChoiceChip(
                          key: ValueKey(cat),
                          label:
                              isSelected
                                  ? Row(
                                    mainAxisSize: MainAxisSize.min,
                                    children: [
                                      Text(
                                        cat,
                                        style: const TextStyle(
                                          color: Colors.white,
                                          fontWeight: FontWeight.w600,
                                        ),
                                      ),
                                    ],
                                  )
                                  : Text(
                                    cat,
                                    style: const TextStyle(
                                      color: Colors.black,
                                      fontWeight: FontWeight.w600,
                                    ),
                                  ),
                          selected: isSelected,
                          selectedColor: AppColors.primary,
                          backgroundColor: const Color(0xFFE3E8F0),
                          shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(20),
                          ),
                          onSelected: (_) => projectStore.setCategory(cat),
                        );
                      },
                    ),
              ),
            ),
            const SizedBox(height: 16),
            Observer(
              builder: (_) {
                final filtered = projectStore.filteredProjects;
                if (filtered.isEmpty) {
                  return Padding(
                    padding: const EdgeInsets.only(top: 32),
                    child: Center(
                      child: Column(
                        children: [
                          Icon(
                            Icons.search_off,
                            size: 64,
                            color: Colors.grey[400],
                          ),
                          const SizedBox(height: 16),
                          Text(
                            projectStore.searchQuery.isNotEmpty
                                ? 'No projects found for "${projectStore.searchQuery}"'
                                : 'No projects found.',
                            style: TextStyle(
                              color: Colors.grey[600],
                              fontSize: 16,
                            ),
                            textAlign: TextAlign.center,
                          ),
                        ],
                      ),
                    ),
                  );
                }
                return Column(
                  children:
                      filtered
                          .map(
                            (project) => CustomCard(
                              imageUrl: project.imageUrl,
                              title: project.title,
                              category: project.category,
                              description: project.description,
                              likes: project.likes,
                              commentsCount: project.commentsCount,
                              onTap: () {
                                Navigator.of(context).push(
                                  MaterialPageRoute(
                                    builder:
                                        (_) => ProjectDetailsScreen(
                                          project: project,
                                        ),
                                  ),
                                );
                              },
                            ),
                          )
                          .toList(),
                );
              },
            ),
          ],
        ),
      ),
    );
  }
}
