import 'package:flutter/material.dart';

void main() {
  runApp(const App());
}

class App extends StatefulWidget {
  const App({Key? key}) : super(key: key);

  @override
  State<App> createState() => _AppState();
}

class _AppState extends State<App> {

  bool showTitle = true;

  void toggleTitle(){
    setState(() {
      showTitle = !showTitle;
    });
  }

  // context에 위젯트리에 대한 정보가 담김
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      theme: ThemeData(
        textTheme: const TextTheme(
          titleLarge: TextStyle(
            color: Colors.red,
          ),
        ),
      ),
      home: Scaffold(
        backgroundColor: const Color(0xFFF3EDDB),
        body: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              showTitle ? const MyLargeTitle() : const Text("nothing to see"),
              IconButton(onPressed: toggleTitle, icon: Icon(Icons.remove_circle))
            ],
          ),
        ),
      ),
    );
  }
}

class MyLargeTitle extends StatefulWidget {
  const MyLargeTitle({
    super.key,
  });

  @override
  State<MyLargeTitle> createState() => _MyLargeTitleState();
}

class _MyLargeTitleState extends State<MyLargeTitle> {
  int count = 0;
  // widget life cycle
  // initState는 부모요소의 데이터를 초기화할때 쓸 수 있음 
  // 무조건 build 메서드보다 위에 만들어야 함
  // 한번만 호출 되어야 함
  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    print('initstate');
  }
  // 위젯을 제거할때 메서드
  // API 업데이트나 이벤트 리스너로부터 구독을 취소하거나 form 리스너로부터 벗어나고 싶을 때 사용
  @override
  void dispose() {
    // TODO: implement dispose
    super.dispose();
    print('dispose');
  }

  @override
  Widget build(BuildContext context) {
    print('build');
    return Text(
      'My Large Title',
      style: TextStyle(
        fontSize: 30,
        color: Theme.of(context).textTheme.titleLarge?.color,
      ),
    );
  }
}
