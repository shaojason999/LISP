# LISP
### Problem 1.1
Find the prime number  
### Problem 1.2
Find the palindrome(迴文)  
### Problen 1.3
用一般的recusion(1.3.1)跟tail recursion(1.3.2)完成Fibonacci
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
  
### 一些特別函式說明
1. append, cons, list都各有不同，解決問題遇到困難時可以換一個試試看
2. 用(reverse list)可以解決蠻多問題
3. (nthcdr n list)為取得list的第個element開始的list(從左邊從0開始數)(好幾次cdr)
