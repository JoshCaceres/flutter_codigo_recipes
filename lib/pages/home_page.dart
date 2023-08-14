import 'package:codigo5_recipes/models/recipe_model.dart';
import 'package:codigo5_recipes/widgets/recipe_item.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:google_fonts/google_fonts.dart';

import 'detail_page.dart';

class HomePage extends StatefulWidget {
  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  String title = "";

  TextEditingController titleController = TextEditingController();

  TextEditingController descriptionController = TextEditingController();

  TextEditingController imageController = TextEditingController();

  List<RecipeModel> recipes = [];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.all(14.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              const Text(
                "Mis Recetas",
                style: TextStyle(
                  fontSize: 30.0,
                  fontWeight: FontWeight.w700,
                ),
              ),
              const SizedBox(
                height: 12.0,
              ),
              //Estados TextField: Enabled, Focus, Error, Disable
              TextField(
                controller: titleController,
                decoration: InputDecoration(
                  hintText: "Ingresa un título",
                  filled: true,
                  fillColor: Color(0xffF0F0F0),
                  contentPadding: const EdgeInsets.symmetric(
                    vertical: 12.0,
                    horizontal: 16.0,
                  ),
                  prefixIcon: SvgPicture.asset(
                    "assets/icons/target.svg",
                    fit: BoxFit.scaleDown,
                    colorFilter: const ColorFilter.mode(
                      Color(0xff69686E),
                      BlendMode.srcIn,
                    ),
                  ),
                  enabledBorder: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(50.0),
                    // borderSide: BorderSide(
                    //   color: Colors.black12,
                    //   width: 1.0,
                    // ),
                    borderSide: BorderSide.none,
                  ),
                  focusedBorder: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(50.0),
                    borderSide: BorderSide.none,
                  ),
                ),
              ),
              const SizedBox(
                height: 16.0,
              ),
              TextField(
                controller: descriptionController,
                decoration: InputDecoration(
                  hintText: "Ingresa una descripción",
                  filled: true,
                  fillColor: Color(0xffF0F0F0),
                  contentPadding: const EdgeInsets.symmetric(
                    vertical: 12.0,
                    horizontal: 16.0,
                  ),
                  prefixIcon: SvgPicture.asset(
                    "assets/icons/align-justify.svg",
                    fit: BoxFit.scaleDown,
                    colorFilter: const ColorFilter.mode(
                      Color(0xff69686E),
                      BlendMode.srcIn,
                    ),
                  ),
                  enabledBorder: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(50.0),
                    // borderSide: BorderSide(
                    //   color: Colors.black12,
                    //   width: 1.0,
                    // ),
                    borderSide: BorderSide.none,
                  ),
                  focusedBorder: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(50.0),
                    borderSide: BorderSide.none,
                  ),
                ),
              ),
              const SizedBox(
                height: 16.0,
              ),
              TextField(
                controller: imageController,
                decoration: InputDecoration(
                  hintText: "Ingresa el URL",
                  filled: true,
                  fillColor: Color(0xffF0F0F0),
                  contentPadding: const EdgeInsets.symmetric(
                    vertical: 12.0,
                    horizontal: 16.0,
                  ),
                  prefixIcon: SvgPicture.asset(
                    "assets/icons/image.svg",
                    fit: BoxFit.scaleDown,
                    colorFilter: const ColorFilter.mode(
                      Color(0xff69686E),
                      BlendMode.srcIn,
                    ),
                  ),
                  enabledBorder: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(50.0),
                    // borderSide: BorderSide(
                    //   color: Colors.black12,
                    //   width: 1.0,
                    // ),
                    borderSide: BorderSide.none,
                  ),
                  focusedBorder: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(50.0),
                    borderSide: BorderSide.none,
                  ),
                ),
              ),
              const SizedBox(
                height: 16.0,
              ),
              SizedBox(
                width: double.infinity,
                height: 48.0,
                child: ElevatedButton(
                  onPressed: () {
                    // Map<String, dynamic> recipe = {
                    //   "title": titleController.text,
                    //   "description": descriptionController.text,
                    //   "image": imageController.text,
                    // };

                    RecipeModel model = RecipeModel(
                      title: titleController.text,
                      description: descriptionController.text,
                      image: imageController.text,
                    );

                    recipes.add(model);

                    setState(() {});
                    titleController.clear(); // Para limpiar los controladores
                    descriptionController.clear();
                    imageController.clear();
                  },
                  style: ElevatedButton.styleFrom(
                    backgroundColor: Color(0xffC0E863),
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(30.0),
                    ),
                  ),
                  child: const Text(
                    "Agregar",
                    style: TextStyle(
                      fontSize: 16.0,
                      fontWeight: FontWeight.bold,
                      color: Color(0xff2F2F2F),
                    ),
                  ),
                ),
              ),

              const SizedBox(
                height: 16.0,
              ),

              const Text(
                "Listado general",
                style: TextStyle(
                  fontSize: 16.0,
                  color: Color(0xff2F2F2F),
                  fontWeight: FontWeight.w600,
                ),
              ),

              //Elementos - Recetas registradas

              // ...recipes //spread
              //     .map(
              //       (RecipeModel e) => RecipeItem(
              //         data: e,
              //       ),
              //     )
              //     .toList(),
              const SizedBox(
                height: 12.0,
              ),

              Expanded(
                child: ListView.builder(
                  itemCount: recipes.length,
                  itemBuilder: (BuildContext context, int index) {
                    return RecipeItem(data: recipes[index]);
                  },
                ),
              )
            ],
          ),
        ),
      ),
    );
  }
}
