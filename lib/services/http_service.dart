import 'package:flutter/foundation.dart';
import 'package:http/http.dart' as http;

/// Service layer for HTTP requests
/// Stateless wrapper around http package for external API calls
class HttpService {
  final http.Client _client;

  HttpService({http.Client? client}) : _client = client ?? http.Client();

  /// Fetch text content from a URL
  /// Returns the response body if successful (status 200-299)
  /// Throws an exception if the request fails
  Future<String> getText(String url) async {
    try {
      final response = await _client.get(Uri.parse(url));
      
      if (response.statusCode >= 200 && response.statusCode < 300) {
        return response.body;
      } else {
        throw Exception('Failed to load text: HTTP ${response.statusCode}');
      }
    } catch (e) {
      debugPrint('HttpService error: $e');
      rethrow;
    }
  }

  /// Check if a URL is valid and accessible
  Future<bool> checkUrl(String url) async {
    try {
      final response = await _client.head(Uri.parse(url));
      return response.statusCode >= 200 && response.statusCode < 300;
    } catch (e) {
      debugPrint('HttpService checkUrl error: $e');
      return false;
    }
  }
}
