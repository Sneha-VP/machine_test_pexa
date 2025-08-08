import 'package:get/get.dart';
import 'package:http/http.dart' as http;
import 'dart:convert';
import '../model/post_model.dart';

class PostController extends GetxController {
  var isLoading = true.obs;
  var posts = <Post>[].obs;

  @override
  void onInit() {
    super.onInit();
    fetchPosts();
  }

  Future<void> fetchPosts() async {
    print("fetchPosts-----------");
    const String url = 'https://jsonplaceholder.typicode.com/posts';

    try {
      isLoading(true);

      final response = await http.get(
        Uri.parse(url),
        headers: {
          'User-Agent':
          'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 '
              '(KHTML, like Gecko) Chrome/92.0.4515.131 Safari/537.36',
          'Accept': 'application/json',
        },
      );

      print("Status Code: ${response.statusCode}");

      if (response.statusCode == 200) {
        List jsonData = json.decode(response.body);
        var firstTen = jsonData.take(10).map((item) => Post.fromJson(item)).toList();
        posts.assignAll(firstTen);
      } else {
        print("Error Body: ${response.body}");
        Get.snackbar("Error", "Failed to load posts: ${response.statusCode}");
      }
    } catch (e, s) {
      print("Exception: $e");
      print("Stacktrace: $s");
      Get.snackbar("Error", e.toString());
    } finally {
      isLoading(false);
    }
  }
}
