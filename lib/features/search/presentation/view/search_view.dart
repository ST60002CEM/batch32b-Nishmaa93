import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:kaamkuro/app/constants/api_endpoint.dart';
import 'package:kaamkuro/features/job/presentation/view/single_job_view.dart';
import 'package:kaamkuro/features/job/presentation/viewmodel/job_viewmodel.dart';

class SearchView extends ConsumerStatefulWidget {
  const SearchView({super.key});

  @override
  ConsumerState<ConsumerStatefulWidget> createState() => _SearchViewState();
}

class _SearchViewState extends ConsumerState<SearchView> {
  final ScrollController _scrollController = ScrollController();

  @override
  void dispose() {
    _scrollController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final state = ref.watch(jobViewModelProvider);

    return Scaffold(
      appBar: AppBar(
        title: const Text(
          'Search',
          style: TextStyle(
              color: Colors.black, fontWeight: FontWeight.bold, fontSize: 24),
        ),
        backgroundColor: const Color(0xFFF3F2F2),
        automaticallyImplyLeading: true,
      ),
      body: NotificationListener<ScrollNotification>(
        onNotification: (notification) {
          if (notification is ScrollEndNotification &&
              _scrollController.position.extentAfter == 0) {
            ref.read(jobViewModelProvider.notifier).getAllJobs();
          }
          return true;
        },
        child: RefreshIndicator(
          color: Colors.brown,
          backgroundColor: Colors.white,
          onRefresh: () async {
            ref.read(jobViewModelProvider.notifier).resetState();
          },
          child: state.lstJobs.isEmpty
              ? const Center(
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Icon(Icons.folder_open, size: 100, color: Colors.grey),
                      SizedBox(height: 20),
                      Text(
                        'No jobs available',
                        style: TextStyle(fontSize: 18, color: Colors.grey),
                      ),
                      SizedBox(height: 10),
                      Text(
                        'Try refreshing or come back later.',
                        style: TextStyle(fontSize: 16, color: Colors.grey),
                      ),
                    ],
                  ),
                )
              : ListView.builder(
                  controller: _scrollController,
                  itemCount:
                      state.lstJobs.length + 1, // +1 for the loading indicator
                  itemBuilder: (context, index) {
                    if (index == state.lstJobs.length) {
                      // Display a loading indicator at the end of the list
                      return state.isLoading
                          ? const Center(
                              child: Padding(
                              padding: const EdgeInsets.all(16.0),
                              child: CircularProgressIndicator(
                                strokeWidth: 2.5,
                              ),
                            ))
                          : const SizedBox
                              .shrink(); // Empty space if no more data to load
                    }

                    final job = state.lstJobs[index];
                    return Card(
                      margin: const EdgeInsets.symmetric(
                          vertical: 8, horizontal: 16),
                      elevation: 4,
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(12),
                      ),
                      child: ListTile(
                        contentPadding: const EdgeInsets.all(16),
                        leading: job.imageUrl != null &&
                                job.imageUrl!.isNotEmpty
                            ? Container(
                                width: 70,
                                height: 70,
                                decoration: BoxDecoration(
                                  borderRadius: BorderRadius.circular(12),
                                  border: Border.all(
                                      color: Colors.grey.withOpacity(0.2)),
                                ),
                                child: ClipRRect(
                                  borderRadius: BorderRadius.circular(12),
                                  child: Image.network(
                                    ApiEndpoints.jobImageUrl + job.imageUrl!,
                                    fit: BoxFit.cover,
                                    errorBuilder: (context, error, stackTrace) {
                                      return Image.asset(
                                        'assets/images/kaam.jpeg', // Replace with your asset image path
                                        height: 200,
                                        width: double.infinity,
                                        fit: BoxFit.cover,
                                      );
                                    },
                                    loadingBuilder:
                                        (context, child, loadingProgress) {
                                      if (loadingProgress == null) {
                                        return child;
                                      }
                                      return const Center(
                                          child: CircularProgressIndicator(
                                        strokeWidth: 2.5,
                                      ));
                                    },
                                  ),
                                ),
                              )
                            : const Icon(Icons.person,
                                size: 40, color: Colors.grey),
                        title: Text(job.name!,
                            style:
                                const TextStyle(fontWeight: FontWeight.bold)),
                        subtitle: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text("Location: ${job.category ?? 'Unknown'}"),
                            Text("Posted on: ${job.name ?? 'Unknown'}"),
                          ],
                        ),
                        isThreeLine: true,
                        trailing: const Icon(Icons.arrow_forward_ios,
                            color: Colors.brown),
                        onTap: () {
                          Navigator.push(
                            context,
                            MaterialPageRoute(
                              builder: (context) => JobDetailView(job: job),
                            ),
                          );
                        },
                      ),
                    );
                  },
                ),
        ),
      ),
    );
  }
}
