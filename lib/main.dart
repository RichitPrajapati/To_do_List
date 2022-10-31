import 'package:flutter/material.dart';
void main() {
  runApp(
    const to_do_list(),
  );
}
class to_do_list extends StatefulWidget {
  const to_do_list({Key? key}) : super(key: key); @override
  State<to_do_list> createState() => _to_do_listState();
}
int i = 9;
String to_do = '';
String time = 'AM';
class _to_do_listState extends State<to_do_list> { Map map = {
  '$i:00\n $time': to_do,
};
int z = 0; @override
Widget build(BuildContext context) { return MaterialApp(
  debugShowCheckedModeBanner: false, home: Scaffold(
  appBar: AppBar(
    title: const Text("To-Do List"), centerTitle: true,
    actions: [ Padding(
      padding: const EdgeInsets.only(right: 5), child: InkWell(
      onTap: () { print(map);
      },
      child: const Icon(Icons.apps),
    ),
    ),
    ],
    backgroundColor: Colors.red,
  ),
  body: SingleChildScrollView(

    scrollDirection: Axis.vertical, child: Column(
    children: map.entries.map((e) { return Row(
      children: [ Container(
        margin: const EdgeInsets.all(8), height: 60,
        width: 60,
        decoration: BoxDecoration( borderRadius: BorderRadius.circular(8), border: Border.all(
          color: Colors.black45, width: 2,
        ),
        ),
        alignment: Alignment.center, child: Column(
        mainAxisAlignment: MainAxisAlignment.center, crossAxisAlignment: CrossAxisAlignment.center,
        children: [
        Text( '${e.key}',
          style: const TextStyle( fontWeight: FontWeight.bold,
          ),
        ),
// Text(
// time,
// style: const TextStyle(
// fontWeight: FontWeight.bold,
// ),
// ),
      ],
      ),
      ),
        Expanded(
          child: Container(
            margin: const EdgeInsets.only(right: 8), child: TextField(
            onChanged: (text) { to_do = text;
            },
            decoration: const InputDecoration(

              border: OutlineInputBorder(), hintText: "Enter Your To-Do Here",
            ),
          ),
          ),
        ),
      ],
    );
    }).toList(),
  ),
  ),
  floatingActionButton: FloatingActionButton( onPressed: () {
    z++;
    setState(() {
      if (z < 12) {
        if (i <= 11) {
          map['${i++}:00\n $time'] = to_do;
        } else if (i == 12) { time = 'PM';
        map['${i++}:00\n $time'] = to_do;
        } else { i = 1;
        time = 'PM';
        map['${i++}:00\n $time'] = to_do;
        }
      }
    });
  },
    backgroundColor: Colors.red, child: const Icon(
      Icons.add,
      color: Colors.white, size: 25,
    ),
  ),
),
);
}
}
