part of 'todos_bloc.dart';

abstract class TodosState extends Equatable {
  const TodosState();

  @override
  List<Object> get props => [];
}

class TodosInitial extends TodosState {}

class TodosLoading extends TodosState {}

class TodosLoaded extends TodosState {
  final List<Task> tasks;

  const TodosLoaded(this.tasks);

  @override
  List<Object> get props => [tasks];
}

class TodoLoaded extends TodosState {
  final Task task;

  const TodoLoaded(this.task);

  @override
  List<Object> get props => [task];
}

class TodoAdded extends TodosState {
  final Task task;

  const TodoAdded(this.task);

  @override
  List<Object> get props => [task];
}

class TodoUpdated extends TodosState {
  final Task task;

  const TodoUpdated(this.task);

  @override
  List<Object> get props => [task];
}

class TodoDeleted extends TodosState {
  final int id;
  final String deletedOn;

  const TodoDeleted(this.id, this.deletedOn);

  @override
  List<Object> get props => [id, deletedOn];
}

class TodosError extends TodosState {
  final String message;

  const TodosError(this.message);

  @override
  List<Object> get props => [message];
}
