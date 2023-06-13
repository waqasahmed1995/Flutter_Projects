import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

final nameProvider=Provider<String>((ref) => 'Waqas Ahmed'); //globalprovider ... This provider can only return a String value

final name2Provider=Provider((ref) => null); //this provider return type is not predefined so it can take anything.

void main(){
   runApp(const ProviderScope(child: MyOwnApp()));
}
class MyOwnApp extends StatelessWidget {
  const MyOwnApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home:FirstPage(),
    );
  }
}

class FirstPage extends ConsumerWidget {
  const FirstPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context,WidgetRef ref) {
    final name = ref.watch(nameProvider);
    final name2 = ref.watch(name2Provider);
    final nameRead =ref.read(nameProvider);

    return Scaffold(
      appBar: AppBar(
        title: Text('Riverpod'),
      ),
      body: Column(
        children: [
          Text('Body of Riverpod'),
          Text(name),
          Text(name2.toString()),
          Text('Read method : $nameRead'),
        ],
      ),
    );
  }
}
