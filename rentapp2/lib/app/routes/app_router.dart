import 'package:go_router/go_router.dart';
import 'package:provider/provider.dart';
import 'package:rentapp2/app/features/auth/presentation/controller/todo_controller.dart';
import 'package:rentapp2/app/features/auth/presentation/ui/HomePage.dart';
import 'package:rentapp2/app/features/auth/presentation/ui/ListProducts.dart';
import 'package:rentapp2/app/features/auth/presentation/ui/LoginPage.dart';
import 'package:rentapp2/app/features/auth/presentation/ui/RegistrationPage.dart';
import 'package:rentapp2/app/routes/router_utils.dart';

class AppRouter {
  static GoRouter get router => _router;

  static final GoRouter _router = GoRouter(
    debugLogDiagnostics: true,
    routes: [
      GoRoute(
        path: Pages.login.screenPath,
        name: Pages.login.screenName,
        builder: (context, state) => ChangeNotifierProvider(
          create: (_) => TodoController(), 
          child: LoginPage(),
          
        ),
        routes: 
        [
        GoRoute(
          path: Pages.registration.screenPath,
          name: Pages.registration.screenName,
          builder: (context, state) => ChangeNotifierProvider(
            create: (_) => TodoController(), 
            child: RegistrationPage(),
          ),
        ),
        GoRoute(
          path: Pages.home.screenPath,
          name: Pages.home.screenName,
          builder: (context, state) => ChangeNotifierProvider(
            create: (_) => TodoController(), 
            child: HomePage(),
          ),
        ),
        GoRoute(
          path: 'productList/:id',
          name: Pages.listProduct.screenName,
          builder: (context, state){
            final id = state.pathParameters['id']!;
            return ChangeNotifierProvider(
              create: (_) => TodoController(),
              child:ListProduct(id)
            );
          }
        ),
        

        ]

      ),
      

      //   routes: [
      //     GoRoute(
      //       path: Pages.addTodo.screenPath,
      //       name: Pages.addTodo.screenName,
      //       builder: (context, state) => ChangeNotifierProvider.value(
      //         value: service<TodoController>(),
      //         child:AddTodo()
      //       ),
      //     ),
      //     GoRoute(
      //       path: Pages.settings.screenPath,
      //       name: Pages.settings.screenName,
      //       builder: (context, state) => ChangeNotifierProvider.value(
      //         value: service<TodoController>(),
      //         child:SettingsPage()
      //       ),
      //     ),
      //     GoRoute(
      //       path: 'editTodo/:id',
      //       name: Pages.editTodo.screenName,
      //       builder: (context, state){
      //         final id = state.pathParameters['id']!;
      //         return ChangeNotifierProvider.value(
      //           value: service<TodoController>(),
      //           child:EditTodoPage(id: id)
      //       );
      //       }
      //     ),
      //   ],
      // ),
      
    ],
  );
}
