import os
import pandas as pd

# 현재 디렉토리 내의 모든 폴더 가져오기
folders = [f for f in os.listdir() if os.path.isdir(f)]

# 새로운 데이터프레임 생성
dfs = []

for folder in folders:
    # 각 폴더에 combined_output.csv 파일이 있는지  확인
    file_path = os.path.join(folder, 'combined_output.csv')
    if os.path.exists(file_path):
        # 파일이 있다면 읽어와서 데이터프레임에 추가
        df = pd.read_csv(file_path)
        df.reset_index()
        dfs.append(df)

# 모든 데이터프레임을 concat 함수로 합치기
combined_df = pd.concat(dfs, axis=0, ignore_index=False)
combined_df = combined_df.loc[:, ~combined_df.columns.str.contains('^Unnamed')]
combined_df = combined_df.fillna("")
# 결과를 새로운 CSV 파일로 저장

combined_df.to_csv('final_combined_output.csv', index=False)

print("CSV 파일이 성공적으로 합쳐졌습니다.")
