import 'package:flutter/material.dart';
import './screens/categories_screen.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'DeliMeals',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      initialRoute: MyHomePage.id,
      routes: {
        CategoriesScreen.id: (context) => CategoriesScreen(),
        MyHomePage.id: (context) => MyHomePage(),
      },
    );
  }
}

class MyHomePage extends StatefulWidget {
  static const String id = 'my_home_page';

  @override
  _MyHomePageState createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('DeliMeals'),
      ),
      body: Center(
        child: Column(
          children: [
            FlatButton(
              onPressed: () {
                Navigator.pushNamed(context, CategoriesScreen.id);
              },
              child: Text('Open New Window'),
            )
          ],
        ),
      ),
    );
  }
}
