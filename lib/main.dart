import 'package:flutter/material.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: MyHomePage(title: 'Flutter Demo Home Page'),
    );
  }
}

class MyHomePage extends StatefulWidget {
  MyHomePage({Key key, this.title}) : super(key: key);

  final String title;

  @override
  _MyHomePageState createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  var slides = [
    {
      "image":
          "https://images.unsplash.com/photo-1520962922320-2038eebab146?ixid=MXwxMjA3fDB8MHxzZWFyY2h8NXx8bmF0dXJhbHxlbnwwfHwwfA%3D%3D&ixlib=rb-1.2.1&auto=format&fit=crop&w=500&q=60",
      "title": "Title 1",
      "description":
          "text text text text text text text text text text text text text text text text text text"
    },
    {
      "image":
          "https://images.unsplash.com/photo-1500828131278-8de6878641b8?ixid=MXwxMjA3fDB8MHxzZWFyY2h8MTJ8fG5hdHVyYWx8ZW58MHx8MHw%3D&ixlib=rb-1.2.1&auto=format&fit=crop&w=500&q=60",
      "title": "Title 2",
      "description":
          "text text text text text text text text text text text text text text text text text text"
    },
    {
      "image":
          "https://images.unsplash.com/photo-1529751703596-04d5a2e848b9?ixid=MXwxMjA3fDB8MHxzZWFyY2h8MTN8fG5hdHVyYWx8ZW58MHx8MHw%3D&ixlib=rb-1.2.1&auto=format&fit=crop&w=500&q=60",
      "title": "Title 3",
      "description":
          "text text text text text text text text text text text text text text text text text text"
    }
  ];

  int currentIndex = 0;
  var sliderController = PageController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(widget.title),
      ),
      body: Stack(
        children: [
          PageView(
            controller: sliderController,
            physics: ClampingScrollPhysics(),
            scrollDirection: Axis.horizontal,
            onPageChanged: (value) {
              setState(() {
                currentIndex = value;
              });
            },
            children:
                slides.map<Widget>((slideMap) => singlePage(slideMap)).toList(),
          ),
          Positioned(bottom: 30, left: 0, right: 0, child: _dotsRow())
        ],
      ),
    );
  }

  Widget singlePage(Map slideDetails) {
    return Stack(children: [
      Image.network(slideDetails['image'], fit: BoxFit.cover),
      Padding(
        padding: EdgeInsets.all(10),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text(
              slideDetails['title'],
              style: TextStyle(
                  color: Colors.white,
                  fontSize: 28,
                  fontWeight: FontWeight.bold),
            ),
            Text(
              slideDetails['description'],
              style: TextStyle(color: Colors.white, fontSize: 18),
            )
          ],
        ),
      )
    ]);
  }

  Widget _dotsRow() {
    return Row(
        mainAxisAlignment: MainAxisAlignment.center,
        children: Iterable<int>.generate(slides.length)
            .map<Widget>((index) => AnimatedContainer(
                  margin: EdgeInsets.only(
                      right: index == slides.length - 1 ? 0 : 3),
                  duration: Duration(milliseconds: 250),
                  decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(5),
                      color:
                          currentIndex == index ? Colors.black : Colors.grey),
                  width: currentIndex == index ? 22 : 10,
                  height: 10,
                ))
            .toList());
  }
}
