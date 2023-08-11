def calc(v1, v2, op):
    result = ""
    if op == "+":
        result = v1 + v2
    elif op == "-":
        result = v1 - v2
    elif op == "*":
        result = v1 * v2
    elif op == "/":
        if v2 == 0:
            result = "division by zero"
        else:
            result = v1 / v2
    elif op == "**":
        result = v1**v2
    return result
res = ""
var1, var2, oper = 0, 0, ""
var1 = int(input("첫 번째 수를 입력하세요. : "))
oper = input("계산을 입력하세요(+, -, *, /, **) : ")
var2 = int(input("두 번째 수를 입력하세요. : "))
res = calc(var1, var2, oper)
if res == "division by zero":
    print("0으로 나누면 안 됩니다.ㅜㅜ")
else:
    print("## 계산기 ## : %d %s %d = %d" % (var1, oper, var2, res))





