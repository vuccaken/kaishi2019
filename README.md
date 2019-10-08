# kaishi2019
2019年度会誌
- [vuccaken HP](http://rp2017xy.starfree.jp)

詳細は[wiki](https://github.com/vuccaken/kaishi2019/wiki/)を見てください。


## まずはじめにすること

### まだの人は

1. texのインストール（texlive 2019）
2. githubのアカウントを作成
3. githubのorganizationのvuccakenに参加する（招待してもらう）

### github編

0. winユーザの人は git というものをインストールする。
1. githubのデスクトップアプリをインストールする。
2. 会誌のリポジトリ vuccaken/kaishi2019 をローカル（自分のPC）にクローンする。

### tex編

1. `/tex/` の中に自分の名前やそれに準ずる名前でtexファイルを作成。
  - 例： `/tex/nkym.tex`

2. `/src/` の中にはディレクトリを作成。
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
  - ただし、画像などのソースのパスは `/[name]/[filename]` とすること。
  - 例： `\includegraphics{/nkym/hensuki.png}`

5. 作業が終われば、忘れずに commit & pull する。次に作業を再開する時は、リモートのリポジトリに変更がないか、ちゃんとfetchする！　

## タイプセット手順

### 方法1 vscode （おすすめ）

#### 1. vscodeをインストール

公式サイトからDL: https://code.visualstudio.com

#### 2. vscodeの拡張機能 `latex workshop` をインストール

vscodeを開いて、左の四角いアイコンをクリックして、`latex workshop` と検索してインストール。

#### 3. タイプセット
設定ファイルはこちらで用意済みなので、あとは `kaishi2019/` をvscodeで開いて、キーバインド `cmd + alt` (winだと `ctrl + alt` )でタイプセット！


### 方法2 latexmk

上のvscodeの方法でも結局latexmkを使っているのだが、ここではそれをターミナルから直接実行する。

ターミナルで `kaishi2019/` へ移動する。

```
cd (略)/github/kaishi2019
```

移動できたら次のコマンドでlatexmkを実行する。

```
latexmk tex/nkym.tex
latexmk 00main.tex
```

latexmkには以下のようなオプションがある。

| option | 説明 |
|-|-|
| -c | `.log` とか補助ファイルを消す |
| -C | `.pdf` も消す |
| -pvc | texファイルに変更があるたび自動でタイプセットする |


### 方法3 platex -> dvipdfmx

ターミナルで `kaishi2019/` へ移動。

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
面倒な人は `texmf.cnf` とかでググってください。

パスが通ればあとは普通に platex -> dvipdfmf を実行すればよい。

```
platex tex/nkym.tex
dvipdf nkym.dvi
```

```
platex 00main.tex
dvipdf 00main.dvi
```


## さいごに

何かわからないことがあればnkymとか知り合いに聞いてください。

issueをopenしてくれてもいいです。