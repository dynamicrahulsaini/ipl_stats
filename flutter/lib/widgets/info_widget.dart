part of 'widgets.dart';

class Stats extends StatelessWidget {
  const Stats(
      {Key? key, required this.data, required this.type, required this.season})
      : super(key: key);
  final Map data;
  final int type;
  final int season;

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      child: Padding(
          padding: const EdgeInsets.all(8),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.end,
            children: [
              TopPlayerWidget(data: data["0"], type: type, season: season),
              Flexible(
                child: ListView.builder(
                  shrinkWrap: true,
                  physics: const AlwaysScrollableScrollPhysics(),
                  scrollDirection: Axis.vertical,
                  padding: EdgeInsets.zero,
                  itemCount: data.length - 1,
                  itemBuilder: (BuildContext context, int index) {
                    return Padding(
                        padding: const EdgeInsets.all(8),
                        child: PlayerInfo(
                            playerStat: data[(index + 1).toString()],
                            playerInfoKeyList: infoKeyList[type]));
                  },
                ),
              )
            ],
          )
      ),
    );
  }
}
