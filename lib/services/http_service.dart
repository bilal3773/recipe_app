import 'dart:convert';
import 'package:http/http.dart' as http;
import 'package:recipe_app/secret.dart';
import 'package:recipe_app/models/recipe_model/recipe_model.dart';

class HttpService {
  // List<Hits> hits = [];

  // Future<void> getReceipe() async {
  //   String url =
  //       "https://api.edamam.com/search?q=banana&app_id=$appId&app_key=$applicationKey";
  //   var response = await http.get(url);

  //   var jsonData = jsonDecode(response.body);
  //   jsonData["hits"].forEach((element) {
  //     // ignore: unused_local_variable
  //     Hits hits = Hits(
  //       recipeModel: element['recipe'],
  //     );
  //     // hits.recipeModel = add(Hits.fromMap(hits.recipeModel));
  //   });
  // }
  // recipies = new List();
 List<RecipeModel> recipies = [];
Future<List<RecipeModel>> getReceipe(String query) async {
                                String url =
                                    "https://api.edamam.com/search?q=$query&app_id=$appId&app_key=$applicationKey";
                                var response = await http.get(url);
                                print(" $response this is response");
                                Map<String, dynamic> jsonData =
                                    jsonDecode(response.body);
                                print("this is json Data $jsonData");
                                   return (jsonData["hits"] as List).map((json) => RecipeModel.fromMap(json['recipe'])).toList();
    // }
    //  else {
    //   throw Exception("Failed to load All Categories");
    // }
                                // jsonData["hits"].forEach((element) {
                                //   print(element.toString());
                                //   RecipeModel recipeModel = new RecipeModel();
                                //   recipeModel =
                                //       RecipeModel.fromMap(element['recipe']);
                                //   recipies.add(recipeModel);
                                //   print(recipeModel.url);
                                // });
                                //    return recipies;
}
}
