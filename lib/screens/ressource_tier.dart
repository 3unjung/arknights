import 'package:arknights/screens/ressource.dart';
import 'package:flutter/material.dart';

class RessourceTier extends StatefulWidget {
  final List tierData;

  const RessourceTier({super.key, required this.tierData});

  @override
  State<StatefulWidget> createState() => _RessourceTierState();

}

class _RessourceTierState extends State<RessourceTier> {
  final noLmd = res[0];
  bool isPressed = false;
  @override
  Widget build(BuildContext context) {
    List<Widget> tierWidgets = [];
    final noLmd = widget.tierData;

    if(noLmd.length>1){

      for(Map tierItem in widget.tierData) {
        debugPrint("isPressed $isPressed");
        tierWidgets.add(

          Row(
            children: [
              Image.asset(tierItem["img"],width: 90,height: 45,),
              IconButton(onPressed: (){
                setState(() {
                  isPressed = true;
                  tierItem["qty"] += 1;
                });},

                icon: const Icon(Icons.arrow_upward, size: 35, color: Colors.blue,),
                  ),


              if (isPressed!) Text('${tierItem["qty"]}', style: const TextStyle(fontSize: 20, fontWeight: FontWeight.w900),),

              IconButton(onPressed: () {setState(() {
                tierItem["qty"] -= 1;

              });
              },
                icon: const Icon(
                  Icons.arrow_downward,
                  size: 35,
                  color: Colors.red,
                ),
              ),
            ],
          ),
        );
      }
    }

    return Column(
      children: tierWidgets,

    );
  }

}