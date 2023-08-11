inFp, outFp = None, None
inStr = ""

# macOS에서는 'win.ini' 파일이 없으므로 적절한 다른 파일로 대체합니다.
inFp = open("/Users/alex/Downloads/data.txt", "r")
outFp = open("/Users/alex/Downloads/data3.txt", "w")

inList = inFp.readlines()
for inStr in inList:
    outFp.writelines(inStr)

# 파일 닫기를 for 문 밖으로 이동
inFp.close()
outFp.close()

print("--- 파일이 정상적으로 복사되었음 ---")
