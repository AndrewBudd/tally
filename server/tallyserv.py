from flask import Flask
from flask import request
import piglow
from nanoleafapi import Nanoleaf, NanoleafDigitalTwin
import yaml
import time

with open("config.yaml", 'r') as stream:
    try:
        config = yaml.safe_load(stream)
    except yaml.YAMLError as exc:
        print(exc)
        exit(-1)

if 'modules' in config and 'nanoleaf' in config['modules']):
  nl = Nanoleaf( config['modules']['nanoleaf']['ip'], config['modules']['nanoleaf']['token'] )  

app = Flask(__name__)

piglow.clear_on_exit = False

@app.route('/tally',methods=['POST'])
def tally():
  if request.form['tally'] == "on":
    piglow.red(150)
    piglow.show()
    if nl is not None:
      nl.set_effect( config['modules']['nanoleaf']['micOnEffect'] )
    return "on"
  else:
    piglow.red(0)
    piglow.show()
    if nl is not None:
      nl.set_effect( config['modules']['nanoleaf']['offEffect'] )
    return "off"

if __name__ == '__main__':
  app.run(host='0.0.0.0')
