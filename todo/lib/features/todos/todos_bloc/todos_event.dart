part of 'todos_bloc.dart';

abstract class TodosEvent extends Equatable {
  const TodosEvent();

  @override
  List<Object> get props => [];
}

class LoadTodosEvent extends TodosEvent {
  final int limit;
  final int skip;

  const LoadTodosEvent(this.limit, this.skip);

  @override
  List<Object> get props => [limit, skip];
}

class LoadTodoByIdEvent extends TodosEvent {
  final int id;

  const LoadTodoByIdEvent(this.id);

  @override
  List<Object> get props => [id];
}

class LoadRandomTodoEvent extends TodosEvent {}

class LoadTodosByUserIdEvent extends TodosEvent {
  final int userId;

  const LoadTodosByUserIdEvent(this.userId);

  @override
  List<Object> get props => [userId];
}

class AddTodoEvent extends TodosEvent {
  final Task task;

  const AddTodoEvent(this.task);

  @override
  List<Object> get props => [task];
}

class UpdateTodoEvent extends TodosEvent {
  final int id;
  final Task task;

  const UpdateTodoEvent(this.id, this.task);

  @override
  List<Object> get props => [id, task];
}

class DeleteTodoEvent extends TodosEvent {
  final int id;

  const DeleteTodoEvent(this.id);

  @override
  List<Object> get props => [id];
}
