part of 'widgets.dart';

class DropDownStatefulWidget extends StatefulWidget {
  const DropDownStatefulWidget(
      {Key? key, required this.list, required this.onChange, required this.type})
      : super(key: key);
  final List list;
  final String type;
  final void Function(int value) onChange;

  @override
  _TypeDropDownWidgetState createState() => _TypeDropDownWidgetState();
}

class _TypeDropDownWidgetState extends State<DropDownStatefulWidget> {
  int dropdownValue = 0;
  @override
  Widget build(BuildContext context) {
    return DropdownButton<int>(
        value: dropdownValue,
        isExpanded: true,
        icon: const Icon(Icons.arrow_drop_down),
        elevation: 16,
        style: const TextStyle(color: dropDownColor, fontSize: 18),
        underline: Container(
          height: 2,
          color: primaryColor,
        ),
        onChanged: (int? newValue) {
          setState(() {
            widget.onChange(newValue!);
            dropdownValue = newValue;
          });
        },
        items: [
          for (int i = 0; i < widget.list.length; i++)
            DropdownMenuItem(
              value: i,
              child: Text(widget.list[i] + widget.type),
            )
        ]);
  }
}
