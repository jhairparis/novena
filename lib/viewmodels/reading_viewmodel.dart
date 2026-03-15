import 'package:flutter/foundation.dart';
import '../repositories/content_repository.dart';

/// ViewModel for reading pages (prayers and days)
/// Manages UI state and business logic for content display
/// Extends ChangeNotifier to notify listeners of state changes
class ReadingViewModel extends ChangeNotifier {
  final ContentRepository _repository;

  // State fields
  bool _isLoading = false;
  String? _errorMessage;
  Map<String, String>? _content;

  // Getters for state
  bool get isLoading => _isLoading;
  String? get errorMessage => _errorMessage;
  String? get text => _content?['text'];
  String? get info => _content?['info'];
  bool get hasContent => _content != null;

  ReadingViewModel({required ContentRepository repository})
      : _repository = repository;

  /// Load content from given URL
  /// Updates state: sets isLoading to true, then loads content,
  /// then sets isLoading to false and notifies listeners
  Future<void> loadContent(String url) async {
    _isLoading = true;
    _errorMessage = null;
    _content = null;
    notifyListeners();

    try {
      _content = await _repository.loadContent(url);
      debugPrint('Content loaded successfully: ${text?.length} chars');
    } on ArgumentError catch (e) {
      _errorMessage = 'Invalid URL: ${e.message}';
      debugPrint('ReadingViewModel error: $e');
    } catch (e) {
      _errorMessage = 'Error loading content. Please check your connection.';
      debugPrint('ReadingViewModel error: $e');
    } finally {
      _isLoading = false;
      notifyListeners();
    }
  }

  /// Retry loading current content
  /// Useful for retry button implementation
  Future<void> retry() async {
    if (_content == null && _errorMessage != null) {
      return;
    }
    _errorMessage = null;
    notifyListeners();
  }

  /// Clear all state
  /// Useful when navigating away from reading page
  void clear() {
    _content = null;
    _errorMessage = null;
    _isLoading = false;
    notifyListeners();
  }
}
