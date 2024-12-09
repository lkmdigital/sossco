import 'package:sossco_pay/constantes/constantes.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import '../widgets/root.dart';
import '../widgets/school_choice_widget.dart';


class SchoolChoice extends StatelessWidget {
  const SchoolChoice({super.key});

  @override
  Widget build(BuildContext context) {
    // final size = MediaQuery.of(context).size;
    final double width = MediaQuery.of(context).size.width;
    final double height = MediaQuery.of(context).size.height;

    return Scaffold(

      body: SingleChildScrollView(
        child: Container(
          width: double.infinity,
          // height: height,
          padding: const EdgeInsets.all(12.0),
          decoration: const BoxDecoration(),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.start,
            children: [
              SizedBox(
                height: height * 0.03,
              ),
              const Image(
                image: AssetImage("assets/images/sossco.png"),
                width: 120.0,
                height: 100.0,
              ),
              SizedBox(
                height: height * 0.03,
              ),
              SizedBox(
                width: width * 0.90,
                child: const Text(
                  "Choisissez votre école \npour continuer",
                  textAlign: TextAlign.center,
                  style: TextStyle(
                    fontSize: 20,
                    fontWeight: FontWeight.bold,
                    // color: Theme.of(context).buttonTheme.colorScheme!.onPrimary,
                  ),
                ),
              ),
              SizedBox(
                height: height * 0.03,
              ),
              const Icon(Icons.arrow_downward,
                  color: Couleurs.CouleurPrimaire, size: 35, weight: 80),
              SizedBox(
                height: height * 0.05,
              ),
              SchoolChoiceWidget(
                widthBtn: 0.90,
                heightBtn: 0.10,
                btnColor:
                    Theme.of(context).buttonTheme.colorScheme!.primaryContainer,
                onPressed: () {
                  Get.to(
                    () => const Root(
                      schoolid: "JeanBosco",
                    ),
                  );
                },
                btnTitle: 'ST JEAN BOSCO',
                btnleftIcon: Icons.school_rounded,
                btnRightIcon: Icons.arrow_right,
              ),
              SizedBox(
                height: height * 0.05,
              ),
              SchoolChoiceWidget(
                widthBtn: 0.90,
                heightBtn: 0.10,
                 btnColor: Color(0xFF00A701), // Couleur personnalisée

                onPressed: () {
                  Get.to(
                    () => const Root(
                      schoolid: "JulesVerne",
                    ),
                  );
                },
                btnTitle: 'JULES VERNE',
                btnleftIcon: Icons.school_rounded,
                btnRightIcon: Icons.arrow_right,
              ),
              SizedBox(
                height: height * 0.05,
              ),
             SchoolChoiceWidget(
                widthBtn: 0.90,
                heightBtn: 0.10,
                btnColor: Color(0xFFA800A3), // Couleur personnalisée
                onPressed: () {
                  Get.to(
                    () => const Root(
                      schoolid: "Etienne",
                    ),
                  );
                },
                btnTitle: 'ST ETIENNE KOUM',
                btnleftIcon: Icons.school_rounded,
                btnRightIcon: Icons.arrow_right,
              ),

              SizedBox(
                height: height * 0.05,
              ),
              SchoolChoiceWidget(
                widthBtn: 0.90,
                heightBtn: 0.10,
                 btnColor: Color(0xFF180088), // Couleur personnalisée

                onPressed: () {
                  Get.to(
                    () => const Root(
                      schoolid: "Kato",
                    ),
                  );
                },
                btnTitle: 'ECOLE KATO ANYAMA',
                btnleftIcon: Icons.school_rounded,
                btnRightIcon: Icons.arrow_right,
              ),
            ],
          ),
        ),
      ),
    );
  }
}
