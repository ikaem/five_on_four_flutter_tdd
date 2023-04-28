// import 'package:flutter_riverpod/flutter_riverpod.dart';

// import 'package:flutter/material.dart';

// class Todo {
//   final String id;
//   final String title;
//   final bool isCompleted;

//   Todo({
//     required this.id,
//     required this.title,
//     this.isCompleted = false,
//   });
// }

// class TodoNotifier extends StateNotifier<Todo> {
//   TodoNotifier(Todo initialState) : super(initialState);

//   void toggleComplete() {
//     state = Todo(
//       id: state.id,
//       title: state.title,
//       isCompleted: !state.isCompleted,
//     );
//   }
// }

// final todoNotifierFamilyProvider =
//     StateNotifierProvider.family<TodoNotifier, Todo, String>((ref, todoId) {
//   final todo = Todo(id: "2", title: "no");
//   return TodoNotifier(todo);
// });

// class TodoWidget extends ConsumerWidget {
//   final String todoId;

//   TodoWidget({required this.todoId});

//   @override
//   Widget build(BuildContext context, WidgetRef ref) {
//     final todoNotifier = ref.watch(todoNotifierFamilyProvider(todoId));
//     final todo = todoNotifier.state;

//     return ListTile(
//       title: Text(todo.title),
//       trailing: Checkbox(
//         value: todo.isCompleted,
//         onChanged: (bool? value) {
//           if (value != null) {
//             todoNotifier.toggleComplete();
//           }
//         },
//       ),
//     );
//   }
// }


// TODO delete this