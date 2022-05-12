import 'package:dio/dio.dart';
import 'package:flutter/material.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';

void main() {
  runApp(ProviderScope(child: MyApp()));
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(home: Home());
  }
}

class Home extends HookConsumerWidget {
  const Home({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return Scaffold(
      appBar: AppBar(title : Text('asd')),
      // 1. 숫자 1띄우기
      // 2. listview만들기
      // 3. Listview 안에 데이터를 넣어준다
      body: ListView(children: [apiDataProvider()]
    ));
  }
}


class ApiDataNotifier extends StateNotifier {
  ApiDataNotifier(String asd) : super(asd);
  //함수의 타입은 함수를 작성하고 나서부터 나중에 타입설정
generate() async {
  final dio = Dio();
  final res = await dio.get("https://jsonplaceholder.typicode.com/users");
  final body = res.data;
  //res.data(body)가 우리가 받아오는 데이터가 있는 곳
  //body의 데이터타입을 알기 위해서는
  state=body;


}


}

// consumer위젯을 쓰는 이유는 provider를 쓰기위해 쓰는 것!
// 4. provider 생성
final apiDataProvider = StateNotifierProvider((ref) {
return ApiDataNotifier('의미없는 인풋이다. 나중에 더 공부 추가');
});

//여기서 apiDataProvider를 확인하는 작업을 가져야한다.

class ButtonConsumer extends ConsumerWidget {
  const ButtonConsumer({
    Key? key,
  }) : super(key: key);

  //override 몸체느낌!
  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return Consumer(builder:(context, ref, child) {
      return ElevatedButton(onPressed: (){}, child: Text("get test button"));
    });
  }
}