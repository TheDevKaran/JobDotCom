import 'package:flutter/foundation.dart';
import 'package:jobdotcom/models/response/jobs/jobs_response.dart';

import '../services/helpers/jobs_helper.dart';


class JobsNotifier extends ChangeNotifier {
  late Future<List<JobsResponse>> jobList;
  late Future<JobsResponse> recent;
  getJobs(String id){
    jobList=JobsHelper.getJobs();
  }

  getRecent(){
    recent=JobsHelper.getRecent();
  }

}
