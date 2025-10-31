// import 'dart:convert';
// import 'package:flutter_dotenv/flutter_dotenv.dart';
// import 'package:flutter_riverpod/flutter_riverpod.dart';
// import 'package:http/http.dart' as http;
// import 'package:vider_admin/models/jobs_model/jobs_model.dart';

// enum UserFilter { all, provider, client }

// final jobProvider = AsyncNotifierProvider<JobsController, List<JobsModel>>(
//   JobsController.new,
// );

// String jobsURL = dotenv.env['JOBS_URL'] ?? 'https://defaulturl.com/api';

// class JobsController extends AsyncNotifier<List<JobsModel>> {
//   int _page = 1;
//   final int _limit = 20;
//   bool _isLoadingMore = false;
//   bool _hasMore = true;

//   /// All jobs loaded so far
//   List<JobsModel> _allJobs = [];

//   /// Current filter
//   UserFilter _currentFilter = UserFilter.all;
//   UserFilter get currentFilter => _currentFilter;

//   @override
//   Future<List<JobsModel>> build() async {
//     return fetchJobs(reset: true);
//   }

//   Future<List<JobsModel>> fetchJobs({bool reset = false}) async {
//     if (reset) {
//       _page = 1;
//       _hasMore = true;
//       _allJobs = [];
//       state = const AsyncValue.loading();
//     }

//     if (!_hasMore) return _allJobs;

//     try {
//       final response = await http.get(
//         Uri.parse('$jobsURL?page=$_page&limit=$_limit'),
//         headers: {'Content-Type': 'application/json'},
//       );

//       if (response.statusCode == 200) {
//         final Map<String, dynamic> decoded = json.decode(response.body);
//         final List<dynamic> data = decoded['jobs'] ?? decoded;
//         final List<JobsModel> jobs =
//             data.map((e) => JobsModel.fromJson(e)).toList();

//         if (jobs.isEmpty) _hasMore = false;

//         _allJobs.addAll(jobs);
//         _page++;

//         state = AsyncValue.data(filteredJobs);
//         return _allJobs;
//       } else {
//         throw Exception('Failed to fetch jobs');
//       }
//     } catch (error, stackTrace) {
//       state = AsyncValue.error('Failed to load jobs', stackTrace);
//       rethrow;
//     }
//   }

//   /// Load additional jobs when user scrolls
//   Future<void> loadMoreJobs() async {
//     if (_isLoadingMore || !_hasMore) return;
//     _isLoadingMore = true;
//     await fetchJobs(reset: false);
//     _isLoadingMore = false;
//   }

//   /// Refresh jobs (pull to refresh)
//   Future<void> refreshJobs() async {
//     await fetchJobs(reset: true);
//   }

//   /// Set current filter and update UI
//   void setFilter(UserFilter filter) {
//     _currentFilter = filter;
//     state = AsyncValue.data(filteredJobs);
//   }

//   /// Return filtered jobs according to the selected filter
//   List<JobsModel> get filteredJobs {
//     switch (_currentFilter) {
//       case UserFilter.pending:
//         return _allJobs
//             .where((job) => job.status.toLowerCase() == 'pending')
//             .toList();
//       case UserFilter.completed:
//         return _allJobs
//             .where((job) => job.status.toLowerCase() == 'completed')
//             .toList();
//       case UserFilter.all:
//         return _allJobs;
//     }
//   }

//   /// Counts for summary cards
//   int get completedJobs =>
//       _allJobs.where((j) => j.status.toLowerCase() == 'completed').length;
//   int get pendingJobs =>
//       _allJobs.where((j) => j.status.toLowerCase() == 'pending').length;
// }
