
enum Pages{

  registration,
  login,
  home,
  listProduct
  // home,
  // addTodo,
  // todoFinished,
  // settings,
  // error,
  // editTodo,
}

extension AppPageExtension on Pages{
  String get screenPath{

    return switch(this){
      Pages.registration => 'registration',
      Pages.login => '/',
      Pages.home => 'home',
      Pages.listProduct=>'productList',


      // Pages.home => '/',
      // Pages.addTodo => 'add_todo',
      // Pages.todoFinished => 'todo_finished',
      // Pages.settings => 'settings',
      // Pages.error => 'error',
      // Pages.editTodo => 'editTodo',

      //Pages.home => '/',

    };
  }

  String get screenName{

    return switch(this){
      Pages.registration => 'REGISTRATION',
      Pages.login => 'LOGIN',
      Pages.home => 'HOME',
      Pages.listProduct => 'LISTPRODUCT'


      // Pages.home => 'HOME',
      // Pages.addTodo => 'ADDTODO',
      // Pages.todoFinished => 'TODOFINISHED',
      // Pages.settings => 'SETTINGS',
      // Pages.error => 'ERROR',
      // Pages.editTodo => 'EDITTODO',

      //Pages.home => '/',

    };
  }
}