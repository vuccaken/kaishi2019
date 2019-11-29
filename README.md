初版：2019年11月29日

# kaishi2019
弊研究会の2019年度会誌のリポジトリです。
- [vuccaken new HP](https://vuccaken.github.io)

設定などの詳細は[wiki](https://github.com/vuccaken/kaishi2019/wiki/)を見てください。


## まずはじめにすること

### まだの人は

1. texのインストール（texlive 2019）
    - ここからインストール： http://www.tug.org/texlive/acquire-netinstall.html
        - Internetからのインストールで、userのディレクトリ名に非アスキー（日本語）が使われているとエラーが出ました。参考までに、一応メモ。
2. githubのアカウントを作成
3. githubのorganizationのvuccakenに参加する（招待してもらう）

### github編

0. winユーザの人は git というものをインストールする。
1. githubのデスクトップアプリをインストールする。
2. 会誌のリポジトリ vuccaken/kaishi2019 をローカル（自分のPC）にクローンする。

### tex編

1. `/tex/` の中に **自分の名前やそれに準ずる名前** でディレクトリ（フォルダ）を作り、その中にtexファイルを作成。
    - 例： `/tex/nkym/nkym.tex`

2. 作成したtexファイルに、`/tex/_templete/template.tex` の内容をそのままコピペする。

3. あとはいつも通りtexを書いていくだけ。
    - 注意： `/tex/*/*.pdf` は git では無視するよう設定しているので、画像ファイルを直置きせずに `img/` などのサブディレクトリに入れておくと安心。
        - 例：
          ```
          /tex/nkym/
                |- nkym.tex
                |- img/
                |  `- image01.jpg
                `- fig/
                    |- figure01.pdf
                    `- figure02.png
          ```


1. 作業が終われば、忘れずに commit & push する。次に作業を再開する時は、リモートのリポジトリに変更がないか、ちゃんと fetch & pull する！　

## タイプセット手順

### 方法1 vscode （おすすめ）

特に理由がない場合は、この方法でtexタイプセット環境を作ってください。

#### 1. vscodeをインストール

公式サイトからDL: https://code.visualstudio.com

#### 2. vscodeの拡張機能 `Latex Workshop` をインストール

vscodeを開き、左の四角いアイコンをクリックして、`latex workshop` と検索してインストール。

`LaTeX language support` もインストールしておくとよい。

#### 3. タイプセット

`Latex Workshop` の設定ははこちらで用意済みなので、あとはクローンした `kaishi2019/` をvscodeで開いて、キーバインド `cmd + alt + B` でタイプセット！（windowsの人は `cmd` を `ctrl` で読み替えてください。）

また、`cmd + alt + V` でPDFをプレビューできます。

synctexは、プレビューしたPDFを `cmd` を押しながらクリックするか、ソースを表示して `cmd + alt + J` で使用することができます。


### 方法2 latexmk

上のvscodeの方法でも結局latexmkを使っているのですが、ここではそれをターミナルから直接実行する方法を述べます。

`.latexmkrc` というのがlatexmkの設定ファイルです。ここで、 `./sty/` と `../sty/` と `../../sty/` にパスを通しています。

#### macの場合

ターミナルで `kaishi2019/` へ移動する。

```shell
cd (略)/github/kaishi2019
```

移動できたら次のコマンドでlatexmkを実行する。

```shell
latexmk tex/nkym/nkym.tex
```

or

```shell
latexmk 00main.tex
```

latexmkには以下のようなオプションがある。

| option | 説明 |
|-|-|
| -c | `.log` とか補助ファイルを消す |
| -C | `.pdf` も消す |
| -pvc | texファイルに変更があるたび自動でタイプセットする |

optionは次のようにして使う。

```
latexmk -pvc tex/nkym/nkym.tex
```

#### winの場合

windowsだと、サブディレクトリ以下のtexファイルを指定して `latexmk` を実行するとなぜかエラーが出る。

設定ファイル `.latexmkrc` を `/tex/` 以下の自分のディレクトリにコピーし、サブディレクトリに移動してからコマンド打ってください。

あと、pdfを出力するには、オプション `-pdfdvi` を付けてください。

```
cd (略) tex/nkym/
latexmk -pdfdvi nkym.tex
```

winはくそなので、vscodeで環境作ってやってください......


### 方法3 platex -> dvipdfmx

defaultだと、repositoryにおいてある`/sty/vuccaken.sty` などの自作sty fileを見つけることができない（pathが通っていない）ので、`platex` を実行する前にpathを通す必要がある。

texの環境変数 `TEXINPUTS` にpath `/sty/` を追加する。

macだと

```shell
export TEXINPUTS='./sty/;'
```

winだと

```shell
set TEXINPUTS='./sty/;'
```

この手順は、ターミナルを起動するたびに行わなければならない。
それが面倒なら、 ~~ログインシェルの設定ファイル（ `.bash_profile` とか）に上のコマンドを書いてください。または、 `texmf.cnf` とかでググってください。~~  
latexmk を用いてタイプセットした方が楽です。

パスが通ればあとは普通に `platex` -> `dvipdfmx` を実行すればよい。

ターミナルで自分のPCにクローンした `kaishi2019/` へ移動して

```shell
platex tex/nkym/nkym.tex
dvipdfmx tex/nkym/nkym.dvi
```

or

```shell
platex 00main.tex
dvipdfmx 00main.dvi
```


## さいごに

何かわからないことがあればnkymとか知り合いに聞いてください。

issueをopenしてくれてもいいです。
