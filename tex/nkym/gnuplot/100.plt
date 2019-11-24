
reset
# set terminal x11

# set terminal pdf size 5.5cm,4cm
# set output "Aspect.pdf"

set terminal tikz size 9cm,5cm
set output "Aspect.tex"

## 凡例
# set key right bottom # 位置
# set key at 96, 11
# set key spacing 2 # 間隔
# set key samplen 6 # 見本の長さ

## ライン設定登録
set style line 1 lw 2 lc rgb "blue"
# set style line 2 dt (5,5) lw 2 lc rgb "red"
# set style line 3 dt (15,5,5,5) lw 2 lc rgb "#008800"
# set style line 4 pt 6 lw 2 lc rgb "blue"

set xlabel "$\\theta$ [degree]"
set ylabel "$f(\\theta)$"

set ytics 0.4

set zeroaxis
set xrange [0:90]
set yrange [-0.4:1.6]

set angles degrees # ラジアンやめる

## P L O T
set arrow 1 from 30,-0.4 to 30,1.6 nohead dt (1,1)
plot (cos(3*x))**2 + (sin(2*x))**2 - (cos(x))**2 notitle w l ls 1
# replot 0 notitle w l ls 1
unset arrow 1

## - - - - - - - - - - - - - - - - - - - - - - - - -
# set output "p-26.tex"

# set xrange [0:40]
# set yrange [-50:100]

# set arrow 2 from 8.125,-50 to 8.125,100 nohead dt (5,5)
# plot 10000*(x-5)*x**(-2.6) - 50 title "$\\pi(p)$" w l ls 1
# unset arrow 2

set terminal x11