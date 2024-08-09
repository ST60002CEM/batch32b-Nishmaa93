// class ApiEndpoints {
//   ApiEndpoints._();

//   static const Duration connectionTimeout = Duration(seconds: 1000);
//   static const Duration receiveTimeout = Duration(seconds: 1000);
//   static const String baseUrl = "http://10.0.2.2:5500/api/";

//   static const String login = "user/login";
//   static const String register = "user/create";
//   static const String imageUrl = "http://10.0.2.2:5500/uploads/";
//   static const String uploadImage = "auth/uploadImage";
// }
class ApiEndpoints {
  ApiEndpoints._();

  static const Duration connectionTimeout = Duration(seconds: 1000);
  static const Duration receiveTimeout = Duration(seconds: 1000);
  // static const String baseUrl = "http://10.0.2.2:5500/api/";   //yo emulator lai ho
  //static const String baseUrl = "http://localhost:3000/api/v1/";
  static const String baseUrl =
      "http://192.168.10.117:5500/api/"; // yo physical device lai ho

  // ====================== Auth Routes ======================
  static const String login = "user/login";
  static const String register = "user/create";
  static const String getAllStudent = "auth/getAllStudents";
  static const String getStudentsByJob = "auth/getStudentsByJob/";
  static const String getStudentsByCourse = "auth/getStudentsByCourse/";
  static const String updateStudent = "auth/updateStudent/";
  static const String deleteStudent = "auth/deleteStudent/";
  // static const String jobImageUrl = "http://10.0.2.2:5500/jobs/";
  static const String jobImageUrl = "http:/192.168.10.117:5500/jobs/";
  static const String uploadImage = "auth/uploadImage";
  static const String currentUser = "auth/getMe";

  // ====================== Job Routes ======================

  static const String getAllJobs = "jobs/get_all_jobs";

  // ====================== Course Routes ======================
  static const String createCourse = "course/createCourse";
  static const String deleteCourse = "course/";
  static const String getAllCourse = "course/getAllCourse";
  static const limitPage = 5;
}
