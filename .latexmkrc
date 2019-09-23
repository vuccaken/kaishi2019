#!/usr/bin/env perl
$latex            = 'platex %O -synctex=1 -interaction=nonstopmode -file-line-error -halt-on-error -shell-escape %S';
$bibtex           = 'pbibtex %O %B';
$makeindex        = 'mendex %O -o %D %S';
$dvipdf           = 'dvipdfmx %O -o %D %S';

# .sty を探索する場所を追加
$ENV{'TEXINPUTS'} = './sty/;' . '../sty/;' . $ENV{'TEXINPUTS'};
