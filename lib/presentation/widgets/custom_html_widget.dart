import 'package:flutter/material.dart';
import 'package:flutter_html/flutter_html.dart';

class CustomHtmlWidget extends StatelessWidget {
  final String data;
  const CustomHtmlWidget({super.key, required this.data});

  @override
  Widget build(BuildContext context) {
    return Html(
      data: data,
      style: <String, Style>{
        'body': Style(
          padding: HtmlPaddings.symmetric(horizontal: 16),
        ),
        'h1': Style(
          fontSize: FontSize(18),
          fontWeight: FontWeight.bold,
        ),
        'h2': Style(
          fontSize: FontSize(18),
          fontWeight: FontWeight.bold,
        ),
        'h3': Style(
          fontSize: FontSize(16),
          fontWeight: FontWeight.bold,
        ),
        'p': Style(
            fontSize: FontSize(14),
            lineHeight: LineHeight.number(1.42857),
            textAlign: TextAlign.justify,
            padding: HtmlPaddings.zero,
            margin: Margins.zero,
          ),
        '.content': Style(
          width: Width.auto(),
        ),
        'img': Style(
          width: Width(MediaQuery.of(context).size.width),
          border: Border.all(
            width: 1.0,
          ),
        ),
      },
    );
  }
}
