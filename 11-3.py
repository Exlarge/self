import os

# 사용자로부터 파일명을 입력받는 부분
filename = input("파일명을 입력하세요 (예: /Users/alex/Downloads/data1.txt): ")

outFp = open(filename, "w")

while True:
    outStr = input("내용입력 :")
    if outStr != "":
        outFp.writelines(outStr + "\n")
    else:
        break

outFp.close()
print("---정상적으로 파일에 씀---")

# 번외 : 파일 입출력 활용
for dirName, subDirList, fnames in os.walk('/Users/alex/Downloads/'):
    for fname in fnames:
        fullPath = os.path.join(dirName, fname)