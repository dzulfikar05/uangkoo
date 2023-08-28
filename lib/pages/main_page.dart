import 'package:flutter/foundation.dart';
import 'package:intl/intl.dart' as intl; 
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
  late DateTime selectedDate;
  late List<Widget> _children;
  // final List<Widget> _children = [HomePage(), CategoryPage()];
  late int currentIndex = 0;

  @override
  void initState() {
    // TODO: implement initState
    updateView(0, DateTime.now());
    super.initState();
  }

  // void onTapTapped(int index){
  //   setState(() {
  //     currentIndex = index;
  //   });
  // }
  
  void updateView(int index, DateTime? date){
    setState(() {
      if (date != null){
        selectedDate = DateTime.parse(intl.DateFormat('yyyy-MM-dd').format(date));
      }

      currentIndex = index;
      _children = [HomePage(selectedDate: selectedDate,), CategoryPage()];

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
        onDateChanged: (value) {
          setState(() {
            // print("Select date" + value.toString());
            selectedDate = value;
            updateView(0, selectedDate);
          });
        },
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
                updateView(0, DateTime.now());
                // onTapTapped(0);
              }, 
              icon: Icon(Icons.home)
            ),
            SizedBox(
              width: 20,
            ),
            IconButton(
              onPressed: (){
                updateView(1, null);

                // onTapTapped(1);
              }, 
              icon: Icon(Icons.list)
            ),
          ]
        ),
      ),
    );
  }
}