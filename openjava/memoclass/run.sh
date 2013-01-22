#!/usr/bin/env bash

# Définit un alias pour le compilateur OJC.
alias ojc='/Users/Will/Desktop/OpenJava_1.1/bin/ojc.sh'

/Users/Will/Desktop/OpenJava_1.1/bin/ojc.sh MemoClass.oj
/Users/Will/Desktop/OpenJava_1.1/bin/ojc.sh Person.oj
/Users/Will/Desktop/OpenJava_1.1/bin/ojc.sh Student.oj

echo {"","","Run java Person",""}

java Person

echo {"","","Run java Student",""}

java Student
