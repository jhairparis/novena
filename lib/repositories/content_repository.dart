import '../services/http_service.dart';

/// Repository layer for content management
/// Acts as Single Source of Truth (SSOT) for textual content
class ContentRepository {
  final HttpService _httpService;

  ContentRepository(this._httpService);

  /// Load textual content from a URL and parse the custom delimiter
  /// Returns a map with 'text' and 'info' keys
  /// Throws an exception if the URL is invalid or content cannot be loaded
  Future<Map<String, String>> loadContent(String url) async {
    if (url.isEmpty) {
      throw ArgumentError('URL cannot be empty');
    }

    final content = await _httpService.getText(url);
    
    // Parse the custom delimiter "_1c_" used by the server
    final splitResponse = content.split("_1c_");
    
    if (splitResponse.length < 2) {
      return {
        'text': content,
        'info': '',
      };
    }

    return {
      'text': splitResponse[0].trim(),
      'info': splitResponse[1].trim(),
    };
  }

  /// Check if content is available at the given URL
  Future<bool> isContentAvailable(String url) async {
    return await _httpService.checkUrl(url);
  }
}
