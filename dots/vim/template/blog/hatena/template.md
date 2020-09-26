> -_- coding: utf-8 -_-
> File name: <+FILE NAME+>
> First Edit: <+DATE+>
> Last Change: <%= strftime('%Y-%m-%d') %>>
> Author: <+AUTHOR+>
---

<nav>[:contents]</nav>

<+CURSOR+>

# 記事タイトル
概要

## H2
### H3
#### H4
##### H5
###### H6

## 見出し1
本文1

### list
- list
- list

1. list1
2. list2

### box
|指定無し|左寄せ|中央寄せ|右寄せ|
|---|:---|:---:|---:|
|100|200|300|400|

## Image
<!-- ![image](url) "title" -->

## Link
<!-- [リンクされる文字](リンク先 "タイトル") -->
<!-- [url:embed] -->
<!-- [url:title] -->

## Line
-----

## Math
[,],^,_ -> \\[,\\],\^,\_
[tex:ax\^2+bx+c=0]

## citation
0123456789[^1]
[^1]: 数値

## style
<!-- *イタリック* -->
<!-- **太字** -->
<!-- ***ボールド+イタリック***  -->
<!-- ~~打ち消し線~~ -->
<!-- インラインで`code`を挿入する -->
<!-- ``` python -->
<!-- import this  -->
<!-- ``` -->

## hatena
<figure>
![]()
<figcaption>図</figcaption>
</figure>

### toggle
<details>
  <summary>ここに折りたたんだ時に表示される文字を入れます。</summary>
  ここに折りたたまれて非表示になっている文字を入れます。
</details>
<!-- more -->


<aside id="related_links">
## 関連リンク

- []()
</aside>
