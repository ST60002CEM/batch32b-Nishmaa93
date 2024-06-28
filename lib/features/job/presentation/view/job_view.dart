// import 'package:flutter/material.dart';
// import 'package:flutter_riverpod/flutter_riverpod.dart';
// import 'package:kaamkuro/features/job/domain/entity/job_entity.dart';
// import 'package:kaamkuro/features/job/presentation/viewmodel/job_viewmodel.dart';


// class JobView extends ConsumerStatefulWidget {
//   const JobView({super.key});

//   @override
//   ConsumerState<JobView> createState() => _AddJobViewState();
// }

// class _AddJobViewState extends ConsumerState<JobView> {
//   final gap = const SizedBox(height: 8);
//   final jobController = TextEditingController();
//   @override
//   Widget build(BuildContext context) {
//     var jobState = ref.watch(jobViewmodelProvider);
//     return SafeArea(
//       child: Scaffold(
//         body: Padding(
//           padding: const EdgeInsets.all(8.0),
//           child: Column(
//             children: [
//               gap,
//               const Align(
//                 alignment: Alignment.center,
//                 child: Text(
//                   'Add Job',
//                   style: TextStyle(
//                     fontSize: 18,
//                     fontWeight: FontWeight.bold,
//                   ),
//                 ),
//               ),
//               gap,
//               TextFormField(
//                 controller: jobController,
//                 decoration: const InputDecoration(
//                   border: OutlineInputBorder(),
//                   hintText: 'Job Name',
//                 ),
//                 validator: (value) {
//                   if (value!.isEmpty) {
//                     return 'Please enter job';
//                   }
//                   return null;
//                 },
//               ),
//               gap,
//               SizedBox(
//                 width: double.infinity,
//                 child: ElevatedButton(
//                   onPressed: () {
//                     JobEntity jobEnity =
//                         JobEntity(jobName: jobController.text);
//                     // Pass the data to ViewModel
//                     ref
//                         .read(jobViewmodelProvider.notifier)
//                         .addJob(jobEnity);
//                   },
//                   child: const Text('Add Job'),
//                 ),
//               ),
//               const SizedBox(height: 10),
//               const Align(
//                 alignment: Alignment.center,
//                 child: Text(
//                   'List of Jobes',
//                   style: TextStyle(
//                     fontSize: 18,
//                     fontWeight: FontWeight.bold,
//                   ),
//                 ),
//               ),

//               // Display List of batches
//               if (jobState.isLoading) ...{
//                 const Center(child: CircularProgressIndicator()),
//               } else if (jobState.error != null) ...{
//                 Text(jobState.error.toString()),
//               } else if (jobState.lstJobes.isEmpty) ...{
//                 const Center(child: Text('No Jobes')),
//               } else ...{
//                 Expanded(
//                   child: ListView.builder(
//                     itemCount: jobState.lstJobes.length,
//                     itemBuilder: (context, index) {
//                       var job = jobState.lstJobes[index];
//                       return ListTile(
//                         title: Text(job.jobName),
//                         subtitle: Text(job.jobId ?? ''),
//                         trailing: IconButton(
//                           icon: const Icon(Icons.delete),
//                           onPressed: () {
//                             // Delete the batch
//                           },
//                         ),
//                       );
//                     },
//                   ),
//                 ),
//               }
//             ],
//           ),
//         ),
//       ),
//     );
//   }
// }