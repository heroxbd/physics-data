# 课程名

  * 实验物理的大数据方法（1），40320832，32学时，2019年7月1日（星期一）~2019年7月12日（星期五）
  * 实验物理的大数据方法（2），40320842，32学时，2019年7月15日（星期一）~2019年7月26日（星期五）
    * 可选应用实践，2019年7月29日（星期一） ~ 2019年8月2日（星期五）

## 选课与培养方案
  * 以限选课形式，原则上限工物系和物理系同学选课。
    * 工物系培养方案要求限选《实验物理的大数据方法（1）》;
    * 物理系培养方案要求限选《实验物理的大数据方法（1）》和《实验物理的大数据方法（2）》。

## 介绍
    
从 20 世纪 60 年代大科学仪器时代开始，大型物理和天文学实验一直是大数据发展
的驱动力。近年来，大数据方法在各学科和工业界的广泛应用和发展，又为实验
物理的大规模数据处理提供了新了方法和技术。 本课程系列以实验物理和大数
据方法为结合点，以粒子与核物理、天体物理、辐射成像、凝聚态物理中数据处
理的真实场景为背景，带领同学进行 Unix 类工具支撑的 Python 大规模科学计算，
构建从原始数据到论文图表的端对端数据流水线，通过适合的任务来驱动学习具
体的数据处理技能。

# 课程结构

四星期，围绕物理学中的数据任务，在任务中学习必要的技能。第五周组织同学
自由交流。

令同学能在今后的面对数据类问题，不管是物理的还是非物理的，都能迅速上手。

在课题的训练中为大三的 seminar 做技术上和社会关系上的准备。

突出计算机程序替代数学成为自然的科学语言，理解可复现计算的意义，在撰写
报告时实践可复现计算。

## LIGO Gravitational Wave (公开数据)
* python
* 画图
* 做为随堂例子

## 锦屏数据预处理 (课程 + 比赛)
* https://ghost-hunter.net9.org
* 课赛结合，大作业备选

## Tola 微波干涉阵信源定位

* 正在准备

## 二维金属材料的 Fermi 面测量

* 正在准备

## 基它大作业替代项目

   在物理学之外，也可选择各学科中基于数据的课题。掌握针对物理实验的大
   数据方法，在科学研究十分有益。每个课题，视挑战性，给予不同的加分。
    
   * 公共管理，政策调研分析
   * 经济管理，量化金融
   * 太阳系演化模拟
   * LHCb

# 第一周 16 学时 6A211：Python 基础 
带领大家接触命令行，`git`版本控制，并入门`Python`
## 星期一
* 课程介绍，方法论，Python 是什么，在科学计算中有什么优势，给分。
* 实践：安装命令行环境，git bash，若失败尝试 virtual box，若失败分配 ssh 账号。

可能的坑：在 Visual Studio 使用 pip , 在 PyCharm 使用 pip 。 Windows 中文
用户名，带空格的用户名。

* `git` 教学：`add`, `pull`, `push`, `diff`, `commit`
* 实践：继续安装。

作业 1 self-introduction: `git push` 姓名学号和 `Python` 版本和感想

## 星期二
* 公布小助教和讨论小组。`Python`环境标识符、变量、单行多行注释、折行、运算符、数据类型。

双精度浮点数，无穷整数，布尔值

* 实践：输入 `input` 输出 `print`

作业 2 aplusb: `input` 读入，然后 `print` 输出。

* 脚本语言，互动环境，脚本模式。选择结构`if, elif, else`，缩进。
* 实践：编辑器 `vscode`，选择结构，缩进练习。

作业：猜数字

## 星期三
* 循环结构 `for`, `while`。range()，List, List comprehension。
* 实践：循环练习

作业：输出 1000 以内素数

* 错误提示，调试，函数，String
* 模块，命令行参数输入，文件IO

作业：文本数据，邮件门的 mbox

## 星期四

* dictionary, namespace
* 实践：统计词频

作业：来自大学的邮件

* numpy 数组, array 运算 (slice, dtype cast), HDF5 h5py

提供资料： Matlab 功能对比

* 实践： numpy array 与 List 的比较

作业：使用 numpy 和筛法找 100000 以内素数

## 星期五

* 答疑

# 第二周 16 学时 6A211：Python 数据处理工具
## 星期一
* numpy 矩阵，运算，形状，线性代数
* 实践：激光干涉引力波天文台 LIGO 数据格式
  * 引力波是什么
  * 黑洞、中子星合并

## 星期二
* scipy，如何看文档，如何写文档

## 星期三
* Matplotlab/Seaborn

## 星期四
* pyGeant

  * Geometry 4
    * 可视化
  * Paricles 3
  * Physics 3
  * Scoring 3
    * 数据导出

## 星期五
* 答疑

# 第三周 16 学时 6A207: 命令行与初级脚本编程
    分发 cheatsheet

* 基本命令: 3
* pipe
* git 的使用: 3
* sed 与正则表达式: 2
* Makefile: 3
    
# 第四周 16 学时：Python 科学软件
* Pandas: 2
* pandas/scikit_learn: 4

# 第五周 (可选)：研究课题展示
* 匿名评教，讨论
  匿名提交改进建议

# 技能树
  * GNU/Linux 基本命令行操作
  * Git 版本控制基本操作
  * Jupyter 的使用
  * GNU Make 的使用
  * shell script
  * python
  * R

## 备选
  * Matlab
  * Julia
  * CERN ROOT
  * Scala/Spark/Hadoop
  * gnuplot
  
# 教学团队
  * 教师 1 人，助教 3 人左右，小助教 9 人左右。

# 评分形式
  * 采取百分制，总分超过100分的同学计100分。
  * 课内和日常作业采用 git，test suite 评分。
  
    每次作业 4 分左右，平时作业共计 70 分。
    
  * 大作业，采用 git + Makefile `make test` 测试点计分，30分。
  * 选做课题：评估基于课堂展示和报告，给小组下发额外加分，小组成员之间
    协调分数的分配。

# 参考
  * https://morvanzhou.github.io/
  * https://www.learnenough.com/story
  * https://www.learnenough.com/command-line-tutorial
  * https://www.learnenough.com/text-editor-tutorial
  * https://www.learnenough.com/git-tutorial
  * https://princetonuniversity.github.io/PUbootcamp/agenda/
