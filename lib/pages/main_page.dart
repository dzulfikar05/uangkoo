import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:calendar_appbar/calendar_appbar.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:uangkoo/pages/category_page.dart';
import 'package:uangkoo/pages/home_page.dart';
import 'package:uangkoo/pages/transaction_page.dart';

class MainPage extends StatefulWidget {
  const MainPage({super.key});

  @override
  State<MainPage> createState() => _MainPageState();
}

class _MainPageState extends State<MainPage> {
  final List<Widget> _children = [HomePage(), CategoryPage()];
  int currentIndex = 0;

   void onTapTapped(int index){
    setState(() {
      currentIndex = index;
    });
   }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      // Calender Top
      appBar: (currentIndex == 0)?CalendarAppBar(
        backButton: false,
        locale: 'id',
        accent: Colors.green,
        onDateChanged: (value) => print(value),
        firstDate: DateTime.now().subtract(Duration(days: 140)),
        lastDate: DateTime.now(),
      ) : PreferredSize(
        preferredSize: Size.fromHeight(100),
        child: Container(
          child: Padding(
            padding: const EdgeInsets.symmetric(vertical: 36, horizontal: 16),
            child: Text("Categories", style: GoogleFonts.montserrat(fontSize: 20),),
          ),
        )
      ),

      // Body
      body: _children[currentIndex],

      // Bottom Nav
      floatingActionButton: Visibility(
        visible: (currentIndex == 0) ? true : false,
        child: FloatingActionButton(
          onPressed: (){
            Navigator.of(context).push(MaterialPageRoute(builder: (context)=>TransactionPage())).then((value){
              setState(() {
                
              });
            });
          },
          backgroundColor: Colors.green, 
          child: Icon(Icons.add),
        ),
      ),
      floatingActionButtonLocation: FloatingActionButtonLocation.centerDocked,
      bottomNavigationBar: BottomAppBar(
        child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceEvenly,  
          children: [
            IconButton(
              onPressed: (){
                onTapTapped(0);
              }, 
              icon: Icon(Icons.home)
            ),
            SizedBox(
              width: 20,
            ),
            IconButton(
              onPressed: (){
                onTapTapped(1);
              }, 
              icon: Icon(Icons.list)
            ),
          ]
        ),
      ),
    );
  }
}