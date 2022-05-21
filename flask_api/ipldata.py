import pandas as pd 
from flask import Flask
from flask_restful import Resource, Api 


info = {'MostWickets':'Most Wickets',
 'MostSixesInnings': 'Most Sixes Innings',
 'MostRunsOver':'Most Runs Over',
 'MostRunsConcededInnings':'Most Runs Conceded Innings',
 'MostRuns':'Most Runs',
 'MostFoursInnings':'Most Fours Innings',
 'MostDotBallsInnings':'Most Dot Balls Innings',
'FastestFifties':'Fastest Fifties',
'FastestCenturies':'Fastest Centuries',
'BestBowlingStrikeInnings':'Best Bowling Strike Innings',
'BestBowlingEconomyInnings':'Best Bowling Economy Innings'}

app = Flask(__name__)
api = Api(app)

class iplData(Resource):
    def get(self,event,year):
    
        eventG = info[event]
        yearG = str(year)
        data = pd.read_csv(r"{}\{} - {}.csv".format(eventG, eventG, yearG)).head(10)
        dict_ = {}
        for d in range(len(data.POS)):
            dict_[str(d)] = data.iloc[d].to_json()
        return dict_
          
api.add_resource(iplData,'/<string:event>/<string:year>')
app.run(debug=True, host='0.0.0.0')