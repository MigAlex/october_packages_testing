import 'package:flutter/material.dart';
import 'package:october_2020_practise_1/consts/texts.dart';
import 'package:transformer_page_view/transformer_page_view.dart';

import 'custom_widgets.dart';

class HomePageView extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.blueGrey[900],
      appBar: AppBar(elevation: 0, backgroundColor: Colors.transparent),
      body: TransformerPageView(
        scrollDirection: Axis.vertical,
        curve: Curves.easeInBack,
        transformer: MyTransformer(), //transformers[5]
        itemCount: Texts.urlImages.length,
        itemBuilder: (context, index) {
          final urlImage = Texts.urlImages[index];
          final title = Texts.titles[index];
          final subtitle = Texts.subtitles[index];

          return CardWidget(
            urlImage: urlImage,
            title: title,
            subtitle: subtitle,
          );
        },
      ),
    );
  }
}
