import 'package:dio/dio.dart';
import 'package:retrofit/http.dart';

import '../../../features/authentication/models/request/task.dart';
import '../../../features/authentication/models/request/user_profile_request.dart';


part 'api_service.g.dart';

@RestApi(baseUrl: "https://dummyjson.com")
abstract class ApiService {
  factory ApiService(Dio dio, {String baseUrl}) = _ApiService;

  @POST("/auth/login")
  Future<User> loginUser(@Body() Map<String, dynamic> body);

  @GET("/auth/me")
  Future<User> getCurrentAuthUser(@Header("Authorization") String token);

  @POST("/auth/refresh")
  Future<Map<String, dynamic>> refreshToken(@Body() Map<String, dynamic> body);

  @GET("/todos")
  Future<Map<String, dynamic>> getTodos(@Query("limit") int limit, @Query("skip") int skip);

  @GET("/todos/{id}")
  Future<Task> getTodoById(@Path("id") int id);

  @GET("/todos/random")
  Future<Task> getRandomTodo();

  @GET("/todos/user/{userId}")
  Future<Map<String, dynamic>> getTodosByUserId(@Path("userId") int userId);

  @POST("/todos/add")
  Future<Task> addTodo(@Body() Map<String, dynamic> body);

  @PUT("/todos/{id}")
  Future<Task> updateTodo(@Path("id") int id, @Body() Map<String, dynamic> body);

  @DELETE("/todos/{id}")
  Future<Map<String, dynamic>> deleteTodo(@Path("id") int id);
}
