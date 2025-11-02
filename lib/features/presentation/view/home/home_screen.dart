import 'package:flutter/material.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        padding: EdgeInsets.all(20),
        width: MediaQuery.of(context).size.width,
        height: MediaQuery.of(context).size.height,
        decoration: BoxDecoration(
          gradient: LinearGradient(
            begin: Alignment.topCenter,
            end: Alignment.bottomCenter,
            colors: [
              Color(0xFFFE6B00), // بنفسجي
              Color(0xFF2575FC),
            ],
          ),
        ),
        child: SingleChildScrollView(
          child: Column(
            spacing: 20,
            children: [
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Row(
                    spacing: 5,
                    children: [
                      CircleAvatar(radius: 40, backgroundColor: Colors.amber),
                      Text(
                        'Shreen Ahmed',
                        style: TextStyle(color: Colors.white, fontSize: 20),
                      ),
                    ],
                  ),
                  Container(
                    width: 100,
                    decoration: BoxDecoration(
                      color: Colors.white,
                      borderRadius: BorderRadius.circular(10),
                    ),
                    child: Row(
                      children: [Icon(Icons.bar_chart_rounded), Text('1400')],
                    ),
                  ),
                ],
              ),
              Container(
                margin: EdgeInsets.all(5),
                width: MediaQuery.of(context).size.width,
                height: 150,
                color: Colors.blue,
              ),
              Align(
                alignment: Alignment.centerLeft,
                child: Text(
                  'Quiz Topic',
                  style: TextStyle(
                    fontSize: 20,
                    fontWeight: FontWeight.bold,
                    color: Colors.white,
                  ),
                ),
              ),
              SizedBox(
                height: 150,
                child: ListView.builder(
                  itemCount: 6,
                  scrollDirection: Axis.horizontal,
                  itemBuilder: (context, index) {
                    return Container(
                      margin: EdgeInsets.all(10),
                      width: 80,
                      height: 150,
                      color: Colors.amber,
                      child: InkWell(
                        onTap: () {
                          print('object');
                        },
                        child: Column(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [Icon(Icons.access_alarm), Text('data')],
                        ),
                      ),
                    );
                  },
                ),
              ),
              Align(
                alignment: Alignment.centerLeft,
                child: Text(
                  'Quiz Level',
                  style: TextStyle(
                    fontSize: 20,
                    fontWeight: FontWeight.bold,
                    color: Colors.white,
                  ),
                ),
              ),
              GridView(
                shrinkWrap: true,
                physics: NeverScrollableScrollPhysics(),
                gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                  crossAxisCount: 2,
                    crossAxisSpacing: 15,
                    mainAxisSpacing: 10
                ),
                children: [
                  InkWell(
                    onTap: (){
                      print('object2');
                    },
                    child: Container(
                      color: Colors.amber,
                    ),
                  ),
 InkWell(
                    onTap: (){
                      print('object2');
                    },
                    child: Container(
                      color: Colors.amber,
                    ),
                  ),
 InkWell(
                    onTap: (){
                      print('object2');
                    },
                    child: Container(
                      color: Colors.amber,
                    ),
                  ),
 InkWell(
                    onTap: (){
                      print('object2');
                    },
                    child: Container(
                      color: Colors.amber,
                    ),
                  ),
 InkWell(
                    onTap: (){
                      print('object2');
                    },
                    child: Container(
                      color: Colors.amber,
                    ),
                  ),
 InkWell(
                    onTap: (){
                      print('object2');
                    },
                    child: Container(
                      color: Colors.amber,
                    ),
                  ),
 InkWell(
                    onTap: (){
                      print('object2');
                    },
                    child: Container(
                      color: Colors.amber,
                    ),
                  ),

                ],
              ),
            ],
          ),
        ),
      ),
    );
  }
}
