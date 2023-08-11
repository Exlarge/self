inFp = None
inStr = ""

inFp = open("/Users/alex/Downloads/data1.txt", "r", encoding='UTF8')

lineNum = 1
while True:
    inStr = inFp.readline()
    if not inStr:  # EOF(End Of File)을 만나면 루프 종료
        break
    print("%d: %s" % (lineNum, inStr), end="")
    lineNum += 1  # 행 번호 증가

inFp.close()