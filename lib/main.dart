import 'package:flutter/material.dart';


void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
    title: 'Future',
      theme: ThemeData(primarySwatch:Colors.blue),
      home: Home(),
    );
  }
}

class Home extends StatefulWidget {
  @override
  _HomeState createState() => _HomeState();
}

class _HomeState extends State<Home> {

  String result='no data found';

  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return Scaffold(
      appBar: AppBar(
      title: Text('Future Test'),
      centerTitle: true,
      ),
      body: Center(
        child: Padding(
          padding: EdgeInsets.all(30.0),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: <Widget>[
              ElevatedButton(
                  onPressed:(){
                  futureTest();
                  },
                  child:Padding(
                    padding: EdgeInsets.all(8.0),
                    child: Text(
                      'Future test',
                      style: TextStyle(fontSize: 20.0),
                    ),
                  ),
              ),
              SizedBox(
                height: 20.0,
              ),
              Text(
                result,
                style: TextStyle(fontSize: 20.0,
              color: Colors.redAccent),
              ),
              Divider(  // 위젯 사이 구분선 그리기
                height: 20.0,
                thickness: 2.0,
              ),
              FutureBuilder(
                future: myFuture(), // future 함수 지정
                builder: (context,snapshot){  // snapshot : 지정한 future 함수 내 데이터를 복사하여 보관
                  if(snapshot.connectionState == ConnectionState.done) { // future의 상태가 완료되었다면
                    return Text(snapshot.data,
                      style: TextStyle(
                        fontSize: 20.0,
                        color: Colors.blue,
                      ),);
                  }else return CircularProgressIndicator(); // 원 모양 프로그레싱 바
                },)
            ],
          ),
        ),
      ),
    );
  }

 Future<void> futureTest() async{     // 버튼 눌렀을 때 3초 뒤에 텍스트(데이터) 업데이트

   await Future.delayed(Duration(seconds: 3))
      .then((value){
        print('Here comes second'); // 2

        setState(() {
          this.result = 'The data is fetched';
          print(result);            // 3
          print('Here comes third');  // 4
        });

  });

   print('Here comes first');   // 1
   print('Here is the last one');   // 5

  }



Future<String> myFuture() async{

  await Future.delayed(Duration(seconds: 2));
  return 'another Future completed';

 }
}