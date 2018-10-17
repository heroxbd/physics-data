# 课程结构

四星期四个物理学中的数据任务，在任务中学习必要的技能。任务都要突出物理
背景。

令同学能在今后的面对数据类问题，不管是物理的还是非物理的，都能迅速上手。

突出计算机程序替代数学成为自然的科学语言，理解可复现计算的意义，在撰写
报告时实践可复现计算。

## 贯穿始终

   三个层次的基础知识：Unix command line, Text editor, Version control
   with Git.

   "No, computer, I’m in charge here, and I’m going to figure out how
   to make you do what I want."

   git, jupyter, Makefile

### Reference
    * https://www.learnenough.com/story
    * https://www.learnenough.com/command-line-tutorial
    * https://www.learnenough.com/text-editor-tutorial
    * https://www.learnenough.com/git-tutorial

## 原子分子谱学 (kylin1993)
    shell, python
## LIGO Gravitational Wave
  * python
  * 画图
## HXMT 校准数据 (azzuro)
    python, R
## 锦屏数据预处理 (课程 + 比赛)
  * python, CERN ROOT
  * 广线性回归等统计方法
## CMS opendata (比赛?)
  * python, CERN ROOT, R
  * 机器学习，包括深度神经网络

## 选做：帮助同学安装 GNU Linux

    全体同学协作的 git repository 中，通过加 hook 来规范 commit 和
    distro 文件的格式.

    安装操作系统之后，生成 gpg key 加入到 git.tsinghua.edu.cn.
    
    每一个以学号命名的目录中，在 distro 中写出自己的操作系统版本以及帮
    助自己安装系统同学的学号，可以是自己。
    
    每帮助同学安装一个操作系统，将获得一个 IR (installation report)，
    所有同学都完成系统安装后，IR 兑换为课程加分，最多加 10 分。兑换函
    数视 IR 数分布而定，但保证为单调增函数。
    
    有一个 git repository 的状态页实时更新每个同学安装操作系统的情况，
    供大家快速了解到需要帮助的同学。
    
    虚拟机、WSL、MacOS 不计 IR.
    
## 选做：各学科的基于数据的发放性课题

    在物理学之外，各学科中都是基于数据的课题，掌握针对物理实验的大数据
    方法，在科学研究十分有益。每个谭题，视挑战性，给予不同的加分。
    
    * 公共管理，政策调研分析
    * 经济管理，量化金融
    * 太阳系演化模拟
    * LHCb

    与各任课教师联系
# 第一周 20 学时: shell 命令行与脚本编程教学
    分发 cheatsheet
## 课程介绍: 1
## 方法论: 1
## 安装系统: 2
## 基本命令: 3
## git 的使用: 3
## sed 与正则表达式: 2
## Makefile: 3
## 变量: 1
## 循环: 1
## 函数: 1
## 大作业说明：1
## nbgrader 设计
    讲义与练习在一起
    
# 第二周 20 学时：Python 的基本使用
## Python 是什么: 1
    在科学计算中有什么优势？
## 其它优秀的科学计算语言: 1
## 变量: 1
## 函数: 2
## 选择结构: 1
## 循环结构: 1
## 面向对象的编程: 4
## 函数式编程: 4
## Numpy/SciPy: 2
## Matplotlib/Seaborn: 2
## 大作业说明: 4
### 引力波是什么：1
### LIGO 实验：1
### 黑洞、中子星合并：1
### 大作业说明: 1
# 第三周 20 学时：Python 的科学软件
## SQL 数据库: 4
    关系代数，关系数据库
## Pandas: 2
## HDF5: 2
## SymPy: 4
## pandas/scikit_learn: 4
## Python Wrappers: 1
    - fortran
    - C/C++
    - Julia
    - R
## deep learning: 4
## 锦屏中微子数据: 4
### 中微子是什么: 1
### 锦屏中微子实验: 1
### 大作业说明: 1
## HXMT 数据: 4 (备选)
### 宇宙中的硬 X 射线源: 1
### HXMT 是什么: 1
### 大作业介绍: 1
# 第四周 4 学时：研究课题展示
## 匿名评教，讨论
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

# 评分形式
  * 课内和日常作业采用 jupyter 的 nbgrader.
    每次作业 4 分。
  * 每周的数据任务，采用 git + Makefile
    `make test` 测试点计分

    每个任务满分 10 分

  * 选做课题：评估基于课堂展示和报告，给小组下发额外加分，小组成员之间
    协调分数的分配。

# 参考
  https://morvanzhou.github.io/
