import 'package:mobx/mobx.dart';
import 'package:stu_project_hub/domain/entities/project_model.dart';

part 'project_store.g.dart';

class ProjectStore = _ProjectStore with _$ProjectStore;

abstract class _ProjectStore with Store {
  @observable
  ObservableList<ProjectModel> allProjects = ObservableList.of([
    ProjectModel(
      title: 'Smart Home Automation',
      description:
          'A system to control home devices using voice commands and a mobile app.',
      imageUrl: 'https://images.unsplash.com/photo-1506744038136-46273834b3fb',
      category: 'IoT',
      githubLink: '',
      likes: 128,
      commentsCount: 0,
      screenshots: [],
      comments: [],
    ),
    ProjectModel(
      title: 'AI-Powered Study Buddy',
      description:
          'An intelligent assistant that helps students with their studies and assignments.',
      imageUrl: 'https://images.unsplash.com/photo-1464983953574-0892a716854b',
      category: 'AI',
      githubLink: '',
      likes: 95,
      commentsCount: 2,
      screenshots: [
        'https://i.imgur.com/1Q9Z1Zm.png',
        'https://i.imgur.com/2nCt3Sbl.jpg',
      ],
      comments: [
        ProjectComment(
          authorName: 'Alice Johnson',
          authorAvatarUrl: 'https://randomuser.me/api/portraits/women/44.jpg',
          text:
              'This is such a great idea! I really need something like this for my exams.',
        ),
        ProjectComment(
          authorName: 'Bob Smith',
          authorAvatarUrl: 'https://randomuser.me/api/portraits/men/45.jpg',
          text: 'Will it integrate with Google Scholar? That would be amazing.',
        ),
      ],
    ),
    ProjectModel(
      title: 'Campus Ride-Share App',
      description:
          'Connects students for carpooling within and around the campus.',
      imageUrl: 'https://images.unsplash.com/photo-1518717758536-85ae29035b6d',
      category: 'Mobile',
      githubLink: '',
      likes: 210,
      commentsCount: 0,
      screenshots: [],
      comments: [],
    ),
    ProjectModel(
      title: 'Campus Ride-Share App',
      description:
          'Connects students for carpooling within and around the campus.',
      imageUrl: 'https://images.unsplash.com/photo-1518717758536-85ae29035b6d',
      category: 'Web',
      githubLink: '',
      likes: 20,
      commentsCount: 0,
      screenshots: [],
      comments: [],
    ),
  ]);

  @observable
  String selectedCategory = 'All';

  @observable
  String searchQuery = '';

  @computed
  List<ProjectModel> get filteredProjects {
    var filtered = allProjects.toList();
    if (selectedCategory != 'All') {
      filtered = filtered.where((p) => p.category == selectedCategory).toList();
    }
    if (searchQuery.isNotEmpty) {
      final q = searchQuery.toLowerCase();
      filtered =
          filtered
              .where(
                (p) =>
                    p.title.toLowerCase().contains(q) ||
                    p.description.toLowerCase().contains(q) ||
                    p.category.toLowerCase().contains(q),
              )
              .toList();
    }
    return filtered;
  }

  @computed
  List<String> get categories {
    final all = allProjects.map((p) => p.category).toSet().toList();
    all.sort(); // алфавит бойынша
    return ['All', ...all];
  }

  @action
  void setCategory(String cat) => selectedCategory = cat;

  @action
  void setSearch(String val) => searchQuery = val;
}
