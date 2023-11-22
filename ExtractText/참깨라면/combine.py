import pandas as pd
import glob
import os

def makeCombine():
    file_paths = glob.glob('output*.csv')
    combined_df = pd.DataFrame()  # Initialize an empty DataFrame

    for file in file_paths:
        try:
            # Check if the file is not empty before reading
            if os.path.getsize(file) > 0:
                df = pd.read_csv(file)
                combined_df = pd.concat([combined_df, df], axis=0, ignore_index=True)
            else:
                print(f"File {file} is empty.")
        except pd.errors.EmptyDataError:
            print(f"Error reading file {file}: No data to parse.")
        except pd.errors.ParserError as e:
            print(f"Error reading file {file}: {e}")

    # 결과를 새로운 CSV 파일로 저장
    combined_df = combined_df.loc[:, ~combined_df.columns.str.contains('^Unnamed')]
    combined_df = combined_df.fillna("")
    combined_df.to_csv('combined_output.csv', index=False, header=True)
    print("합치기가 완료되었습니다.")

makeCombine()
