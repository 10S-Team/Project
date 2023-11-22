import pandas as pd
from sklearn.feature_extraction.text import CountVectorizer
from sklearn.ensemble import RandomForestClassifier
from sklearn.model_selection import train_test_split
import coremltools
file_path = "final_combined_output.csv"

# CSV 파일 읽기
data = pd.read_csv(file_path)

# 텍스트 데이터를 벡터화하는 CountVectorizer 생성
vectorizer = CountVectorizer()
X = data.iloc[:, 1:]
y = data.iloc[:, 0]
X.transpose()
X = vectorizer.fit_transform(X)
print(X.size)
# 학습 데이터와 테스트 데이터로 분리
X_train, X_test, y_train, y_test = train_test_split(X, y, test_size=0.2, random_state=42)
# 모델 학습
model = RandomForestClassifier(random_state=0).fit(X_train, y_train)

# 테스트 데이터에 대한 예측 수행
y_pred = model.predict(X_test)

# 정확도 계산
accuracy = (y_pred == y_test).mean()

print(f'Model accuracy: {accuracy * 100}%')
import joblib

joblib.dump(model, 'classify.pkl')
