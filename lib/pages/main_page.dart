import 'package:flutter/material.dart';
import 'package:calendar_appbar/calendar_appbar.dart';
import 'package:uangkoo/pages/home_page.dart';

class MainPage extends StatefulWidget {
  const MainPage({super.key});

  @override
  State<MainPage> createState() => _MainPageState();
}

class _MainPageState extends State<MainPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      // Calender Top
      appBar: CalendarAppBar(
        backButton: false,
        locale: 'id',
        accent: Colors.green,
        onDateChanged: (value) => print(value),
        firstDate: DateTime.now().subtract(Duration(days: 140)),
        lastDate: DateTime.now(),
      ),

      // Body
      body: HomePage(),

      // Bottom Nav
      floatingActionButton: FloatingActionButton(
        onPressed: (){

        },
        backgroundColor: Colors.green, 
        child: Icon(Icons.add),
      ),
      floatingActionButtonLocation: FloatingActionButtonLocation.centerDocked,
      bottomNavigationBar: BottomAppBar(
        child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceEvenly,  
          children: [
            IconButton(
              onPressed: (){}, 
              icon: Icon(Icons.home)
            ),
            SizedBox(
              width: 20,
            ),
            IconButton(
              onPressed: (){}, 
              icon: Icon(Icons.list)
            ),
          ]
        ),
      ),
    );
  }
}