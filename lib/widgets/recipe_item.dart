import 'package:codigo5_recipes/models/recipe_model.dart';
import 'package:codigo5_recipes/pages/detail_page.dart';
import 'package:flutter/material.dart';

class RecipeItem extends StatelessWidget {
  RecipeModel data;

  RecipeItem({
    required this.data,
  });

  @override
  Widget build(BuildContext context) {
    return InkWell(
      borderRadius: BorderRadius.circular(16.0),
      onTap: () {
        Navigator.push(
          context,
          MaterialPageRoute(
            builder: (context) => DetailPage(
              model: data,
            ),
          ),
        );
      },
      child: Container(
        margin: const EdgeInsets.symmetric(vertical: 12),
        padding: const EdgeInsets.all(14.0),
        width: double.infinity,
        decoration: BoxDecoration(
          color: Colors.white,
          borderRadius: BorderRadius.circular(16.0),
          boxShadow: [
            BoxShadow(
              color: Colors.black.withOpacity(0.07),
              offset: const Offset(5, 5),
              blurRadius: 10,
            ),
          ],
        ),
        // height: 400,
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            ClipRRect(
              borderRadius: BorderRadius.circular(14.0),
              child: Image.network(
                data.image,
                height: 230.0,
                width: double.infinity,
                fit: BoxFit.cover,
              ),
            ),
            const SizedBox(
              height: 8.0,
            ),
            Text(
              data.title,
              maxLines: 2,
              overflow: TextOverflow.ellipsis,
              style: TextStyle(
                fontSize: 18.0,
                fontWeight: FontWeight.w600,
                color: Color(0xff2f2f2f),
              ),
            ),
            const SizedBox(
              height: 4.0,
            ),
            Text(
              data.description,
              maxLines: 3,
              overflow: TextOverflow.ellipsis,
              style: TextStyle(
                fontSize: 14.0,
                fontWeight: FontWeight.w400,
                color: Color(0xff2f2f2f).withOpacity(0.8),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
