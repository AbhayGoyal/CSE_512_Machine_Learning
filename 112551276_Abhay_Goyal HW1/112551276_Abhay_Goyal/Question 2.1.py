
import random
import math

p=0
q=0
t=0
l3 = []

def question2(res):
    global p
    global t
    l1 = res.keys()
    l2 = res.values()
    q = 0
    d = 0
    l3 = []
    for x, y in zip(l1, l2):
        l3.append(max(x, y))
        d = 0
    for x in l3[:]:
        d = d + x
    d = d / 10
    p =p+d
    q = 0
    for x in l3[:]:
        q = q + ((x - d) ** 2)
        q=math.sqrt(q)
    q = q / 10
    t += q



for x in range(0,30):
    l1 = [random.uniform(0,1) for i in range(10)]
    l2 = [random.uniform(0,1) for i in range(10)]
    res = dict(zip(l1, l2))
    question2(res)

p = p / 30
print("E(X) is :-", p)
t = t / 30
print("SD(X) is:-", (t))



