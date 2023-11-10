import cv2
import pytesseract
from pytesseract import Output
import csv
from urllib.request import urlopen
import numpy as np
from bs4 import BeautifulSoup
import requests

def get_image_urls(query, num_images):
    url = "https://www.google.co.in/search?q=" + query + "&source=lnms&tbm=isch"
    headers = {'User-Agent': 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/58.0.3029.110 Safari/537.3'}
    
    response = requests.get(url, headers=headers)
    soup = BeautifulSoup(response.content, 'html.parser')

    image_urls = []
    for i, img in enumerate(soup.find_all('img')):
        if i < num_images:
            image_urls.append(img.get('src'))
    del image_urls[0]
    return image_urls

def extract_and_map_text_from_image(image_url, target_string, csv_file_path):
    # 이미지 URL에서 이미지 읽기
    resp = urlopen(image_url)
    img = np.asarray(bytearray(resp.read()), dtype="uint8")
    img = cv2.imdecode(img, cv2.IMREAD_COLOR)

    # 이미지를 회색으로 변환
    gray = cv2.cvtColor(img, cv2.COLOR_BGR2GRAY)

    # OCR 적용
    d = pytesseract.image_to_data(gray, output_type=Output.DICT, config='--psm 6 --oem 3 -l kor')
    n_boxes = len(d['text'])
    # Bounding box에 따른 텍스트 정보 저장
    bounding_boxes = []
    for i in range(n_boxes):
        if int(d['conf'][i]) > 40:  # confidence가 40 이상인 것만
            (x, y, w, h) = (d['left'][i], d['top'][i], d['width'][i], d['height'][i])
            bounding_boxes.append((h, d['text'][i]))

    # h (height) 순으로 정렬
    bounding_boxes.sort()

    # 텍스트만 추출
    extracted_texts = [text for _, text in bounding_boxes]

    print(extracted_texts)
    # CSV 파일로 저장
    with open(csv_file_path, 'w', newline='', encoding='utf-8') as f:
        writer = csv.writer(f)
        writer.writerow(['Extracted Texts'])
        writer.writerow(extracted_texts)  # 이제 extracted_texts는 별도의 행입니다
        writer.writerow(['Target String', target_string])  # 타겟 스트링도 별도의 행입니다.

def temp(num, productName) :
#  imgURLS = get_image_urls(productName, num)
  imgURLS = ["https://www.samyangfoods.com/upload/product/20210305/20210305172851566314.jpg",
            "https://static.hubzum.zumst.com/hubzum/2019/02/14/13/2e8c03aebc7f4dfd94d324f9b542a120.jpg",
           "https://t1.daumcdn.net/cfile/tistory/25350D4B58A05E5F0D",
            "https://blog.kakaocdn.net/dn/Vak1u/btrdqLb3i4I/En7tdsedEAWEKlYGXrdfQ0/img.jpg",
            "https://image.hnsmall.com/images/goods/389/13210389_g.jpg"]
  for url in imgURLS :
    extract_and_map_text_from_image(url, productName, 'output.csv')
temp(100,"불닭볶음면")
