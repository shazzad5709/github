import 'dart:async';
import 'package:flutter/material.dart';

abstract class BaseViewModel extends ChangeNotifier {
  bool _isLoading = false;
  bool get isLoading => _isLoading;

  bool _isDisposed = false;
  bool get isDisposed => _isDisposed;

  bool _isInitialized = false;
  bool get isInitialized => _isInitialized;

  FutureOr<void> _initState;
  FutureOr<void> get initState => _initState;

  void setLoading(bool value) {
    _isLoading = value;
    notifyListeners();
  }

  BaseViewModel() {
    _init();
  }

  FutureOr<void> init();

  void _init() async {
    isLoading = true;
    _initState = init();
    await _initState;
    _isInitialized = true;
    isLoading = false;
  }

  void changeStatus() => isLoading = !isLoading;

  void reloadState() {
    if (!isLoading) notifyListeners();
  }

  @override
  void dispose() {
    _isDisposed = true;
    super.dispose();
  }

  set isLoading(bool value) {
    _isLoading = value;
    scheduleMicrotask(() {
      if (!_isDisposed) notifyListeners();
    });
  }
}
