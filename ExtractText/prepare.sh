#!/bin/bash
cd 불닭볶음면
python3 combine.py
cd ../꼬깔콘
python3 combine.py
cd ../포카칩
python3 combine.py
cd ../참깨라면
python3 combine.py
cd ..
python3 combineCSV.py
python3 ml.py
python3 convertModel.py

