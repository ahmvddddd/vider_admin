import 'dart:convert';
import 'package:flutter_dotenv/flutter_dotenv.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:http/http.dart' as http;

import '../../models/users_model/users_model.dart';

enum UserFilter { all, provider, client }

final userProvider = AsyncNotifierProvider<UsersController, List<UsersModel>>(
  UsersController.new,
);

String usersURL = dotenv.env['USERS_URL'] ?? 'https://defaulturl.com/api';

class UsersController extends AsyncNotifier<List<UsersModel>> {
  int _page = 1;
  final int _limit = 20;
  bool _isLoadingMore = false;
  bool _hasMore = true;

  /// All jobs loaded so far
  List<UsersModel> _allUsers = [];

  /// Current filter
  UserFilter _currentFilter = UserFilter.all;
  UserFilter get currentFilter => _currentFilter;

  @override
  Future<List<UsersModel>> build() async {
    return fetchUsers(reset: true);
  }

  Future<List<UsersModel>> fetchUsers({bool reset = false}) async {
    if (reset) {
      _page = 1;
      _hasMore = true;
      _allUsers = [];
      state = const AsyncValue.loading();
    }

    if (!_hasMore) return _allUsers;

    try {
      final response = await http.get(
        Uri.parse('$usersURL?page=$_page&limit=$_limit'),
        headers: {'Content-Type': 'application/json'},
      );

      if (response.statusCode == 200) {
        final Map<String, dynamic> decoded = json.decode(response.body);
        final List<dynamic> data = decoded['jobs'] ?? decoded;
        final List<UsersModel> users =
            data.map((e) => UsersModel.fromJson(e)).toList();

        if (users.isEmpty) _hasMore = false;

        _allUsers.addAll(users);
        _page++;

        state = AsyncValue.data(filteredUsers);
        return _allUsers;
      } else {
        throw Exception('Failed to fetch jobs');
      }
    } catch (error, stackTrace) {
      state = AsyncValue.error('Failed to load jobs', stackTrace);
      rethrow;
    }
  }

  /// Load additional jobs when user scrolls
  Future<void> loadMoreJobs() async {
    if (_isLoadingMore || !_hasMore) return;
    _isLoadingMore = true;
    await fetchUsers(reset: false);
    _isLoadingMore = false;
  }

  /// Refresh jobs (pull to refresh)
  Future<void> refreshJobs() async {
    await fetchUsers(reset: true);
  }

  /// Set current filter and update UI
  void setFilter(UserFilter filter) {
    _currentFilter = filter;
    state = AsyncValue.data(filteredUsers);
  }

  /// Return filtered jobs according to the selected filter
  List<UsersModel> get filteredUsers {
    switch (_currentFilter) {
      case UserFilter.provider:
        return _allUsers
            .where((job) => job.userType.toLowerCase() == 'provider')
            .toList();
      case UserFilter.client:
        return _allUsers
            .where((job) => job.userType.toLowerCase() == 'client')
            .toList();
      case UserFilter.all:
        return _allUsers;
    }
  }

  /// Counts for summary cards
  int get completedJobs =>
      _allUsers.where((j) => j.userType.toLowerCase() == 'client').length;
  int get pendingJobs =>
      _allUsers.where((j) => j.userType.toLowerCase() == 'provider').length;
}
