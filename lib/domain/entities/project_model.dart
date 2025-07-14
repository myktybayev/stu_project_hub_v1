class ProjectModel {
  final String title;
  final String description;
  final String imageUrl;
  final String category;
  final String githubLink;
  final int likes;
  final int commentsCount;
  final List<String> screenshots;
  final List<ProjectComment> comments;

  ProjectModel({
    required this.title,
    required this.description,
    required this.imageUrl,
    required this.category,
    required this.githubLink,
    required this.likes,
    required this.commentsCount,
    required this.screenshots,
    required this.comments,
  });
}

class ProjectComment {
  final String authorName;
  final String authorAvatarUrl;
  final String text;

  ProjectComment({
    required this.authorName,
    required this.authorAvatarUrl,
    required this.text,
  });
}
