import 'package:http/http.dart' as http;

class SearchElement {
  searchFoodByName(name) {
    var url = Uri.parse(
      'https://api.calorieninjas.com/v1/nutrition?query=$name',
    );
    return http.get(
      url,
      headers: {'X-Api-Key': 'Your API Key'},
    );
  }
}
