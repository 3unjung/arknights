import 'package:arknights/partials/appbar.dart';
import 'package:arknights/screens/ressource_tier.dart';
import 'package:flutter/material.dart';
import 'package:arknights/ressources_list.dart';

final res = arknights;
const rose = Color(0xffF0F0F0);

class Ressources extends StatelessWidget {
  const Ressources({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return const Scaffold(appBar: TheAppBar(), body: Ressource());
  }
}

class Ressource extends StatefulWidget {
  const Ressource({Key? key}) : super(key: key);

  @override
  State<Ressource> createState() => _RessourceState();
}

class _RessourceState extends State<Ressource> {
  @override
  Widget build(BuildContext context) {
    return ListView.builder(
      itemCount: res.length,
      itemBuilder: (context, index) {
        final item = res[index];
        final tiers = item["tiers"];
        final mainImg = tiers[0]["img"];
        final resName = tiers[0]["name"];
        //return Text('${item["tier1"][0]["name"]}$index');
        return Padding(
          padding: const EdgeInsets.only(top: 50),
          child: Container(
            decoration: BoxDecoration(borderRadius: BorderRadius.circular(80),boxShadow: const [BoxShadow(color: rose)]),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceAround,
              children: [
                 Row(
                    children: [
                      Image.asset(mainImg, width: 70, height: 140,),

                      RessourceTier(tierData: tiers),
                    ],
                    // padding: const EdgeInsets.only(right: 15),
                  ),

                IconButton(onPressed: (){
                  ScaffoldMessenger.of(context).showSnackBar(SnackBar(content: Text("$resName ajouté :p")));},
                  icon: const Icon(Icons.add, size: 35, color: Colors.blue,),),
                IconButton(onPressed: (){},icon: const Icon(Icons.arrow_downward, size: 35, color: Colors.red,),),
              ],
            ),
          ),
        );
      },
    );
  }
}
