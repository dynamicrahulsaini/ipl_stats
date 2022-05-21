part of 'widgets.dart';

class TopPlayerWidget extends StatelessWidget {
  const TopPlayerWidget(
      {Key? key, required this.data, required this.type, required this.season})
      : super(key: key);
  final Map data;
  final int type;
  final int season;

  @override
  Widget build(BuildContext context) {
    List keys = infoKeyList[type];
    return Container(
      padding: const EdgeInsets.all(16),
      child: Column(
        children: [
          Text(
            seasonsList[season],
            style: const TextStyle(color: subTitleColor),
          ),
          Padding(
            padding: const EdgeInsets.only(bottom: 16),
            child: Text(
              data[playerKey],
              style: playerStatTextStyle,
            ),
          ),
          Padding(
            padding: const EdgeInsets.all(8),
            child: Row(
              children: [
                if (data[matchKeyList[0]] != null)
                for(int i=0; i<3; i++)
                  Flexible(
                    flex: 1,
                    child: Padding(padding: const EdgeInsets.symmetric(vertical: 8),
                      child: InfoWidget(
                        title: data[matchKeyList[i]],
                        info: matchKeyList[i],
                        match: true,
                        mainTextStyle: subTitleTextStyle,
                        otherTextStyle: matchInfoTextStyle,
                        padding: EdgeInsets.zero,
                      )
                    ),
                  ),
              ],
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
            ),
          ),
          Padding(
            padding: const EdgeInsets.all(8),
            child: Row(
              children: [
                for (int i=0; i<keys.length; i++)
                  Padding(
                    padding: const EdgeInsets.symmetric(vertical: 8),
                    child: InfoWidget(
                      title: keys[i],
                      info: data[keys[i]].toString(),
                      padding: const EdgeInsets.all(4),
                    ),
                  )
              ],
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              ),
          )
        ],
        crossAxisAlignment: CrossAxisAlignment.start,
      ),
    );
  }

}

class InfoWidget extends StatelessWidget {
  const InfoWidget(
      {
        Key? key,
        required this.title,
        required this.info,
        required this.padding,
        this.match = false,
        this.mainTextStyle = playerStatTextStyle,
        this.otherTextStyle = subTitleTextStyle,
      }
  ) : super(key: key);
  final String title;
  final String info;
  final bool match;
  final TextStyle mainTextStyle;
  final TextStyle otherTextStyle;
  final EdgeInsets padding;


  @override
  Widget build(BuildContext context) {
    return Padding(padding: padding,
      child: Center(
        child: Column(
          children: [
            Text(info, style: mainTextStyle, ),
            Text(title, style: otherTextStyle, maxLines: 2,),
          ],
          crossAxisAlignment: match ? CrossAxisAlignment.start : CrossAxisAlignment.center,
        ),
      )
    );
  }
}

class TitleRow extends StatelessWidget {
  const TitleRow({Key? key}) : super(key: key);


  @override
  Widget build(BuildContext context) {
    return Row();
  }
}