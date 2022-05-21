part of 'widgets.dart';

class PlayerInfo extends StatelessWidget {
  const PlayerInfo(
      {Key? key, required this.playerStat, required this.playerInfoKeyList})
      : super(key: key);
  final Map playerStat;
  final List<String> playerInfoKeyList;

  @override
  Widget build(BuildContext context) {
    String message = "vs ${teamMap[playerStat[matchKeyList[1]]]}, ${playerStat[matchKeyList[0]]}";
    if (teamMap[playerStat[matchKeyList[1]]] == null) {
      message = "";
    }
    else {
      message = "vs ${teamMap[playerStat[matchKeyList[1]]]}";
    }
    if (playerStat[matchKeyList[0]] != null) {
      if (message != "") {
        message += ", ";
      }
      message += playerStat[matchKeyList[0]].toString();
    }

    return Container(
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(10),
        color: dropDownColor,
      ),
      padding: const EdgeInsets.fromLTRB(15, 10, 20, 8),
      child: Column(
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Text(playerStat[playerKey], style: matchInfoTextStyle,),
              Text(
                message,
                style: subHeadTextStyle,
              ),
            ],
          ),
          Padding(
            padding: const EdgeInsets.only(top: 8),
            child: Row(
              children: [
                for (String stat in playerInfoKeyList)
                  InfoWidget(
                    title: stat,
                    info: playerStat[stat].toString(),
                    padding: const EdgeInsets.symmetric(vertical: 4),
                    mainTextStyle: playerItemTextStyle,
                  )
              ],
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
            ),
          )
        ],
      ),
    );
  }
}
