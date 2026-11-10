import 'package:flutter/material.dart';

import '../models/portfolio_models.dart';

class BrandIcon extends StatelessWidget {
  const BrandIcon({
    super.key,
    required this.icon,
    this.size = 20,
  });

  final SocialIcon icon;
  final double size;

  @override
  Widget build(BuildContext context) {
    final color = IconTheme.of(context).color ?? const Color(0xFFF2F0EA);
    if (icon == SocialIcon.email) {
      return Icon(Icons.mail_outline, size: size, color: color);
    }

    final path = icon == SocialIcon.github ? _githubPath : _linkedinPath;
    return SizedBox(
      width: size,
      height: size,
      child: CustomPaint(
        painter: _BrandPainter(path: path, color: color),
      ),
    );
  }
}

class _BrandPainter extends CustomPainter {
  const _BrandPainter({required this.path, required this.color});

  final Path path;
  final Color color;

  @override
  void paint(Canvas canvas, Size size) {
    canvas.save();
    canvas.scale(size.width / 24, size.height / 24);
    canvas.drawPath(path, Paint()..color = color);
    canvas.restore();
  }

  @override
  bool shouldRepaint(_BrandPainter oldDelegate) => oldDelegate.color != color;
}

final Path _githubPath = _svgPath(_github);
final Path _linkedinPath = _svgPath(_linkedin);

const _github = '''
M12 .297c-6.63 0-12 5.373-12 12 0 5.303 3.438 9.8 8.205 11.385.6.113.82-.258.82-.577
0-.285-.01-1.04-.015-2.04-3.338.724-4.042-1.61-4.042-1.61C4.422 18.07 3.633 17.7
3.633 17.7c-1.087-.744.084-.729.084-.729 1.205.084 1.838 1.236 1.838 1.236 1.07 1.835
2.809 1.305 3.495.998.108-.776.417-1.305.76-1.605-2.665-.3-5.466-1.332-5.466-5.93
0-1.31.465-2.38 1.235-3.22-.135-.303-.54-1.523.105-3.176 0 0 1.005-.322 3.3 1.23.96-.267
1.98-.399 3-.405 1.02.006 2.04.138 3 .405 2.28-1.552 3.285-1.23 3.285-1.23.645 1.653.24
2.873.12 3.176.765.84 1.23 1.91 1.23 3.22 0 4.61-2.805 5.625-5.475 5.92.42.36.81 1.096.81
2.22 0 1.606-.015 2.896-.015 3.286 0 .315.21.69.825.57C20.565 22.092 24 17.592 24
12.297c0-6.627-5.373-12-12-12
''';

const _linkedin = '''
M20.447 20.452h-3.554v-5.569c0-1.328-.027-3.037-1.852-3.037-1.853 0-2.136 1.445-2.136
2.939v5.667H9.351V9h3.414v1.561h.046c.477-.9 1.637-1.85 3.37-1.85 3.601 0 4.267 2.37
4.267 5.455v6.286zM5.337 7.433c-1.144 0-2.063-.926-2.063-2.065 0-1.138.92-2.063
2.063-2.063 1.14 0 2.064.925 2.064 2.063 0 1.139-.925 2.065-2.064 2.065zm1.782
13.019H3.555V9h3.564v11.452zM22.225 0H1.771C.792 0 0 .774 0 1.729v20.542C0 23.227.792
24 1.771 24h20.451C23.2 24 24 23.227 24 22.271V1.729C24 .774 23.2 0 22.222 0h.003z
''';

Path _svgPath(String source) {
  final path = Path();
  final tokens = RegExp(
    r'([MmLlHhVvCcZz])|(-?\d*\.?\d+(?:[eE][-+]?\d+)?)',
  ).allMatches(source).map((match) => match.group(0)!).toList();

  var index = 0;
  String? command;
  var x = 0.0;
  var y = 0.0;
  var startX = 0.0;
  var startY = 0.0;

  double read() => double.parse(tokens[index++]);

  while (index < tokens.length) {
    final token = tokens[index];
    if (token.length == 1 && RegExp(r'[A-Za-z]').hasMatch(token)) {
      command = token;
      index++;
      if (command == 'Z' || command == 'z') {
        path.close();
        x = startX;
        y = startY;
        command = null;
      }
      continue;
    }

    switch (command) {
      case 'M':
        x = read();
        y = read();
        path.moveTo(x, y);
        startX = x;
        startY = y;
        command = 'L';
      case 'm':
        x += read();
        y += read();
        path.moveTo(x, y);
        startX = x;
        startY = y;
        command = 'l';
      case 'L':
        x = read();
        y = read();
        path.lineTo(x, y);
      case 'l':
        x += read();
        y += read();
        path.lineTo(x, y);
      case 'H':
        x = read();
        path.lineTo(x, y);
      case 'h':
        x += read();
        path.lineTo(x, y);
      case 'V':
        y = read();
        path.lineTo(x, y);
      case 'v':
        y += read();
        path.lineTo(x, y);
      case 'C':
        final x1 = read();
        final y1 = read();
        final x2 = read();
        final y2 = read();
        final endX = read();
        final endY = read();
        path.cubicTo(x1, y1, x2, y2, endX, endY);
        x = endX;
        y = endY;
      case 'c':
        final x1 = x + read();
        final y1 = y + read();
        final x2 = x + read();
        final y2 = y + read();
        final endX = x + read();
        final endY = y + read();
        path.cubicTo(x1, y1, x2, y2, endX, endY);
        x = endX;
        y = endY;
      default:
        index++;
    }
  }

  return path;
}
