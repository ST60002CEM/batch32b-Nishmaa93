import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:kaamkuro/app/constants/api_endpoint.dart';
import 'package:kaamkuro/features/employee/domain/entity/employee_entity.dart';

class EmployeeDetailView extends ConsumerStatefulWidget {
  final EmployeeEntity employee;

  const EmployeeDetailView({super.key, required this.employee});

  @override
  ConsumerState<ConsumerStatefulWidget> createState() =>
      _EmployeeDetailViewState();
}

class _EmployeeDetailViewState extends ConsumerState<EmployeeDetailView> {
  @override
  Widget build(BuildContext context) {
    final employee = widget.employee;

    return Scaffold(
      appBar: AppBar(
        title: const Text(
          'Employee Details',
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
              employee.imageUrl != null
                  ? Image.network(
                      ApiEndpoints.employeeImageUrl + employee.imageUrl!,
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
                employee.name ?? 'Job Title',
                style: const TextStyle(
                  fontSize: 28,
                  fontWeight: FontWeight.bold,
                  color: Colors.brown,
                ),
              ),
              const SizedBox(height: 8),
              Text(
                'Phone: +977-${employee.phone}',
                style: const TextStyle(
                  fontSize: 18,
                  color: Colors.brown,
                ),
              ),
              const SizedBox(height: 16),
              Text(
                'Address: ${employee.address!}',
                style: const TextStyle(
                  fontSize: 22,
                  fontWeight: FontWeight.bold,
                  color: Colors.brown,
                ),
              ),
              const SizedBox(height: 8),
            ],
          ),
        ),
      ),
    );
  }
}
