import 'package:flutter_test/flutter_test.dart';
import 'package:mockito/mockito.dart';
import 'package:todo/features/authentication/models/request/task.dart';

import 'package:todo/features/todos/todos_bloc/todos_bloc.dart';
import 'repository_test.mocks.dart';

void main() {
  late TodosBloc todosBloc;
  late MockRepository mockRepository;

  setUp(() {
    mockRepository = MockRepository();
    todosBloc = TodosBloc(mockRepository);
  });

  test('initial state is TodosInitial', () {
    expect(todosBloc.state, TodosInitial());
  });

  test('emits [TodosLoading, TodosLoaded] when LoadTodosEvent is added', () async {
    final tasks = [
      Task(id: 1, title: 'Test Task 1', completed: false, userId: 1),
      Task(id: 2, title: 'Test Task 2', completed: true, userId: 1),
    ];

    when(mockRepository.getTodos(10, 0)).thenAnswer((_) async => tasks);

    final expected = [
      TodosLoading(),
      TodosLoaded(tasks),
    ];

    expectLater(todosBloc.stream, emitsInOrder(expected));

    todosBloc.add(LoadTodosEvent(10, 0));
  });

  test('emits [TodosLoading, TodoLoaded] when LoadTodoByIdEvent is added', () async {
    final task = Task(id: 1, title: 'Test Task 1', completed: false, userId: 1);

    when(mockRepository.getTodoById(1)).thenAnswer((_) async => task);

    final expected = [
      TodosLoading(),
      TodoLoaded(task),
    ];

    expectLater(todosBloc.stream, emitsInOrder(expected));

    todosBloc.add(LoadTodoByIdEvent(1));
  });

  test('emits [TodosLoading, TodoLoaded] when LoadRandomTodoEvent is added', () async {
    final task = Task(id: 1, title: 'Random Task', completed: false, userId: 1);

    when(mockRepository.getRandomTodo()).thenAnswer((_) async => task);

    final expected = [
      TodosLoading(),
      TodoLoaded(task),
    ];

    expectLater(todosBloc.stream, emitsInOrder(expected));

    todosBloc.add(LoadRandomTodoEvent());
  });

  test('emits [TodosLoading, TodosLoaded] when LoadTodosByUserIdEvent is added', () async {
    final tasks = [
      Task(id: 1, title: 'Test Task 1', completed: false, userId: 1),
      Task(id: 2, title: 'Test Task 2', completed: true, userId: 1),
    ];

    when(mockRepository.getTodosByUserId(1)).thenAnswer((_) async => tasks);

    final expected = [
      TodosLoading(),
      TodosLoaded(tasks),
    ];

    expectLater(todosBloc.stream, emitsInOrder(expected));

    todosBloc.add(LoadTodosByUserIdEvent(1));
  });

  test('emits [TodosLoading, TodoAdded] when AddTodoEvent is added', () async {
    final task = Task(id: 1, title: 'New Task', completed: false, userId: 1);

    when(mockRepository.addTodo(task.toJson())).thenAnswer((_) async => task);

    final expected = [
      TodosLoading(),
      TodoAdded(task),
    ];

    expectLater(todosBloc.stream, emitsInOrder(expected));

    todosBloc.add(AddTodoEvent(task));
  });

  test('emits [TodosLoading, TodoUpdated] when UpdateTodoEvent is added', () async {
    final task = Task(id: 1, title: 'Updated Task', completed: true, userId: 1);

    when(mockRepository.updateTodo(task.id, task.toJson())).thenAnswer((_) async => task);

    final expected = [
      TodosLoading(),
      TodoUpdated(task),
    ];

    expectLater(todosBloc.stream, emitsInOrder(expected));

    todosBloc.add(UpdateTodoEvent(task.id, task));
  });

  test('emits [TodosLoading, TodoDeleted] when DeleteTodoEvent is added', () async {
    final response = {
      'isDeleted': true,
      'deletedOn': '2023-06-08T00:00:00.000Z',
    };

    when(mockRepository.deleteTodo(
      1,
    )).thenAnswer((_) async => response);

    final expected = [
      TodosLoading(),
      TodoDeleted(1, response['deletedOn'] as String),
    ];

    expectLater(todosBloc.stream, emitsInOrder(expected));

    todosBloc.add(DeleteTodoEvent(1));
  });

  test('emits [TodosLoading, TodosError] when an error occurs', () async {
    final errorMessage = 'An error occurred';

    when(mockRepository.getTodos(10, 0)).thenThrow(Exception(errorMessage));

    final expected = [
      TodosLoading(),
      TodosError(errorMessage),
    ];

    expectLater(todosBloc.stream, emitsInOrder(expected));

    todosBloc.add(LoadTodosEvent(10, 0));
  });
}
