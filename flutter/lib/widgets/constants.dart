part of 'widgets.dart';

const subTitleColor = Color.fromRGBO(255, 255, 255, 0.7);
const subHeadColor = Color.fromRGBO(255, 255, 255, 0.5);
const primaryColor = Color.fromRGBO(19, 33, 62, 1);
const dropDownColor = Color.fromRGBO(48, 82, 154, 1);

const subTitleTextStyle = TextStyle(color: subTitleColor);
const subHeadTextStyle =
    TextStyle(color: subHeadColor, fontWeight: FontWeight.normal);
const playerItemTextStyle =
    TextStyle(fontWeight: FontWeight.w900, color: Colors.white, fontSize: 20);
const playerStatTextStyle =
    TextStyle(fontWeight: FontWeight.w900, fontSize: 32, color: Colors.white);
const matchInfoTextStyle =
    TextStyle(fontWeight: FontWeight.w900, fontSize: 18, color: Colors.white);

const List<List<String>> infoKeyList = [
  ["Ov", "Runs", "Wkts", "Dots", "SR", "Econ"],
  ["Ov", "Runs", "Wkts", "SR"],
  ["Runs", "BF", "4s", "6s"],
  ["Runs", "BF", "4s", "6s"],
  ["Ov", "Runs", "Wkts", "Maid", "Dots", "SR"],
  ["Runs", "BF", "SR", "4s", "6s"],
  ["Inns", "Runs", "SR", "100", "50", "4s", "6s"],
  ["Ov", "Runs", "Wkts", "SR"],
  ["Runs", "BF", "SR", "4s", "6s"],
  ["Runs", "BF", "SR", "4s", "6s"],
  ["Mat", "Ov", "Wkts", "BBI", "4w", "5w"]
];
const List<String> matchKeyList = ["Match Date", "Against", "Venue"];
const String playerKey = "Player";

const dataTypeList = [
  "Best Bowling Economy Innings",
  "Best Bowling Strike Rate Innings",
  "Fastest Centuries",
  "Fastest Fifties",
  "Most Dot Balls Innings",
  "Most Fours Innings",
  "Most Runs",
  "Most Runs Conceded Innings",
  "Most Runs Over",
  "Most Sixes Innings",
  "Most Wickets"
];

const Map<String, String> dataType = {
  'Most Wickets': 'MostWickets',
  'Most Sixes Innings': 'MostSixesInnings',
  'Most Runs Over': 'MostRunsOver',
  'Most Runs Conceded Innings': 'MostRunsConcededInnings',
  'Most Runs': 'MostRuns',
  'Most Fours Innings': 'MostFoursInnings',
  'Most Dot Balls Innings': 'MostDotBallsInnings',
  'Fastest Fifties': 'FastestFifties',
  'Fastest Centuries': 'FastestCenturies',
  'Best Bowling Strike Rate Innings': 'BestBowlingStrikeRateInnings',
  'Best Bowling Economy Innings': 'BestBowlingEconomyInnings'
};

const seasonsList = [
  "2008",
  "2009",
  "2010",
  "2011",
  "2012",
  "2013",
  "2014",
  "2015",
  "2016",
  "2017",
  "2018",
  "2019",
];

Map<String, String> teamMap = {
  "DEC": "Deccan Chargers",
};
