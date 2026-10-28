import '../constants/section_ids.dart';
import '../models/portfolio_models.dart';
import 'portfolio_repository.dart';

class LocalPortfolioRepository implements PortfolioRepository {
  const LocalPortfolioRepository();

  @override
  Future<PortfolioContent> load() async => localPortfolioContent;
}

const localPortfolioContent = PortfolioContent(
  profile: Profile(
    fullName: 'Hussein Mohammed',
    shortName: 'HM',
    title: 'Senior Flutter Developer',
    tagline:
        'I build scalable, maintainable mobile applications with Flutter and Dart.',
    summary:
        'Flutter and Dart are the core of my work, with Clean Architecture, '
        'BLoC/Cubit, REST APIs, Firebase, and earlier Android native experience '
        'shaping how I design production apps.',
    location: 'Faisal, Giza, Egypt',
    email: 'dev.hussien.m@gmail.com',
    githubUrl: 'https://github.com/HusseinMohammedHussein',
    linkedinUrl: 'https://www.linkedin.com/in/husseinmohammedhussein',
    resumePath: 'resume/Hussein_Mohammed_Flutter_Developer_CV.pdf',
  ),
  socialLinks: [
    SocialLink(
      label: 'GitHub',
      url: 'https://github.com/HusseinMohammedHussein',
      icon: SocialIcon.github,
    ),
    SocialLink(
      label: 'LinkedIn',
      url: 'https://www.linkedin.com/in/husseinmohammedhussein',
      icon: SocialIcon.linkedin,
    ),
    SocialLink(
      label: 'Email',
      url: 'mailto:dev.hussien.m@gmail.com',
      icon: SocialIcon.email,
    ),
  ],
  navItems: [
    NavItem(label: 'About', sectionId: SectionIds.about),
    NavItem(label: 'Skills', sectionId: SectionIds.skills),
    NavItem(label: 'Projects', sectionId: SectionIds.projects),
    NavItem(label: 'Experience', sectionId: SectionIds.experience),
    NavItem(label: 'Services', sectionId: SectionIds.services),
    NavItem(label: 'Approach', sectionId: SectionIds.approach),
    NavItem(label: 'Contact', sectionId: SectionIds.contact),
  ],
  aboutParagraphs: [
    'I am a Flutter developer with 4+ years of experience building '
        'cross-platform mobile applications, after working in Android native '
        'development. That background still shows up when a product needs '
        'platform-specific behavior or careful performance work.',
    'I focus on scalable, maintainable production apps: clear architecture, '
        'predictable state management, and code that other developers can '
        'extend without fear. I care about performance, clean code, and the '
        'day-to-day developer experience of the teams I work with.',
    'Based in Giza, Egypt. Bachelor’s degree, 2018.',
  ],
  skillGroups: [
    SkillGroup(
      title: 'Mobile Development',
      skills: ['Flutter', 'Dart', 'Android', 'Kotlin', 'Java'],
    ),
    SkillGroup(
      title: 'Architecture',
      skills: [
        'Clean Architecture',
        'SOLID',
        'MVVM',
        'Design Patterns',
        'BLoC',
        'Cubit',
        'Provider',
        'MobX',
        'Dependency Injection',
      ],
    ),
    SkillGroup(
      title: 'Backend & APIs',
      skills: [
        'REST APIs',
        'Dio',
        'Firebase',
        'Firestore',
        'Firebase Authentication',
        'SQL',
        'Redis',
      ],
    ),
    SkillGroup(
      title: 'Development',
      skills: [
        'Git',
        'CI/CD',
        'Codemagic',
        'Fastlane',
        'Shorebird',
        'Testing',
        'Debugging',
        'Performance Optimization',
      ],
    ),
    SkillGroup(
      title: 'Navigation',
      skills: ['GoRouter', 'Deep Linking'],
    ),
  ],
  projects: [
    Project(
      slug: 'aladwaa',
      name: 'Aladwaa',
      shortDescription:
          'Education app with recorded lessons, live sessions, mentorship, and assessments.',
      description:
          'An education app that delivers digital learning through recorded '
          'video lessons, live sessions, mentorship, assessments, and '
          'performance tracking, helping students learn and follow academic progress.',
      technologies: ['Flutter', 'Dart'],
      technicalHighlights: [
        'Cross-platform Flutter client',
        'Video lessons and live sessions',
        'Assessments and performance tracking',
      ],
      contribution:
          'Flutter development on the Aladwaa education product at Nahdet Misr.',
      links: [
        ProjectLink(
          label: 'Google Play',
          url:
              'https://play.google.com/store/apps/details?id=com.nahdetmisr.adwaa&hl=ar',
        ),
        ProjectLink(
          label: 'App Store',
          url: 'https://apps.apple.com/us/app/aladwaa-education/id1540942437',
        ),
      ],
    ),
    Project(
      slug: 'aladwaa-challenge',
      name: 'Aladwaa Challenge',
      shortDescription:
          'Competitive educational quizzes and live challenges for grades 4–9.',
      description:
          'A competitive educational game for Grade 4–9 students that turns '
          'curriculum-based learning into interactive quizzes, real-time '
          'challenges, and leaderboard competitions aligned with the Egyptian '
          'Ministry of Education.',
      technologies: ['Flutter', 'Dart'],
      technicalHighlights: [
        'Quiz and real-time challenge flows',
        'Leaderboards',
        'Curriculum-aligned content',
      ],
      contribution:
          'Flutter development on the Aladwaa Challenge product at Nahdet Misr.',
      links: [
        ProjectLink(
          label: 'Google Play',
          url:
              'https://play.google.com/store/apps/details?id=com.nahdetmisr.aladwaa_challange&hl=ar',
        ),
        ProjectLink(
          label: 'App Store',
          url: 'https://apps.apple.com/us/app/aladwaa-challenge/id6756569976',
        ),
      ],
    ),
    Project(
      slug: 'wafi-health',
      name: 'Wafi Health',
      shortDescription:
          'Healthcare marketplace for clinics, centers, and diagnostic services in Saudi Arabia.',
      description:
          'A healthcare marketplace that connects users with accredited clinics '
          'and centers in Saudi Arabia, offering verified medical services and '
          'diagnostic tests.',
      technologies: ['Flutter', 'Dart'],
      technicalHighlights: [
        'Marketplace discovery of medical services',
        'Booking-oriented healthcare flows',
        'Multi-store distribution (Play, App Store, AppGallery)',
      ],
      contribution:
          'Flutter work on the Wafi Health marketplace client.',
      links: [
        ProjectLink(
          label: 'Google Play',
          url:
              'https://play.google.com/store/apps/details?id=com.al7osam.life_health&hl=en',
        ),
        ProjectLink(
          label: 'App Store',
          url:
              'https://apps.apple.com/us/app/%D9%88%D8%A7%D9%81%D9%8A-%D9%87%D9%8A%D9%84%D8%AB-wafi-health/id1626258339',
        ),
        ProjectLink(
          label: 'AppGallery',
          url: 'https://appgallery.huawei.com/app/C111561369',
        ),
      ],
    ),
    Project(
      slug: 'cashless',
      name: 'Cashless',
      shortDescription:
          'Fintech app for community management and related payment transactions.',
      description:
          'A fintech app where a user can add a community and manage payment '
          'transactions related to that community.',
      technologies: ['Flutter', 'REST APIs', 'SOAP', 'Java Spring'],
      technicalHighlights: [
        'Flutter client',
        'Payment gateway integration',
        'REST and SOAP APIs',
        'Java Spring backend (Cyclos system)',
      ],
      contribution:
          'Flutter development on Cashless at CashCall, including payment and API integration.',
      links: [
        ProjectLink(
          label: 'Google Play',
          url:
              'https://play.google.com/store/apps/details?id=com.cashcall.cashless&hl=en',
        ),
        ProjectLink(
          label: 'App Store',
          url: 'https://apps.apple.com/eg/app/cashcall-cashless/id1544049703',
        ),
      ],
    ),
    Project(
      slug: 'hedomy',
      name: 'Hedomy',
      shortDescription: 'Marketplace for selling used clothes.',
      description: 'A commerce app focused on selling used clothes.',
      technologies: ['Flutter'],
      technicalHighlights: ['Flutter client', 'Store distribution on Play and App Store'],
      contribution: 'Flutter development on Hedomy.',
      links: [
        ProjectLink(
          label: 'Google Play',
          url:
              'https://play.google.com/store/apps/details?id=hedomy.hedomy&pcampaignid=web_share',
        ),
        ProjectLink(
          label: 'App Store',
          url: 'https://apps.apple.com/us/app/hedomy/id6503479026',
        ),
      ],
    ),
    Project(
      slug: 'orevan-events',
      name: 'Orevan Events',
      shortDescription:
          'Event subscription management with Firebase and national-ID lookup.',
      description:
          'Built for event subscription management. Firebase is the backend. '
          'The app can fetch user data by national ID when that user was already '
          'registered on another event.',
      technologies: ['Flutter', 'Firebase'],
      technicalHighlights: [
        'Firebase as backend',
        'Event subscription management',
        'National-ID lookup across events',
      ],
      contribution: 'Designed and built the Orevan Events app.',
      links: [
        ProjectLink(
          label: 'App Store',
          url: 'https://apps.apple.com/us/app/orevan-events/id1539934668',
        ),
      ],
    ),
    Project(
      slug: 'fixawy',
      name: 'Fixawy',
      shortDescription:
          'Dual-sided booking platform for users and service providers.',
      description:
          'A dual-sided platform: users book orders, and providers (fixers) '
          'accept or deny them.',
      technologies: [
        'Flutter',
        'MobX',
        'REST APIs',
        'FCM',
        'Paytabs',
      ],
      technicalHighlights: [
        'Dual-sided user and provider modes',
        'MobX state management',
        'REST APIs and FCM',
        'Paytabs payments',
        'Arabic and English',
        'Dark and light themes',
      ],
      contribution: 'Flutter development on the Fixawy client.',
      links: [
        ProjectLink(
          label: 'Google Play',
          url: 'https://play.google.com/store/apps/developer?id=Fixawy+LLC',
        ),
        ProjectLink(
          label: 'App Store',
          url: 'https://apps.apple.com/eg/app/fixawy/id1071671875',
        ),
      ],
    ),
    Project(
      slug: 'wassalny',
      name: 'Wassalny',
      shortDescription:
          'Dual-sided transportation app for riders and drivers.',
      description:
          'A dual-sided transportation platform: users request a car from one '
          'place to another, and drivers can accept or deny the request.',
      technologies: ['Android', 'Java', 'Firebase', 'Redis', 'Google Maps'],
      technicalHighlights: [
        'Android Java native',
        'Firebase',
        'Redis',
        'Google Maps',
      ],
      contribution: 'Android native development on Wassalny.',
      links: [],
    ),
    Project(
      slug: 'iec-attendance',
      name: 'Event Attendance Manager',
      shortDescription:
          'QR check-in for promoters at the International E-Commerce Expo (IEC).',
      description:
          'Built for the International E-Commerce Expo (IEC), an annual trade '
          'show organized under the Saudi Arabian Chamber of Commerce umbrella. '
          'Promoters register invited users by scanning a QR code that was sent '
          'to the user’s registered email.',
      technologies: ['Flutter', 'QR scanning'],
      technicalHighlights: ['Flutter', 'QR scan check-in'],
      contribution: 'Flutter development of the attendance/check-in flow.',
      links: [
        ProjectLink(
          label: 'IEC event',
          url: 'https://umbrella.sa/site/event/IEC',
        ),
      ],
    ),
    Project(
      slug: 'aqar-plus',
      name: 'Aqar-Plus',
      shortDescription: 'CRM business app integrated with Odoo.',
      description: 'A CRM business application built with Flutter and integrated with Odoo.',
      technologies: ['Flutter', 'Odoo'],
      technicalHighlights: ['Flutter client', 'Odoo integration'],
      contribution: 'Flutter development and Odoo integration on Aqar-Plus.',
      links: [],
    ),
    Project(
      slug: 'shopping-app',
      name: 'Shopping App',
      shortDescription: 'E-commerce Android app with a public training API.',
      description: 'An e-commerce shopping app built in Kotlin Android native.',
      technologies: ['Kotlin', 'Android', 'REST APIs'],
      technicalHighlights: [
        'Kotlin Android native',
        'REST integration with a public student API',
      ],
      contribution: 'Built the native Android shopping client.',
      links: [
        ProjectLink(
          label: 'GitHub',
          url: 'https://github.com/HusseinMohammedHussein/ShoppingApp',
        ),
      ],
    ),
    Project(
      slug: 'tmdb-movies',
      name: 'TMDb Movies',
      shortDescription: 'Android movies app using The Movie Database API.',
      description:
          'A movies app built with Java Android native, integrated with The Movie Database API.',
      technologies: ['Java', 'Android', 'REST APIs'],
      technicalHighlights: ['Java Android native', 'TMDb API integration'],
      contribution: 'Built the Android movies client.',
      links: [
        ProjectLink(
          label: 'Google Play',
          url: 'https://play.google.com/store/apps/details?id=com.tmdbapi',
        ),
      ],
    ),
  ],
  experiences: [
    Experience(
      company: 'Nahdet Misr',
      role: 'Flutter Developer',
      period: 'Apr 2025 – Present',
      technologies: ['Flutter', 'Dart'],
      // TODO: Replace with responsibilities confirmed by Hussein.
      isPlaceholderResponsibilities: true,
      responsibilities: [
        'Flutter development on education products including Aladwaa and Aladwaa Challenge.',
      ],
    ),
    Experience(
      company: 'Orevan Company',
      role: 'Flutter Developer',
      period: 'Aug 2024 – Mar 2025',
      technologies: ['Flutter', 'Firebase'],
      // TODO: Replace with responsibilities confirmed by Hussein.
      isPlaceholderResponsibilities: true,
      responsibilities: [
        'Flutter development, including event-related product work such as Orevan Events.',
      ],
    ),
    Experience(
      company: 'Daldart Company',
      role: 'Flutter Developer',
      period: 'Jan 2024 – Jun 2024',
      technologies: ['Flutter'],
      // TODO: Replace with responsibilities confirmed by Hussein.
      isPlaceholderResponsibilities: true,
      responsibilities: [
        'Flutter application development. Detailed scope to be added.',
      ],
    ),
    Experience(
      company: 'CashCall Company',
      role: 'Flutter Developer',
      period: 'Oct 2021 – Jan 2024',
      technologies: ['Flutter', 'REST APIs', 'SOAP', 'Payments'],
      // TODO: Replace with responsibilities confirmed by Hussein.
      isPlaceholderResponsibilities: true,
      responsibilities: [
        'Flutter development on fintech product work including Cashless.',
      ],
    ),
    Experience(
      company: 'Visions tech Company',
      role: 'Android Developer',
      period: 'Oct 2020 – Apr 2021',
      technologies: ['Android', 'Java', 'Kotlin'],
      // TODO: Replace with responsibilities confirmed by Hussein.
      isPlaceholderResponsibilities: true,
      responsibilities: [
        'Android native development. Detailed scope to be added.',
      ],
    ),
  ],
  services: [
    ServiceOffering(
      title: 'Flutter Application Development',
      description:
          'New Flutter apps from architecture through store-ready builds, with a focus on maintainable Dart.',
    ),
    ServiceOffering(
      title: 'Existing App Maintenance',
      description:
          'Ongoing feature work, dependency updates, and production fixes on existing Flutter codebases.',
    ),
    ServiceOffering(
      title: 'Flutter Architecture & Refactoring',
      description:
          'Structure, state management, and module boundaries so the app can grow without collapsing into a monolith.',
    ),
    ServiceOffering(
      title: 'API Integration',
      description:
          'REST (and SOAP where needed) clients, error handling, and mapping that stays testable.',
    ),
    ServiceOffering(
      title: 'Firebase Integration',
      description:
          'Auth, Firestore, messaging, and related Firebase services wired into a Flutter client.',
    ),
    ServiceOffering(
      title: 'UI Implementation',
      description:
          'Pixel-aware Flutter UI from design files, including localization and light/dark themes.',
    ),
    ServiceOffering(
      title: 'Performance Optimization',
      description:
          'Rebuild cost, jank, and platform-specific bottlenecks — including native Android experience when it matters.',
    ),
    ServiceOffering(
      title: 'Store Release Support',
      description:
          'Play Store and App Store release support, plus CI/CD with tools such as Codemagic, Fastlane, and Shorebird.',
    ),
  ],
  approach: [
    ApproachStep(
      number: '01',
      title: 'Understand',
      description:
          'Understand product requirements and technical constraints before choosing tools.',
    ),
    ApproachStep(
      number: '02',
      title: 'Design',
      description:
          'Define architecture, state management, navigation, and API strategy.',
    ),
    ApproachStep(
      number: '03',
      title: 'Build',
      description: 'Implement clean, reusable, maintainable Flutter code.',
    ),
    ApproachStep(
      number: '04',
      title: 'Test',
      description:
          'Validate functionality, edge cases, and responsive behavior.',
    ),
    ApproachStep(
      number: '05',
      title: 'Deliver',
      description:
          'Prepare builds, CI/CD, monitoring, and production releases.',
    ),
  ],
);
