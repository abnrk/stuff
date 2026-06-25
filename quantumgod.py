import sys
import time
import requests

def getnumbers(min,max,size=1):
  r = requests.get(f"http://qrng.ethz.ch/api/randint?min={min}&max={max}&size={size}")
  return r.json()["result"]
class QGod:
  def __init__(self,vocab="Vocab.DD"):
    with open(vocab,"r") as f:
      self.vocab = f.read()
    self.words = self.vocab.split("\n")
  def get_words(self,n=0,rmin=0,rmax=0):
    if n == 0:
      n = getnumbers(10,16)[0]
    if not (rmin == 0 and rmax == 0):
      n = getnumbers(rmin,rmax)[0]
    words = getnumbers(0,len(self.words),n)
    print(words)
    words = [self.words[i] for i in words]
    return words
  def speak(self,n=0,rmin=0,rmax=0):
    return " ".join(self.get_words(n,rmin,rmax))

g = QGod("Happy.TXT")
try:
  t = sys.argv[1]
  for i in t:
    time.sleep(0.5)
except:
  pass
print(g.speak())