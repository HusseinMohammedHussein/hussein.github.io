import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';

import '../../core/constants/section_ids.dart';
import '../about/about_section.dart';
import '../approach/approach_section.dart';
import '../contact/contact_section.dart';
import '../experience/experience_section.dart';
import '../footer/site_footer.dart';
import '../hero/hero_section.dart';
import '../nav/site_header.dart';
import '../projects/projects_section.dart';
import '../services/services_section.dart';
import '../skills/skills_section.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key, this.initialSection});

  final String? initialSection;

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  final _scaffoldKey = GlobalKey<ScaffoldState>();
  final _scrollController = ScrollController();
  final _sectionKeys = <String, GlobalKey>{
    SectionIds.hero: GlobalKey(),
    SectionIds.about: GlobalKey(),
    SectionIds.skills: GlobalKey(),
    SectionIds.projects: GlobalKey(),
    SectionIds.experience: GlobalKey(),
    SectionIds.services: GlobalKey(),
    SectionIds.approach: GlobalKey(),
    SectionIds.contact: GlobalKey(),
  };

  String? _scrolledTo;

  @override
  void initState() {
    super.initState();
    WidgetsBinding.instance.addPostFrameCallback((_) {
      _scrollToSection(widget.initialSection);
    });
  }

  @override
  void didUpdateWidget(HomePage oldWidget) {
    super.didUpdateWidget(oldWidget);
    if (oldWidget.initialSection != widget.initialSection) {
      _scrolledTo = null;
      _scrollToSection(widget.initialSection);
    }
  }

  @override
  void dispose() {
    _scrollController.dispose();
    super.dispose();
  }

  void _scrollToSection(String? id) {
    if (id == null) return;
    if (_scrolledTo == id) return;
    final target = _sectionKeys[id]?.currentContext;
    if (target == null) return;
    _scrolledTo = id;
    final reduce = MediaQuery.disableAnimationsOf(context);
    Scrollable.ensureVisible(
      target,
      duration: reduce ? Duration.zero : const Duration(milliseconds: 500),
      curve: Curves.easeInOutCubic,
      alignment: 0.02,
    );
  }

  void _onNavigate(String id) {
    final path = GoRouterState.of(context).uri.path;
    if (path != '/') {
      context.go('/?section=$id');
      return;
    }
    _scrolledTo = null;
    _scrollToSection(id);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      key: _scaffoldKey,
      endDrawer: MobileMenu(onNavigate: _onNavigate),
      body: Column(
        children: [
          SiteHeader(
            onNavigate: _onNavigate,
            onOpenMenu: () => _scaffoldKey.currentState?.openEndDrawer(),
          ),
          Expanded(
            child: SelectionArea(
              child: SingleChildScrollView(
                controller: _scrollController,
                child: Column(
                  children: [
                    KeyedSubtree(
                      key: _sectionKeys[SectionIds.hero],
                      child: HeroSection(onNavigate: _onNavigate),
                    ),
                    KeyedSubtree(
                      key: _sectionKeys[SectionIds.about],
                      child: const AboutSection(),
                    ),
                    KeyedSubtree(
                      key: _sectionKeys[SectionIds.skills],
                      child: const SkillsSection(),
                    ),
                    KeyedSubtree(
                      key: _sectionKeys[SectionIds.projects],
                      child: const ProjectsSection(),
                    ),
                    KeyedSubtree(
                      key: _sectionKeys[SectionIds.experience],
                      child: const ExperienceSection(),
                    ),
                    KeyedSubtree(
                      key: _sectionKeys[SectionIds.services],
                      child: const ServicesSection(),
                    ),
                    KeyedSubtree(
                      key: _sectionKeys[SectionIds.approach],
                      child: const ApproachSection(),
                    ),
                    KeyedSubtree(
                      key: _sectionKeys[SectionIds.contact],
                      child: const ContactSection(),
                    ),
                    const SiteFooter(),
                  ],
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
