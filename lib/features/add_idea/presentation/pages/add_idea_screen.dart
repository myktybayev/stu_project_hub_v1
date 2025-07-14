import 'package:flutter/material.dart';
import 'package:stu_project_hub/core/widgets/custom_primary_button.dart';
import 'package:stu_project_hub/core/widgets/custom_input_field.dart';
import 'package:stu_project_hub/core/constants/colors.dart';

class AddIdeaScreen extends StatefulWidget {
  const AddIdeaScreen({Key? key}) : super(key: key);

  @override
  State<AddIdeaScreen> createState() => _AddIdeaScreenState();
}

class _AddIdeaScreenState extends State<AddIdeaScreen> {
  String? selectedCategory;
  final List<String> categories = ['Mobile', 'Web', 'Bot', 'AI', 'IoT'];
  final List<ImageProvider?> images = [null, null, null];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Add New Project'),
        centerTitle: false,
        elevation: 0,
        backgroundColor: Colors.white,
        foregroundColor: Colors.black,
      ),
      body: SingleChildScrollView(
        padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 12),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const SizedBox(height: 8),
            const Text(
              'Project Name',
              style: TextStyle(fontWeight: FontWeight.w600, fontSize: 15),
            ),
            const SizedBox(height: 6),
            const CustomInputField(hintText: 'e.g., Campus Recycling Program'),
            const SizedBox(height: 16),
            const Text(
              'Description',
              style: TextStyle(fontWeight: FontWeight.w600, fontSize: 15),
            ),
            const SizedBox(height: 6),
            const CustomInputField(
              hintText: 'Describe your project in detail...',
              maxLines: 4,
            ),
            const SizedBox(height: 16),
            const Text(
              'Category',
              style: TextStyle(fontWeight: FontWeight.w600, fontSize: 15),
            ),
            const SizedBox(height: 6),
            Container(
              padding: const EdgeInsets.symmetric(horizontal: 12),
              decoration: BoxDecoration(
                color: Colors.grey[100],
                borderRadius: BorderRadius.circular(8),
                border: Border.all(color: Colors.grey[300]!),
              ),
              child: DropdownButton<String>(
                isExpanded: true,
                underline: const SizedBox(),
                hint: const Text('e.g., Mobile, Web, AI'),
                value: selectedCategory,
                items:
                    categories
                        .map(
                          (cat) =>
                              DropdownMenuItem(value: cat, child: Text(cat)),
                        )
                        .toList(),
                onChanged: (val) => setState(() => selectedCategory = val),
              ),
            ),
            const SizedBox(height: 20),
            const Text(
              'Upload Images (1-3)',
              style: TextStyle(fontWeight: FontWeight.w600, fontSize: 15),
            ),
            const SizedBox(height: 8),
            GestureDetector(
              onTap: () {}, // TODO: Add image picker
              child: Container(
                width: double.infinity,
                padding: const EdgeInsets.symmetric(vertical: 14),
                decoration: BoxDecoration(
                  color: AppColors.primary.withOpacity(0.12),
                  borderRadius: BorderRadius.circular(12),
                ),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: const [
                    Icon(Icons.image, color: AppColors.primary),
                    SizedBox(width: 8),
                    Text(
                      'Upload Images',
                      style: TextStyle(
                        color: AppColors.primary,
                        fontWeight: FontWeight.w600,
                      ),
                    ),
                  ],
                ),
              ),
            ),
            const SizedBox(height: 12),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: List.generate(3, (i) {
                return Container(
                  width: 70,
                  height: 70,
                  decoration: BoxDecoration(
                    color: Colors.grey[200],
                    borderRadius: BorderRadius.circular(10),
                    border: Border.all(color: Colors.grey[300]!),
                  ),
                  child:
                      images[i] != null
                          ? ClipRRect(
                            borderRadius: BorderRadius.circular(10),
                            child: Image(image: images[i]!, fit: BoxFit.cover),
                          )
                          : const Icon(
                            Icons.image,
                            color: Colors.grey,
                            size: 32,
                          ),
                );
              }),
            ),
            const SizedBox(height: 20),
            const Text(
              'GitHub Link',
              style: TextStyle(fontWeight: FontWeight.w600, fontSize: 15),
            ),
            const SizedBox(height: 6),
            const CustomInputField(
              hintText: 'e.g., https://github.com/your-project',
            ),
            const SizedBox(height: 28),
            SizedBox(
              width: double.infinity,
              height: 50,
              child: CustomPrimaryButton(
                text: 'Submit Project',
                onPressed: () {},
              ),
            ),
            const SizedBox(height: 16),
          ],
        ),
      ),
    );
  }
}
