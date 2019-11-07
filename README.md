# kaishi2019
2019年度会誌
- [vuccaken new HP](https://vuccaken.github.io)

設定の詳細は[wiki](https://github.com/vuccaken/kaishi2019/wiki/)を見てください。


## まずはじめにすること

### まだの人は

1. texのインストール（texlive 2019）
    - 参考：https://tm23forest.com/contents/latex-texlive2019-install
2. githubのアカウントを作成
3. githubのorganizationのvuccakenに参加する（招待してもらう）

### github編

0. winユーザの人は git というものをインストールする。
1. githubのデスクトップアプリをインストールする。
2. 会誌のリポジトリ vuccaken/kaishi2019 をローカル（自分のPC）にクローンする。

### tex編

1. `/tex/` の中に、自分の名前やそれに準ずる名前でtexファイルを作成。
    - 例： `/tex/nkym.tex`
  
2. `/src/` の中には、画像とかを置くためのディレクトリを作成。
    - 例： `/src/nkym/`
    - それ以下のサブディレクトリは自由に構成して良い。
      - 例：
      ```
      /src/
        `- nkym/
            |- img/
            |- fig/
            `- program/
      ```

3. 作成したtexファイルに、`/tex/50template.tex` の内容をそのままコピペして、適宜編集する。

4. あとはいつも通りtexを書いていくだけ。
    - ただし、画像などのソースのパスは `[directory name]/[file name]` とすること。
    - 例： `\includegraphics{nkym/hensuki.png}`

5. 作業が終われば、忘れずに commit & push する。次に作業を再開する時は、リモートのリポジトリに変更がないか、ちゃんと fetch & pull する！　

## タイプセット手順

### 方法1 vscode （おすすめ）

特に理由がない場合は、この方法でtexタイプセット環境を作ってください。

#### 1. vscodeをインストール

公式サイトからDL: https://code.visualstudio.com

#### 2. vscodeの拡張機能 `latex workshop` をインストール

vscodeを開いて、左の四角いアイコンをクリックして、`latex workshop` と検索してインストール。

#### 3. タイプセット

設定ファイルはこちらで用意済みなので、あとは `kaishi2019/` をvscodeで開いて、キーバインド `cmd + alt + B` (winだと `ctrl + alt + B` )でタイプセット！

また、`cmd + alt + V` ( `ctrl + alt + V` )でPDFをプレビューできます。

synctexは、プレビューしたPDFを `cmd` ( `ctrl` )を押しながらクリックするか、 `cmd + alt + J` ( `ctrl + alt + J` )で使用することができます。


### 方法2 latexmk

#### macの場合（多分）

上のvscodeの方法でも結局latexmkを使っているのだが、ここではそれをターミナルから直接実行する。

ターミナルで `kaishi2019/` へ移動する。

```
cd (略)/github/kaishi2019
```

移動できたら次のコマンドでlatexmkを実行する。

```
latexmk tex/nkym.tex
```

or

```
latexmk 00main.tex
```

latexmkには以下のようなオプションがある。

| option | 説明 |
|-|-|
| -c | `.log` とか補助ファイルを消す |
| -C | `.pdf` も消す |
| -pvc | texファイルに変0更があるたび自動でタイプセットする |

optionは次のようにして使う。

```
latexmk -pvc 00main.tex
```

#### winの場合

なんか、上の方法を部室のpc (win) で試したら無理だった。
`latexmk` コマンドで、親ディレクトリからサブディレクトリ以下のtexファイルを指定するとなぜかエラーが出る。

解決策として、一応サブディレクトリにもlatexmkの設定ファイルを置いたので ( `/tex/.latexmkrc` )、サブディレクトリに移動してからコマンド打ってください。

あと、pdfを出力するには、オプション `-pdfdvi` を付けてください。

```
cd (略) /kaishi2019/tex
latexmk -pdfdvi robocon.tex
```

winはくそなので、vscodeで環境作ってやってください......


### 方法3 platex -> dvipdfmx

ターミナルで自分のPCにクローンした `kaishi2019/` へ移動。

defaultだと、styファイルなどはカレントディレクトリにおいておけば参照してくれるが、サブディレクトリ以下は探索してくれない。
ということで、サブディレクトリにパスを通す。

macだと

```
export TEXINPUTS='.//;'
```

winだと

```
set TEXINPUTS='.//;'
```

この手順は、ターミナルを起動するたびに行わなければならない。
それが面倒なら、ログインシェルの設定ファイル（ `.bash_profile` とか）に上のコマンドを書いてください。
または、 `texmf.cnf` とかでググってください。

パスが通ればあとは普通に `platex` -> `dvipdfmx` を実行すればよい。

```
platex tex/nkym.tex
dvipdfmx tex/nkym.dvi
```

```
platex 00main.tex
dvipdfmx 00main.dvi
```


## さいごに

何かわからないことがあればnkymとか知り合いに聞いてください。

issueをopenしてくれてもいいです。
