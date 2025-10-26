import 'dart:convert';

import 'package:flutter_dotenv/flutter_dotenv.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:http/http.dart' as http;
import 'package:vider_admin/models/jobs_model/jobs_model.dart';

final jobProvider = AsyncNotifierProvider<JobsController, List<JobsModel>>(
  JobsController.new,
);

String jobsURL = dotenv.env['JOBS_URL'] ?? 'https://defaulturl.com/api';


class JobsController extends AsyncNotifier<List<JobsModel>> {
  @override
  Future<List<JobsModel>> build() async {
    return await fetchJobs();
  }

  Future<List<JobsModel>> fetchJobs() async {
    state = const AsyncValue.loading();

    try {
      final response = await http.get(
        Uri.parse(jobsURL),
        headers: {'Content-Type': 'application/json'},
      );

      if (response.statusCode == 200) {
        final List<dynamic> data = json.decode(response.body);
        final List<JobsModel> jobs = data
            .map((e) => JobsModel.fromJson(e))
            .toList();
        state = AsyncValue.data(jobs);
        return jobs;
      } else {
        throw Exception('Failed to fetch jobs');
      }
    } catch (error, stackTrace) {
      state = AsyncValue.error('Failed to load jobs', stackTrace);
      throw Exception('Failed to load jobs');
    }
  }
}
