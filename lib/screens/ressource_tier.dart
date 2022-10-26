import 'package:flutter/cupertino.dart';

class RessourceTier extends StatefulWidget {
  final List tierData;

  const RessourceTier({super.key, required this.tierData});

  @override
  State<StatefulWidget> createState() => _RessourceTierState();

}

class _RessourceTierState extends State<RessourceTier> {
  @override
  Widget build(BuildContext context) {
    List<Widget> tierWidgets = [];
    for(Map tierItem in widget.tierData) {
      tierWidgets.add(Image.asset(tierItem["img"],width: 80,height: 35,),);
    }

    return Column(
      children: tierWidgets,
    );
  }

}