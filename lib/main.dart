import 'package:flutter/material.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: MyHomePage(),
    );
  }
}

class MyHomePage extends StatelessWidget {


  final ValueNotifier<String> _selectedItem=ValueNotifier('');



  @override
  Widget build(BuildContext context) {
    final appBar=AppBar(
      title: const Text('ListView範例'),
    );
    const items=<String>['第一項','第二項','第三項','第四項','第五項','第六項','第七項','第八項',];
    const icons=<String>['assets/image1.png','assets/image2.jpg','assets/image3.jpg','assets/image4.jpg','assets/image5.jpg','assets/image6.jpg','assets/image7.jpg','assets/image8.jpg',];
    const texts=<String>['天官賜福','綠蔭之冠','偷偷藏不住','咒術迴戰','間諜家家酒','戀是櫻草色','魔道祖師','天涯客',];
    var listView=ListView.builder(
      itemCount: items.length,
      itemBuilder: (context, index)=>
          Card(
            child: ListTile(title: Text(items[index],style: const TextStyle(fontSize: 20),),
              onTap: ()=>_selectedItem.value='點選'+items[index],
              leading:Container(
                child: CircleAvatar(backgroundImage: AssetImage(icons[index],),),
                padding: const EdgeInsets.symmetric(vertical: 8,horizontal: 5),),
              subtitle:Text(texts[index],style: const TextStyle(fontSize: 16),),),

          ),
    );



    final widget =Container(
      child: Column(
        children: <Widget>[
          ValueListenableBuilder<String>(
            builder: _selectedItemBuilder,
            valueListenable:_selectedItem,
          ),
          Expanded(child: listView,),
        ],
      ),
      margin: const EdgeInsets.symmetric(vertical: 10,),
    );
    final appHomePage=Scaffold(
      appBar: appBar,
      body:widget,
    );
    return appHomePage;
  }
  Widget _selectedItemBuilder(BuildContext context,String itemName,Widget? child){
    final widget=Text(itemName,style: const TextStyle(fontSize: 20));
    return widget;

  }
}

