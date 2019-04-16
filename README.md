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

### 一些特別函式說明
1. append, cons, list都各有不同，解決問題遇到困難時可以換一個試試看
2. 用(reverse list)可以解決蠻多問題
3. (nthcdr n list)為取得list的第個element開始的list(從左邊從0開始數)(好幾次cdr)
