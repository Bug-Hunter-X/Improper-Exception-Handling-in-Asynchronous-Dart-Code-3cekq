```dart
Future<void> fetchData() async {
  try {
    final response = await http.get(Uri.parse('https://api.example.com/data'));
    if (response.statusCode == 200) {
      final data = jsonDecode(response.body) as Map<String, dynamic>; // Type safety
      // Process the data, handle potential null values
      print(data['key']); //Example - Add null checks as appropriate

    } else {
      throw Exception('Failed to load data: ${response.statusCode} - ${response.reasonPhrase}');
    }
  } on FormatException catch (e) {
    print('JSON format error: $e');
    //Handle JSON parsing issues
  } on SocketException catch (e) {
    print('Network error: $e');
    //Handle network issues
  } catch (e) {
    print('An unexpected error occurred: $e');
     // Consider logging more details for debugging
  }
}
```