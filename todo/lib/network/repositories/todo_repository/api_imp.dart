

import '../../../features/authentication/models/request/task.dart';
import '../../../features/authentication/models/request/user_profile_request.dart';
import 'api_service.dart';

class Repository {
  final ApiService apiService;

  Repository(this.apiService);

  Future<User> loginUser(String username, String password) {
    return apiService.loginUser({
      'username': username,
      'password': password,
      'expiresInMins': 30,
    });
  }

  Future<User> getCurrentAuthUser(String token) {
    return apiService.getCurrentAuthUser('Bearer $token');
  }

  Future<Map<String, dynamic>> refreshToken(String refreshToken) {
    return apiService.refreshToken({
      'refreshToken': refreshToken,
      'expiresInMins': 30,
    });
  }

  Future<List<Task>> getTodos(int limit, int skip) async {
    final response = await apiService.getTodos(limit, skip);
    return (response['todos'] as List).map((task) => Task.fromJson(task)).toList();
  }

  Future<Task> getTodoById(int id) {
    return apiService.getTodoById(id);
  }

  Future<Task> getRandomTodo() {
    return apiService.getRandomTodo();
  }

  Future<List<Task>> getTodosByUserId(int userId) async {
    final response = await apiService.getTodosByUserId(userId);
    return (response['todos'] as List).map((task) => Task.fromJson(task)).toList();
  }

  Future<Task> addTodo(Map<String, dynamic> body) {
    return apiService.addTodo(body);
  }

  Future<Task> updateTodo(int id, Map<String, dynamic> body) {
    return apiService.updateTodo(id, body);
  }

  Future<Map<String, dynamic>> deleteTodo(int id) {
    return apiService.deleteTodo(id);
  }
}
