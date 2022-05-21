import 'package:flutter/material.dart';
import 'package:ipl_stats/apicalls.dart';
import 'package:ipl_stats/widgets/widgets.dart';
import 'package:multi_value_listenable_builder/multi_value_listenable_builder.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    Map<dynamic, dynamic> data = {};
    getData(0, 0).then((value) => data = value);

    return MaterialApp(
      title: 'IPL Stats',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: SafeArea(
          child: (MyHomePage(
        data: data,
      ))),
    );
  }
}

class MyHomePage extends StatefulWidget {
  const MyHomePage({Key? key, required this.data}) : super(key: key);
  final Map data;

  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  final seasonsDropdownValue = ValueNotifier<int>(0);
  final typeDropdownValue = ValueNotifier<int>(0);
  ValueNotifier<Map> data = ValueNotifier({});

  @override
  void initState() {
    super.initState();
    data.value = widget.data;
    get();
  }

  get() {
    getData(typeDropdownValue.value, seasonsDropdownValue.value)
        .then((value) => data.value = value);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        children: [
          Padding(
            padding: const EdgeInsets.fromLTRB(16, 16, 16, 4),
            child: DropDownStatefulWidget(
              type: " seasons",
              list: seasonsList,
              onChange: (int value) {
                seasonsDropdownValue.value = value;
                get();
              },
            ),
          ),
          Padding(
              padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 4),
              child: DropDownStatefulWidget(
                type: "",
                list: dataTypeList,
                onChange: (int value) {
                  typeDropdownValue.value = value;
                  get();
                },
              )),
          Flexible(
            child: Container(
              margin: const EdgeInsets.only(
                top: 16,
              ),
              padding: const EdgeInsets.only(
                top: 8,
              ),
              child: MultiValueListenableBuilder(
                valueListenables: [
                  typeDropdownValue,
                  seasonsDropdownValue,
                  data
                ],
                builder: (context, _content, child) {
                  return Stats(
                      data: _content.elementAt(2),
                      type: _content.elementAt(0),
                      season: _content.elementAt(1));
                },
              ),
              decoration: const BoxDecoration(
                color: primaryColor,
                borderRadius: BorderRadiusDirectional.only(
                    topStart: Radius.circular(10), topEnd: Radius.circular(10)),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
