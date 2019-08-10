# kaishi2019
2019年度会誌

## documentclass

今のところ

```latex
\documentclass[11pt,b5paper,papersize,dvipdfmx]{jsbook}
```

でやるつもり。

## ディレクトリの構造

### まとめ方

部員おのおのが作成したtexファイルを、 `00main.tex` にてemath, emathRパッケージにある `\ReadTeXFile` コマンド（ `\input` みたいなもの）を用いてまとめる。

最後に `00main.tex` をタイプセットすることでkaishiが完成する。

### 各人の担当分

ひとつのテーマにつきひとつのtexファイルを作成する。ファイル名はこちらで指定する（基本的には君の名は。）。画像などのファイルは自分の名前のフォルダの中に全部入れる。

```
kaishi2019/
├ 00main.tex
├ 11nsmr.tex
├ 11nsmr/
│ ├ data/
│ │ ├ test01.c
│ │ └ test01.dat
│ ├ fig/
│   └ figure01.pdf
│ └ img/
│   ├ image01.png
│   ├ image02.jpg
│   └ image03.pdf
├ 12nkym.tex
├ 12nkym/
├ ...
```

## スタイルファイル

| スタイルファイル | 説明                                                         |
| ---------------- | ------------------------------------------------------------ |
| vuccaken.sty     | 目次に名前を出力する `\kaishititle` などを定義。             |
| vuccaken2019.sty | 各人が使用するstyファイルや自作マクロを全部ここに書いて一括管理。 |

