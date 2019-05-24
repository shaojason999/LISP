# LISP
### Problem 1.1
Find the prime number  
#### Program 執行方式: 測資已經寫在.lsp檔裡  
```
$ sbcl --script problem_1_1.lsp
2 is a prime number
239 is a prime number
999 is not a prime number
17 is a prime number
```

### Problem 1.2
Find the palindrome(迴文)  
#### Program執行方式: 測資已經寫在.lsp裡
```
$ sbcl --script problem_1_2.lsp
(A B C) is not a palindrome
(M A D A M) is a palindrome
(CAT DOG) is not a palindrome
NIL is a palindrome
(CAT DOG BIRD BIRD DOG CAT) is a palindrome
```

### Problen 1.3
用一般的recusion(1.3.1)跟tail recursion(1.3.2)完成Fibonacci  
#### Program 執行方式: 這次進到sbcl去操作  
```
$ sbcl
* (貼上上面的程式碼)
* (fib1 1)
1
* (fib1 5)
5
* (fib1 10)
55
* (exit)
$ 
```

### Problem 2
Mergesort:
#### 想法
1. list切一半的方法: 
  * 前面那一半用(nthcdr length/2 list)取得後面那一半
  * 後面那一半先用reverse，再用跟前一半一樣的方法
  * 要注意奇偶數問題
2. 其他都跟一般mergesort差不多
#### 作法
1. 在合併時，加新元素進來是加在最前面，而不是最後面(加在最後面list會便有點奇怪，不會處理)，然後全部加完之後再reverse
  * 加在最前面是使用(cons number list)
#### Program執行方式: 先輸入要n個數字，再輸入n個數字
```
$ sbcl --script problem_2.isp
10
9 8 16 2 7 199 0 98 1 29
```

### Problem 3
實作Linux系統的diff(比較兩個檔案):  
  
用LCS(Longest Common Subsequence)做會比較好，但這次作業時間比較緊迫，僅完成比較暴力的方式  
匹配:  
* 先把檔案A的每一行去跟B的每一行比對，得到A的每一行分別跟B的哪幾行配對到，比如A的第3行跟B的1 3 6 7 13行配對到，如此得到一個list (1 3 6 7 13)，然後可以得到n個list (n為A的行數)，然後從這n個list中各選出0個或1個element，排成最長的由小到大的序列。比如從第1個list取3，第2個list取5，第5個list取8->得到(3 5 8)以及來源。  

印出:  
* 印出的方式為用B的(3 5 8)行去找到跟A匹配的行數，找到之前把A的都以-“string”印出，再把B的都匹配前的行數以+”string”印出，然後印出匹配的那行”string”。接著再印A，再印B，再印匹配…最後把B的第8行印出來後，剩下的A都以-“string”印出，以及剩下的B以+”string”印出  

#### Program執行方式: 如果要修改輸入檔名，請在程式碼的第一二行做修改(預設為file1.txt 以及 file2.txt)  
```
$ sbcl --script problem_3.lsp
-#include <stdio.h>
+#include <iostream>
+using namespace std;
 int main() {
-	printf(“Hello World”);
+	cout << “Hello World” << end;
 	return 0;
 }
```

---
### 一些特別函式說明
1. append, cons, list都各有不同，解決問題遇到困難時可以換一個試試看
2. 用(reverse list)可以解決蠻多問題
3. (nthcdr n list)為取得list的第個element開始的list(從左邊從0開始數)(好幾次cdr)

### 其他資料  
[Online Common-Lisp](https://common-lisp.net/downloads)  
[自己做的一點筆記](https://hackmd.io/jZSMG0wSQnS3e5kmVg7Rgg)  
[主要學習網站](https://acl.readthedocs.io/en/latest/zhTW/index.html)  
