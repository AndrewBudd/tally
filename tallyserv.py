from flask import Flask
from flask import request
import piglow
import time

app = Flask(__name__)

piglow.clear_on_exit = False

@app.route('/tally',methods=['POST'])
def tally():
  if request.form['tally'] == "on":
    piglow.red(150)
    piglow.show()
    return "on"
  else:
    piglow.red(0)
    piglow.show()
    return "off"


if __name__ == '__main__':
  app.run(host='0.0.0.0')
