# 斯拉夫语通论

本包是完整累计工程，不是增量补丁。直接打开main.pdf即可阅读全书。

## 重建

在已安装XeLaTeX及相关TeX Live宏包的环境中，切换到本目录，运行：

```sh
bash build.sh
```

脚本先运行两遍XeLaTeX生成XDV，再调用xdvipdfmx生成main.pdf。依赖ctex、fontspec、xeCJK、longtable、booktabs、hyperref、tikz等宏包；字体名称在bellabook_v3.cls中列明：Noto Serif、Noto Sans、Noto Sans Mono、Noto Serif CJK SC、Noto Sans CJK SC、Noto Sans Mono CJK SC、Noto Sans Glagolitic。字体需自行安装，本包不包含字体文件。

无需再取得旧批次文件或原书扫描PDF即可重建当前成书；原书扫描PDF仅用于继续逐页核对。
