You are a senior Flutter architect, UI/UX designer, and frontend engineer.

I want you to build a production-quality personal portfolio website using Flutter Web.
you can check my cv at this file: Hussein_Mohammed_Flutter_Developer_CV.pdf

The website is for a professional Flutter developer and should look like a premium modern developer portfolio — clean, minimal, technically impressive, responsive, fast, and accessible.

==================================================
1. PROJECT GOAL
==================================================

Build a personal portfolio website that presents me as a professional Senior Flutter Developer.

The website should communicate:

- Who I am
- My Flutter/mobile development experience
- My technical skills
- My projects
- My architecture and engineering approach
- My professional experience
- My services
- My GitHub/LinkedIn/contact information

The website should NOT look like a generic AI-generated template.

It should feel like a real professional developer's personal brand.

Prioritize:
- Clean visual hierarchy
- Excellent typography
- Strong spacing
- Modern but restrained animations
- Excellent responsive behavior
- Professional developer-focused design
- Accessibility
- Performance
- Maintainable Flutter architecture

==================================================
2. TECHNOLOGY
==================================================

Use:

- Flutter Web
- Dart
- Material 3
- Responsive layouts
- GoRouter if routing is required
- flutter_bloc / Cubit if state management is needed
- get_it for dependency injection only where actually useful
- Google Fonts or another appropriate font package
- url_launcher for external links

Do NOT introduce unnecessary packages.

Keep dependencies minimal.

Use the latest stable APIs compatible with the Flutter version already configured in the project.

IMPORTANT:
Do not upgrade Flutter unless absolutely necessary.

First inspect the existing Flutter/Dart version and project structure.

==================================================
3. ARCHITECTURE
==================================================

Use a clean and scalable structure.

Prefer feature-based organization.

Example:

lib/
├── app/
│   ├── router/
│   ├── theme/
│   └── app.dart
│
├── core/
│   ├── constants/
│   ├── extensions/
│   ├── utils/
│   └── widgets/
│
├── features/
│   ├── home/
│   ├── about/
│   ├── projects/
│   ├── experience/
│   ├── skills/
│   ├── services/
│   └── contact/
│
└── main.dart

Do not over-engineer a simple portfolio.

Use architecture where it provides real value.

Avoid creating unnecessary repositories, use cases, Cubits, services, or abstractions for static content.

==================================================
4. WEBSITE STRUCTURE
==================================================

Create the following sections:

1. Navigation
2. Hero
3. About
4. Skills
5. Projects
6. Experience
7. Services
8. Technical approach / architecture
9. Contact
10. Footer

The page should feel like one cohesive experience.

Use smooth scrolling between sections.

Navigation should work correctly on:
- Desktop
- Tablet
- Mobile

On mobile, use an appropriate navigation menu/drawer.

==================================================
5. HERO SECTION
==================================================

Create a strong first impression.

Example content:

Hussein Mohammed

Senior Flutter Developer

"I build scalable, maintainable mobile applications with Flutter and Dart."

Add a short supporting paragraph emphasizing:

- Flutter
- Dart
- Clean Architecture
- BLoC/Cubit
- REST APIs
- Firebase
- Android native experience

Add primary CTA:

"View Projects"

Add secondary CTA:

"Contact Me"

Also include social links:

- GitHub
- LinkedIn
- Email

Do not use fake URLs.

Create a centralized configuration/data file so I can easily replace them.

==================================================
6. ABOUT SECTION
==================================================

Create a professional About section.

Present me as:

- Flutter developer
- 4+ years of Flutter experience
- Previous Android native development experience
- Focused on scalable and maintainable applications
- Experienced with production applications
- Interested in architecture, performance, clean code, and developer experience

Do not exaggerate experience or invent companies/projects.

Keep the content easy to replace.

==================================================
7. SKILLS SECTION
==================================================

Group skills instead of displaying one giant list.

Categories:

Mobile Development
- Flutter
- Dart
- Android
- Kotlin

Architecture
- Clean Architecture
- SOLID
- Design Patterns
- BLoC
- Cubit
- Dependency Injection

Backend & APIs
- REST APIs
- Dio
- Retrofit
- Firebase
- Firestore
- Firebase Authentication

Development
- Git
- CI/CD
- Fastlane
- Testing
- Debugging
- Performance Optimization

Navigation
- GoRouter
- Deep Linking

Create attractive visual cards/chips but avoid excessive decoration.

==================================================
8. PROJECTS SECTION
==================================================

This is one of the most important sections.

Create project cards containing:

- Project image/screenshot
- Project name
- Short description
- Technologies
- Key technical challenges
- My contribution
- GitHub link if available
- Store link if available

Each project should be expandable or have a dedicated details view/page.

Project details should communicate engineering decisions rather than simply showing screenshots.

Example:

Healthcare Marketplace

Description:
A healthcare marketplace application for discovering medical services, centers, offers, and booking appointments.

Technical highlights:
- Flutter
- Clean Architecture
- BLoC/Cubit
- REST APIs
- Dio
- Retrofit
- Firebase
- Payment integration
- Localization
- Responsive UI

IMPORTANT:
Do not invent project statistics, users, revenue, companies, or achievements.

Create project data models so projects can easily be added later.

==================================================
9. EXPERIENCE SECTION
==================================================

Create a modern timeline/card-based experience section.

Show:

- Company
- Role
- Period
- Responsibilities
- Technologies
- Important contributions

Use placeholder data where exact information has not been provided.

Clearly mark placeholder content with TODO comments.

Do not fabricate employment information.

==================================================
10. SERVICES SECTION
==================================================

Create a professional services section.

Possible services:

- Flutter Application Development
- Existing App Maintenance
- Flutter Architecture & Refactoring
- API Integration
- Firebase Integration
- UI Implementation
- Performance Optimization
- App Store / Google Play Release Support

Use concise descriptions.

==================================================
11. TECHNICAL APPROACH SECTION
==================================================

Create a section called:

"How I Build"

Show a simple process:

01 — Understand
Understand product requirements and technical constraints.

02 — Design
Define architecture, state management, navigation, and API strategy.

03 — Build
Implement clean, reusable, maintainable Flutter code.

04 — Test
Validate functionality, edge cases, and responsive behavior.

05 — Deliver
Prepare builds, CI/CD, monitoring, and production releases.

Make this visually interesting without excessive animation.

==================================================
12. DESIGN SYSTEM
==================================================

Create a centralized design system.

Define:

- Colors
- Typography
- Spacing
- Border radius
- Shadows
- Button styles
- Card styles
- Section spacing

Use Material 3 ThemeData.

Do not hardcode colors throughout widgets.

Use semantic theme colors.

The design should be:

- Premium
- Minimal
- Modern
- Developer-focused
- Professional
- Clean

Avoid:

- Excessive gradients
- Excessive glassmorphism
- Huge animated backgrounds
- Random floating shapes
- Excessive neon colors
- Generic AI landing-page aesthetics

Use animations only when they improve UX.

==================================================
13. RESPONSIVE DESIGN
==================================================

This is extremely important.

The website must work correctly on:

- Large desktop
- Desktop
- Tablet
- Mobile

Use appropriate Flutter responsive techniques such as:

- LayoutBuilder
- MediaQuery where appropriate
- Flexible
- Expanded
- Wrap
- Slivers where appropriate

Do NOT simply scale the desktop layout down.

Design intentionally for each breakpoint.

Define centralized breakpoints.

Example:

mobile
tablet
desktop
largeDesktop

Ensure:

- Navigation adapts
- Project cards adapt
- Typography adapts
- Images adapt
- Sections adapt
- Buttons adapt
- Spacing adapts

==================================================
14. ANIMATIONS
==================================================

Use subtle professional animations.

Examples:

- Hero entrance animation
- Fade/slide section entrance
- Hover effects on desktop
- Project card interaction
- Smooth navigation
- Button interaction

Do not animate everything.

Animations must not negatively affect performance.

Respect reduced-motion accessibility preferences where practical.

==================================================
15. ACCESSIBILITY
==================================================

Implement accessibility properly.

Include:

- Semantic labels
- Tooltips where appropriate
- Keyboard-friendly interactions
- Sufficient contrast
- Proper text hierarchy
- Accessible navigation
- Meaningful image descriptions

Do not rely solely on color to communicate information.

==================================================
16. PERFORMANCE
==================================================

Optimize Flutter Web performance.

Consider:

- Lazy loading where appropriate
- Optimized images
- Avoid unnecessary rebuilds
- const widgets where appropriate
- Avoid unnecessary animations
- Avoid huge assets
- Avoid unnecessary dependencies

Do not introduce complex optimization prematurely.

==================================================
17. CONTENT ARCHITECTURE
==================================================

Keep portfolio content separate from UI code.

For example:

lib/
└── core/
    └── data/
        └── portfolio_data.dart

or a suitable feature/data structure.

I want to be able to change:

- Name
- Bio
- Skills
- Projects
- Experience
- Social links
- Contact information

without editing many UI files.

==================================================
18. IMAGES / ASSETS
==================================================

Create a clean asset structure:

assets/
├── images/
├── projects/
├── icons/
└── resume/

Do not use copyrighted images without permission.

If project screenshots are unavailable, create clearly marked placeholders and make them easy to replace.

Do not generate fake company logos.

==================================================
19. SEO / WEB
==================================================

Since this is Flutter Web, configure appropriate web metadata where possible.

Include:

- Page title
- Description
- Open Graph metadata where practical
- Favicon
- Proper web manifest configuration if applicable

Use a professional title such as:

"Hussein Mohammed — Senior Flutter Developer"

==================================================
20. CONTACT
==================================================

Create a professional contact section.

Include:

- Email
- LinkedIn
- GitHub

Add a contact CTA.

If implementing a contact form, do not create a fake backend.

Instead either:

- Use mailto
- Clearly isolate backend integration behind an interface
- Or leave a TODO for backend configuration

==================================================
21. DARK / LIGHT MODE
==================================================

Support:

- Dark mode
- Light mode

Provide a clean theme toggle.

Persist the user's preference if practical.

Make sure both themes are professionally designed.

==================================================
22. CODE QUALITY
==================================================

Follow professional Dart/Flutter practices.

Use:

- const constructors
- final where appropriate
- meaningful names
- small reusable widgets
- single responsibility
- composition over inheritance
- null safety
- clean imports
- no dead code
- no unnecessary comments

Avoid giant widget files.

Break complex sections into reusable widgets.

==================================================
23. IMPORTANT DEVELOPMENT PROCESS
==================================================

DO NOT immediately generate the entire application.

Follow this process:

STEP 1:
Inspect the existing project.

STEP 2:
Explain the proposed architecture and folder structure briefly.

STEP 3:
Create the design system/theme.

STEP 4:
Implement the global app shell/navigation.

STEP 5:
Implement the Hero section.

STEP 6:
Implement About and Skills.

STEP 7:
Implement Projects.

STEP 8:
Implement Experience and Services.

STEP 9:
Implement Contact/Footer.

STEP 10:
Implement responsive behavior.

STEP 11:
Implement animations.

STEP 12:
Review the entire application for:
- UI consistency
- responsiveness
- accessibility
- performance
- architecture
- code quality

STEP 13:
Run:

flutter analyze

and fix all relevant issues.

If tests exist, run them.

Also verify the web build.

==================================================
24. IMPORTANT AI BEHAVIOR
==================================================

Do not make assumptions about information that has not been provided.

If information is missing:

- Use TODO placeholders
- Make the content easy to replace
- Do not fabricate facts

Before adding a dependency, consider whether Flutter/Dart can solve the problem without it.

Do not rewrite working code unnecessarily.

Do not upgrade Flutter/Dart unless required.

When making architectural decisions, prefer simplicity.

The final result should look like something a senior Flutter developer intentionally designed and built — not something generated from a generic portfolio template.

==================================================
25. FINAL QUALITY BAR
==================================================

Before considering the project complete, verify:

[ ] Responsive on mobile
[ ] Responsive on tablet
[ ] Responsive on desktop
[ ] Dark mode
[ ] Light mode
[ ] Navigation works
[ ] Smooth scrolling works
[ ] External links work
[ ] Project cards work
[ ] No fake information
[ ] No broken images
[ ] No overflow errors
[ ] No unnecessary dependencies
[ ] flutter analyze passes
[ ] Web build succeeds
[ ] UI has consistent spacing
[ ] Typography is consistent
[ ] Accessibility has been considered
[ ] Performance has been considered
[ ] Code is maintainable

Start by inspecting the current project and then propose the implementation plan before writing the major UI.