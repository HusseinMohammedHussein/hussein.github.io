import 'package:url_launcher/url_launcher.dart';

Future<void> launchLink(String url) async {
  final uri = Uri.parse(url);
  await launchUrl(uri, mode: LaunchMode.externalApplication);
}

String mailtoUrl(String email) => 'mailto:$email';
