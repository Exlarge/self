inFp = None
inList, inStr = [], ""

inFp = open("/Users/alex/Downloads/data1.txt", "r", encoding='UTF8')

inList = inFp.readlines()
for idx, inStr in enumerate(inList, start=1):
    print("%d: %s" % (idx, inStr.rstrip()))

inFp.close()
