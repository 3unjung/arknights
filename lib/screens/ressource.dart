import 'package:arknights/partials/appbar.dart';
import 'package:arknights/screens/ressource_tier.dart';
import 'package:flutter/material.dart';
import 'package:arknights/ressources_list.dart';

final res = arknights;

// new list who will receive news values
final List newArknights = List.from(res);

// hex color
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
        final Map item = res[index];
        final List tiers = item["tiers"];
        final String mainImgPath = tiers[0]["img"];
        final String resName = tiers[0]["name"];
        final int resQty = tiers[0]["qty"];
        //return Text('${item["tier1"][0]["name"]}$index');
        return Padding(
          padding: const EdgeInsets.only(top: 50),
          child: Column(
            children: [
              Text(
                "$resName (x$resQty)",
                style:
                    const TextStyle(fontSize: 20, fontWeight: FontWeight.w900),
              ),
              const SizedBox(
                height: 15,
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceAround,
                children: [
                  Row(
                    children: [
                      Column(
                        children: [
                          Image.asset(
                            mainImgPath,
                            width: 70,
                            height: 140,
                          ),
                          Row(
                            children: [
                              IconButton(
                                onPressed: () {},
                                icon: const Icon(
                                  Icons.add,
                                  size: 35,
                                  color: Colors.blue,
                                ),
                              ),
                              IconButton(
                                onPressed: () {
                                  ScaffoldMessenger.of(context).showSnackBar(
                                      SnackBar(
                                          content:
                                              Text("$resName supprimé :o")));
                                },
                                icon: const Icon(
                                  Icons.arrow_downward,
                                  size: 35,
                                  color: Colors.red,
                                ),
                              ),
                            ],
                          ),
                        ],
                      ),
                      RessourceTier(tierData: tiers),
                    ],
                    // padding: const EdgeInsets.only(right: 15),
                  ),
                ],
              ),
            ],
          ),
        );
      },
    );
  }
}
