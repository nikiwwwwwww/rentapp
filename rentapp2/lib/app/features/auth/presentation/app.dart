

import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:rentapp2/app/features/auth/presentation/controller/todo_controller.dart';
import 'package:rentapp2/app/routes/app_router.dart';

class App extends StatelessWidget {
  const App({super.key});
  @override
  Widget build(BuildContext context) {
    return ChangeNotifierProvider(
      create: (_) => TodoController(), 
      child: Consumer(
        builder: (context, TodoController todoController, child) {
          return MaterialApp.router(
            debugShowCheckedModeBanner: false,
            // theme: themeProvider.isDark ? ThemeData.dark() : ThemeData.light(),
            routerDelegate: AppRouter.router.routerDelegate,
            routeInformationParser: AppRouter.router.routeInformationParser,
            routeInformationProvider: AppRouter.router.routeInformationProvider,
            //title: 'Flutter Demo',
            //  home: ChangeNotifierProvider(
            //    create:(context) => TodoController()..init(),
            //    child: const Home(),
            //  ),
          );
        }
      )
    );
  }
}
