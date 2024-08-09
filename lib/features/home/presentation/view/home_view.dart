// import 'package:flutter/material.dart';
// import 'package:flutter_riverpod/flutter_riverpod.dart';
// import 'package:kaamkuro/app/constants/api_endpoint.dart';
// import 'package:kaamkuro/features/job/presentation/viewmodel/job_viewmodel.dart';
 
// class HomeView extends ConsumerStatefulWidget {
//   const HomeView({super.key});
 
//   @override
//   ConsumerState<ConsumerStatefulWidget> createState() => _HomeViewState();
// }
 
// class _HomeViewState extends ConsumerState<HomeView> {
//   final ScrollController _scrollController = ScrollController();
 
//   @override
//   void dispose() {
//     _scrollController.dispose();
//     super.dispose();
//   }
 
//   @override
//   Widget build(BuildContext context) {
//     final state = ref.watch(jobViewModelProvider);
//     print(state.lstJobs);
//     return NotificationListener(
//       onNotification: (notification) {
//         if (notification is ScrollEndNotification) {
//           // Scroll garda feri last ma ho ki haina bhanera check garne ani data call garne
//           if (_scrollController.position.extentAfter == 0) {
//             // Data fetch gara api bata
//             ref.read(jobViewModelProvider.notifier).getAllJobs();
//           }
//         }
//         return true;
//       },
//       child: RefreshIndicator(
//         // Yo chai pull to refresh ko lagi ho
//         color: Colors.green,
//         backgroundColor: Colors.amberAccent,
//         onRefresh: () async {
//           ref.read(jobViewModelProvider.notifier).resetState();
//         },
//         child: Column(
//           children: [
//             Expanded(
//               child: ListView.separated(
//                 separatorBuilder: (context, index) => const Divider(),
//                 controller: _scrollController,
//                 itemCount: state.lstJobs.length,
//                 physics: const AlwaysScrollableScrollPhysics(),
//                 itemBuilder: (context, index) {
//                   final job = state.lstJobs[index];
//                   return ListTile(
//                     leading:
//                         Image.network(ApiEndpoints.jobImageUrl + job.imageUrl!),
//                     title: Text(job.name!),
//                     // subtitle: Text(job.email),
//                   );
//                 },
//               ),
//             ),
//             // Data load huda feri progress bar dekhaune natra banda garne
//             if (state.isLoading)
//               const CircularProgressIndicator(color: Colors.red),
 
//             const SizedBox(height: 10),
//           ],
//         ),
//       ),
//     );
//   }
// }

import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:kaamkuro/app/constants/api_endpoint.dart';
import 'package:kaamkuro/features/job/presentation/viewmodel/job_viewmodel.dart';
 
class HomeView extends ConsumerStatefulWidget {
  const HomeView({super.key});
 
  @override
  ConsumerState<ConsumerStatefulWidget> createState() => _HomeViewState();
}
 
class _HomeViewState extends ConsumerState<HomeView> {
  final ScrollController _scrollController = ScrollController();
 
  @override
  void dispose() {
    _scrollController.dispose();
    super.dispose();
  }
 
  @override
  Widget build(BuildContext context) {
    final state = ref.watch(jobViewModelProvider);
    print(state.lstJobs);
    return NotificationListener(
      onNotification: (notification) {
        if (notification is ScrollEndNotification) {
          if (_scrollController.position.extentAfter == 0) {
            ref.read(jobViewModelProvider.notifier).getAllJobs();
          }
        }
        return true;
      },
      child: RefreshIndicator(
        color: Colors.green,
        backgroundColor: Colors.amberAccent,
        onRefresh: () async {
          ref.read(jobViewModelProvider.notifier).resetState();
        },
        child: Column(
          children: [
            Expanded(
              child: ListView.separated(
                separatorBuilder: (context, index) => const Divider(),
                controller: _scrollController,
                itemCount: state.lstJobs.length,
                physics: const AlwaysScrollableScrollPhysics(),
                itemBuilder: (context, index) {
                  final job = state.lstJobs[index];
                  return ListTile(
                    leading: job.imageUrl != null && job.imageUrl!.isNotEmpty
                        ? Container(
                            width: 50,
                            height: 50,
                            decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(8),
                            ),
                            child: ClipRRect(
                              borderRadius: BorderRadius.circular(8),
                              child: Image.network(
                                ApiEndpoints.jobImageUrl + job.imageUrl!,
                                fit: BoxFit.cover,
                                errorBuilder: (context, error, stackTrace) {
                                  return const Icon(Icons.person);
                                },
                                loadingBuilder:
                                    (context, child, loadingProgress) {
                                  if (loadingProgress == null) {
                                    return child;
                                  }
                                  return const Center(
                                    child: CircularProgressIndicator(),
                                  );
                                },
                              ),
                            ),
                          )
                        : const Icon(Icons.person),
                    title: Text(job.name!),
                  );
                },
              ),
            ),
            if (state.isLoading)
              const CircularProgressIndicator(color: Colors.red),
            const SizedBox(height: 10),
          ],
        ),
      ),
    );
  }
}