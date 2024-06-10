import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:equatable/equatable.dart';

import '../../../network/repositories/todo_repository/api_imp.dart';
import '../../authentication/models/request/task.dart';


part 'todos_event.dart';
part 'todos_state.dart';

class TodosBloc extends Bloc<TodosEvent, TodosState> {
  final Repository repository;

  TodosBloc(this.repository) : super(TodosInitial()) {
    on<LoadTodosEvent>((event, emit) async {
      emit(TodosLoading());
      try {
        final tasks = await repository.getTodos(event.limit, event.skip);
        emit(TodosLoaded(tasks));
      } catch (e) {
        emit(TodosError(e.toString()));
      }
    });

    on<LoadTodoByIdEvent>((event, emit) async {
      emit(TodosLoading());
      try {
        final task = await repository.getTodoById(event.id);
        emit(TodoLoaded(task));
      } catch (e) {
        emit(TodosError(e.toString()));
      }
    });

    on<LoadRandomTodoEvent>((event, emit) async {
      emit(TodosLoading());
      try {
        final task = await repository.getRandomTodo();
        emit(TodoLoaded(task));
      } catch (e) {
        emit(TodosError(e.toString()));
      }
    });

    on<LoadTodosByUserIdEvent>((event, emit) async {
      emit(TodosLoading());
      try {
        final tasks = await repository.getTodosByUserId(event.userId);
        emit(TodosLoaded(tasks));
      } catch (e) {
        emit(TodosError(e.toString()));
      }
    });

    on<AddTodoEvent>((event, emit) async {
      try {
        final task = await repository.addTodo(event.task.toJson());
        emit(TodoAdded(task));
      } catch (e) {
        emit(TodosError(e.toString()));
      }
    });

    on<UpdateTodoEvent>((event, emit) async {
      try {
        final task = await repository.updateTodo(event.id, event.task.toJson());
        emit(TodoUpdated(task));
      } catch (e) {
        emit(TodosError(e.toString()));
      }
    });

    on<DeleteTodoEvent>((event, emit) async {
      try {
        final response = await repository.deleteTodo(event.id);
        if (response['isDeleted']) {
          emit(TodoDeleted(event.id, response['deletedOn']));
        }
      } catch (e) {
        emit(TodosError(e.toString()));
      }
    });
  }
}
