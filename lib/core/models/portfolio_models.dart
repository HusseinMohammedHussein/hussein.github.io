class Profile {
  const Profile({
    required this.fullName,
    required this.shortName,
    required this.title,
    required this.tagline,
    required this.summary,
    required this.location,
    required this.email,
    required this.githubUrl,
    required this.linkedinUrl,
    required this.resumePath,
    this.phone,
  });

  final String fullName;
  final String shortName;
  final String title;
  final String tagline;
  final String summary;
  final String location;
  final String email;
  final String githubUrl;
  final String linkedinUrl;
  final String resumePath;
  final String? phone;
}

class SocialLink {
  const SocialLink({
    required this.label,
    required this.url,
    required this.icon,
  });

  final String label;
  final String url;
  final SocialIcon icon;
}

enum SocialIcon { github, linkedin, email }

class NavItem {
  const NavItem({required this.label, required this.sectionId});

  final String label;
  final String sectionId;
}

class SkillGroup {
  const SkillGroup({required this.title, required this.skills});

  final String title;
  final List<String> skills;
}

class ProjectLink {
  const ProjectLink({required this.label, required this.url});

  final String label;
  final String url;
}

class Project {
  const Project({
    required this.slug,
    required this.name,
    required this.shortDescription,
    required this.description,
    required this.technologies,
    required this.technicalHighlights,
    required this.contribution,
    this.challenges = const [],
    this.links = const [],
    this.imagePath,
  });

  final String slug;
  final String name;
  final String shortDescription;
  final String description;
  final List<String> technologies;
  final List<String> technicalHighlights;
  final String contribution;
  final List<String> challenges;
  final List<ProjectLink> links;
  final String? imagePath;
}

class Experience {
  const Experience({
    required this.company,
    required this.role,
    required this.period,
    required this.technologies,
    required this.responsibilities,
    this.isPlaceholderResponsibilities = false,
  });

  final String company;
  final String role;
  final String period;
  final List<String> technologies;
  final List<String> responsibilities;
  final bool isPlaceholderResponsibilities;
}

class ServiceOffering {
  const ServiceOffering({required this.title, required this.description});

  final String title;
  final String description;
}

class ApproachStep {
  const ApproachStep({
    required this.number,
    required this.title,
    required this.description,
  });

  final String number;
  final String title;
  final String description;
}

class PortfolioContent {
  const PortfolioContent({
    required this.profile,
    required this.socialLinks,
    required this.navItems,
    required this.aboutParagraphs,
    required this.skillGroups,
    required this.projects,
    required this.experiences,
    required this.services,
    required this.approach,
  });

  final Profile profile;
  final List<SocialLink> socialLinks;
  final List<NavItem> navItems;
  final List<String> aboutParagraphs;
  final List<SkillGroup> skillGroups;
  final List<Project> projects;
  final List<Experience> experiences;
  final List<ServiceOffering> services;
  final List<ApproachStep> approach;

  Project? projectBySlug(String slug) {
    for (final project in projects) {
      if (project.slug == slug) return project;
    }
    return null;
  }
}
