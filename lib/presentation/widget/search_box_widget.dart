import 'package:flutter/material.dart';

class SearchBox extends StatelessWidget {
  const SearchBox({
    Key? key,
    this.onChanged,
    this.margin = const EdgeInsets.symmetric(),
    this.padding = const EdgeInsets.symmetric(),
  }) : super(key: key);

  final Function(String text)? onChanged;
  final EdgeInsets margin;
  final EdgeInsets padding;

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: margin,
      padding: padding,
      child: Row(children: [
        const Icon(Icons.search),
        Expanded(
          child: TextField(
            decoration: InputDecoration(
              hintText: 'Search',
            ),
            maxLines: 1,
            onChanged: (text) => onChanged?.call(text),
          ),
        )
      ]),
    );
  }
}
