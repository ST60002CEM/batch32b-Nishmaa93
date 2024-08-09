import 'package:kaamkuro/features/job/domain/entity/job_entity.dart';

class JobTestData {
  JobTestData._();

  static List<JobEntity> getJobTestData() {
    List<JobEntity> lstJobs = [
      const JobEntity(
          id: "668cc58dcb6bbfd08a688ba9",
          name: "cleaning",
          category: "low",
          description: 'anything',
          imageUrl: 'https://abc.com?lpai="ax"'),
      const JobEntity(
          id: "668cc58dcb6bbfd08a688ba9",
          name: "cleaning",
          category: "low",
          description: 'anything',
          imageUrl: 'https://abc.com?lpai="ax"'),
      const JobEntity(
          id: "668cc58dcb6bbfd08a688ba9",
          name: "cleaning",
          category: "low",
          description: 'anything',
          imageUrl: 'https://abc.com?lpai="ax"'),
      const JobEntity(
          id: "668cc58dcb6bbfd08a688ba9",
          name: "cleaning",
          category: "low",
          description: 'anything',
          imageUrl: 'https://abc.com?lpai="ax"'),
      const JobEntity(
          id: "668cc58dcb6bbfd08a688ba9",
          name: "cleaning",
          category: "low",
          description: 'anything',
          imageUrl: 'https://abc.com?lpai="ax"'),
    ];

    return lstJobs;
  }
}

// final String? name;
//   final String? price;
//   final String? category;
//   final String? description;
//   final String? imageUrl;