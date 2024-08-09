import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:kaamkuro/app/constants/api_endpoint.dart';
import 'package:kaamkuro/core/common/my_snackbar.dart';
import 'package:kaamkuro/features/job/domain/entity/job_entity.dart';

class JobDetailView extends ConsumerStatefulWidget {
  final JobEntity job;

  const JobDetailView({super.key, required this.job});

  @override
  ConsumerState<ConsumerStatefulWidget> createState() => _JobDetailViewState();
}

class _JobDetailViewState extends ConsumerState<JobDetailView> {
  @override
  Widget build(BuildContext context) {
    final job = widget.job;

    return Scaffold(
      appBar: AppBar(
        title: const Text(
          'Job Details',
          style: TextStyle(
              color: Colors.black, fontWeight: FontWeight.bold, fontSize: 24),
        ),
        backgroundColor: const Color(0xFFF3F2F2),
        automaticallyImplyLeading: true,
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: SingleChildScrollView(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              // Job Image
              job.imageUrl != null
                  ? Image.network(
                      ApiEndpoints.jobImageUrl + job.imageUrl!,
                      height: 200,
                      width: double.infinity,
                      fit: BoxFit.cover,
                      errorBuilder: (context, error, stackTrace) {
                        return Image.asset(
                          'assets/images/kaam.jpeg', // Replace with your asset image path
                          height: 200,
                          width: double.infinity,
                          fit: BoxFit.cover,
                        );
                      },
                    )
                  : Container(
                      height: 200,
                      color: Colors.grey.shade300,
                      child: const Center(
                        child: Text(
                          'No Image Available',
                          style: TextStyle(fontSize: 18, color: Colors.grey),
                        ),
                      ),
                    ),
              const SizedBox(height: 16),
              // Job Title and Company
              Text(
                job.name ?? 'Job Title',
                style: const TextStyle(
                  fontSize: 28,
                  fontWeight: FontWeight.bold,
                  color: Colors.brown,
                ),
              ),
              const SizedBox(height: 8),
              Text(
                'Rs. ${job.price}',
                style: const TextStyle(
                  fontSize: 18,
                  color: Colors.brown,
                ),
              ),
              const SizedBox(height: 16),
              // Job Description
              const Text(
                'Description',
                style: TextStyle(
                  fontSize: 22,
                  fontWeight: FontWeight.bold,
                  color: Colors.brown,
                ),
              ),
              const SizedBox(height: 8),
              Text(
                job.description ?? 'No description available',
                style: const TextStyle(fontSize: 16),
              ),
              const SizedBox(height: 24),
              // Job Details
              Card(
                margin: const EdgeInsets.symmetric(vertical: 8),
                elevation: 4,
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(12),
                ),
                child: Padding(
                  padding: const EdgeInsets.all(16.0),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      const Text(
                        'Employee Details',
                        style: TextStyle(
                          fontSize: 20,
                          fontWeight: FontWeight.bold,
                          color: Colors.brown,
                        ),
                      ),
                      const SizedBox(height: 8),
                      Text(
                        'Employee: ${job.name ?? 'Not specified'}',
                        style: const TextStyle(fontSize: 16),
                      ),
                    ],
                  ),
                ),
              ),
              const SizedBox(height: 24),
              // Apply Button
              Center(
                child: ElevatedButton(
                  onPressed: () {
                    // Handle apply functionality
                    showMySnackBar(message: 'The employee has been hired.');
                  },
                  style: ElevatedButton.styleFrom(
                    backgroundColor: Colors.brown,
                    padding: const EdgeInsets.symmetric(
                        horizontal: 24, vertical: 14),
                    textStyle: const TextStyle(fontSize: 18),
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(8),
                    ),
                    elevation: 6,
                    shadowColor: Colors.brown.shade400,
                  ),
                  child: const Text('Hire Now'),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
