# python  如何管理包和模块

>Python 3.8.10, Ubuntu 20.04, 代码调试均在~/test/目录下进行
## 模块化编程的概述

Python的一大优势在于其丰富的第三方库。借助第三方库，我们可以很高效的实现一些功能，而不用像C语言一样自己编写程序。同时，我们也可以编写自己的模块库，进行模块化编程。总的来说，模块化代码具有以下几个优点：

+ 简化问题 使用模块可以将一个复杂的工程分成若干个小的部分，使问题得到简化
+ 可维护性 模块化编程降低了工程的各个部分的相互依赖性，让调试和多人协作更加高效
+ 可重复性 模块中定义的功能可以在不同项目中复用，避免重复造轮子
+ 模块通常被定义为一个单独的命名空间，这有助于避免程序不同区域中标识符之间的冲突

在Python中包/库(我对两个词不作区分)的来源有很多，库既可以由使用Python编写，也可以使用C语言编写并在运行时动态加载，Python还内置了很多有用的标准库，拥有丰富的第三方库资源。下面列举一些Python的标准库和常用第三方库

### 标准库

1. os：提供了与操作系统交互的功能，如文件操作、目录操作、进程管理等。
2. sys：提供了一些与Python解释器和Python运行环境相关的功能，如命令行参数、标准输入输出、环境变量等。
3. datetime：提供了处理日期和时间的功能，如日期的计算、格式化、解析等。
4. re：提供了正则表达式的支持，可以用来进行文本匹配和替换等操作。
5. math：提供了数学运算的函数库，如三角函数、指数函数、常量等。
6. random：提供了生成随机数的函数，可以用来进行模拟和随机抽样等操作。
7. json：提供了JSON格式的编码和解码功能，可以进行数据的序列化和反序列化。
8. sqlite3：提供了SQLite数据库的支持，可以进行数据库的连接、查询、修改等操作。

这些标准库都是Python自带的，无需额外安装

### 常用第三方库

当今，Python 生态系统中有数以千计的第三方库，其中许多库都非常有用。以下是一些常用的 Python 第三方库：

1. NumPy：用于数学计算和科学计算的库，效率较高。
2. Pandas：提供了数据结构和数据分析工具，特别是在数据处理方面非常有用。
3. Matplotlib：用于绘制静态、动态和交互式图形的绘图库。
4. TensorFlow：用于机器学习和深度学习的库。
5. PyTorch：另一个流行的深度学习框架。
6. Django：用于编写 Web 应用程序的全功能框架，提供了许多开箱即用的功能和工具。
7. Requests：用于发送 HTTP 请求和处理响应的库，非常适合编写 Web 应用程序和爬虫。

这仅仅是 Python 生态系统中的一小部分。还有更多的库等待大家的探寻。

## import
通过使用import语句可以调用模块，一些常见的语句如下(注意 **<>** 在实际写代码时省略)：
```python
import <module_name>
```
该代码将调用名为 **module_name** 的模块，但注意此时模块中的对象不能直接访问，必须使用形如 **module_name.object** 的点表示法才可以访问。因为此时模块定义的对象保留在模块的私有符号表中。(符号表可以看作一张存储所有对象名称的清单，在Python中一切皆可对象，因此符号表存储了变量名，函数名，类的实例名等一系列对象的名字，本地符号表中的对象可以直接被调用)

```python
from <module_name> import <name>
```
该代码允许将模块中的单个对象直接导入到本地的符号表中，因此在调用该对象时不需要使用点表示法。如果希望调用多个对象，可以在 **import** 后写多个对象的名字，中间用 **,** 隔开

```python
from <module_name> import <name> as <alt_name>

import <module_name> as <alt_name>
```
在Python中可以使用别名将模块中的对象导入到本地符号表中，这样可以在本地直接调用模块中的对象，同时避免了对象名称可能的冲突

```python
from <module_name> import *
```
该语句会将模块中所有对象的名称放入本地符号表，**除以下划线开头命名的对象** 在编写大规模程序时不建议使用该代码，因为可能会造成名称覆盖，产生意想不到的错误

## dir()
该函数是Python内置函数，它会返回当前本地符号表中按生成字母排序的名称列表

```python
>>> dir()
['__annotations__', '__builtins__', '__doc__', '__loader__', '__name__', '__package__', '__spec__']
>>> a = [1,2,3]
>>> dir()
['__annotations__', '__builtins__', '__doc__', '__loader__', '__name__', '__package__', '__spec__', 'a']
>>> class Bar():
...     pass
... 
>>> dir()
['Bar', '__annotations__', '__builtins__', '__doc__', '__loader__', '__name__', '__package__', '__spec__', 'a']
>>> x = Bar()
>>> dir()
['Bar', '__annotations__', '__builtins__', '__doc__', '__loader__', '__name__', '__package__', '__spec__', 'a', 'x']
>>> import numpy
>>> dir()
['Bar', '__annotations__', '__builtins__', '__doc__', '__loader__', '__name__', '__package__', '__spec__', 'a', 'numpy', 'x']
```

## 将模块作为脚本执行

模块在本质上也是一个Python脚本，因此也可以像脚本一样执行

***mod.py***

```python
s = 'hello world'
def foo(arg):
    print(f'arg = {arg}')

class Bar:
    pass

print(s)
foo('bye')
x = Bar()
print(x)
```

当在终端以脚本形式执行时：
```python
$ python3 mod.py
hello world
arg = bye
<__main__.Bar object at 0x7fe9681ba4c0>
```
当被当作模块调用时：
```python
>>> import mod
hello world
arg = bye
<mod.Bar object at 0x7f2b04a127c0>
```
可以看到模块在被调用时仍然产生了输出。当Python文件作为模块导入时，Python会将 **\_\_name\_\_** 设置为模块的名称，而在作为独立脚本时设置为 **\_\_main\_\_** ，因此如果希望在当作模块时不会产生输出可以这样修改 **mod.py**

***mod.py***

```python
s = 'hello world'
def foo(arg):
    print(f'arg = {arg}')

class Bar:
    pass

if __name__ == '__main__':
    print(s)
    foo('bye')
    x = Bar()
    print(x)
```

此时只有程序当作脚本执行时才会 **if \_\_name\_\_ == '\_\_main\_\_'：** 内的语句才会执行

或者也可以不调用整个模块，而只调用其中的某个对象

```python
>>> from mod import foo
>>> foo('Hello Alice')
arg = Hello Alice
```

## 重新加载模块

对于上述文章中第一次编写的 **mod.py** 在被第一次调用时会产生输出语句，但第二次被调用则不会产生。原因是每个解释器只会加载一次模块，如果需要重新加载模块，可以 **重新启动解释器** 或者调用 **importlib** 库中 **reload()** 函数

```python
>>> import mod
hello world
arg = bye
<mod.Bar object at 0x7f234dfe87c0>
>>> import mod
>>> 
>>> import importlib
>>> importlib.reload(mod)
hello world
arg = bye
<mod.Bar object at 0x7f234e0112e0>
<module 'mod' from '/home/hisiao/test/mod.py'>
```

## 包管理

在程序开发中如果使用了许多模块，可以使用包来进行分层和组织。包使用点表示法来对模块进行分层管理

***目录test***

        .
        └── pkg1
            ├── mod1.py
            └── mod2.py



如图所示，在 **pkg1** 文件夹下有两个Python文件

***mod1.py***

```python
def foo():
    print('[mod1] foo()')

class Foo:
    pass
```

***mod2.py***

```python
def bar():
    print('[mod2] bar()')

class Bar:
    pass
```

```python
>>> import mod1
Traceback (most recent call last):
  File "<stdin>", line 1, in <module>
ModuleNotFoundError: No module named 'mod1'
>>> import pkg1.mod1
>>> pkg1.mod1.foo()
[mod1] foo()
>>> from pkg1.mod2 import bar
>>> bar()
[mod2] bar()
```

可以看到在test目录下启动解释器，直接调用 **mod1** 报错，必须加上子文件夹 **pkg1**

## 模块搜索路径

当Python解释器执行 **import** 语句时，它将从以下路径进行搜索：

+ 从运行脚本的目录或者解释器的当前目录(交互模式)
+ **PYTHONPATH** 环境变量中包含的目录列表
+ 安装Python时配置的与安装有关的目录列表

具体的搜索路径可以通过下列指令查看

```python
>>> import sys
>>> sys.path
['', '/usr/lib/python38.zip', '/usr/lib/python3.8', '/usr/lib/python3.8/lib-dynload', '/usr/local/lib/python3.8/dist-packages', '/usr/lib/python3/dist-packages']
```

具体内容因电脑而异。因此如果希望确保找到模块，可以进行下列操作

+ 放入脚本所在的目录，或者当前目录(交互模式)
+ 启动解释器之前修改环境变量以包含模块所在的目录
+ 放入与安装Python有关的目录中，可能存在写入访问权限问题
+ 运行时修改搜索目录

```python
>>> sys.path.append(r'/usr/local') # 此处应为模块的文件位置
>>> sys.path
['', '/usr/lib/python38.zip', '/usr/lib/python3.8', '/usr/lib/python3.8/lib-dynload', '/usr/local/lib/python3.8/dist-packages', '/usr/lib/python3/dist-packages', '/usr/local']
```
这样做在解释器关闭后不会改变原来的环境变量设置

## 包的初始化

我们回到刚才有关包的内容。实际上我们可以直接导入包

```python
>>> import pkg1
>>> pkg1.mod1
Traceback (most recent call last):
  File "<stdin>", line 1, in <module>
AttributeError: module 'pkg1' has no attribute 'mod1'
>>> pkg1.mod1.foo
Traceback (most recent call last):
  File "<stdin>", line 1, in <module>
AttributeError: module 'pkg1' has no attribute 'mod1'
```
如您所见，它报错了。原因是这样做没有将包中的模块放入本地的命名空间，因此需要对包进行初始化

在pkg1目录下创建一个 **\_\_init\_\_.py** 文件

***目录pkg1***

        .
        ├── __init__.py
        ├── mod1.py
        └── mod2.py


***\_\_init\_\_.py***

```python
print(f'Invoking __init__.py for {__name__}')
A = ['quux', 'corge', 'grault']
```

此时 **A** 会被当作 **pkg1** 目录下的全局变量，包中的模块可以通过导入该全局变量来访问

```python
>>> import pkg1
Invoking __init__.py for pkg1
>>> pkg1.A
['quux', 'corge', 'grault']
```

***mod1.py***

```python
def foo():
    from pkg import A
    print('[mod1] foo() / A = ', A)

class Foo:
    pass
```

```python
>>> from pkg1 import mod1
Invoking __init__.py for pkg1
>>> mod1.foo()
[mod1] foo() / A =  ['quux', 'corge', 'grault']
```

***\_\_init\_\_.py***

```python
print(f'Invoking __init__.py for {__name__}')
import pkg1.mod1, pkg1.mod2
```

***mod1.py***

```python
def foo():
    print('[mod1] foo()')
class Foo:
    pass
```

```python
>>> import pkg1
Invoking __init__.py for pkg1
>>> pkg1.mod1.foo()
[mod1] foo()
```

从Python3.3开始， 引入了 **隐式命名空间包** 因此 **\_\_init\_\_.py**可以不手动创建

## 控制包导入的模块

在默认情况下使用 **from pkg import \*** 不会导入任何模块，可以修改**\_\_init\_\_.py** 的 **\_\_all\_\_** 变量来告诉解释器导入哪些模块

***\_\_init\_\_.py***

```python
print(f'Invoking __init__.py for {__name__}')
__all__ = [
        'mod1',
        'mod2',
        'mod3'
        ]
```

***mod3.py***

```python
def baz():
    print('[mod3] baz()')

class Baz:
    pass
```

```python
>>> import pkg1
Invoking __init__.py for pkg1
>>> pkg1.mod1.foo()
Traceback (most recent call last):
  File "<stdin>", line 1, in <module>
AttributeError: module 'pkg1' has no attribute 'mod1'

>>> from pkg1 import *
>>> mod1.foo()
[mod1] foo()
```

如果在模块中定义 **__all__**也可以控制导入的内容

***mod1.py***

```python
__all__ = ['foo']

def foo():
    print('[mod1] foo()')
class Foo:
    pass
```

这样导入受影响
```python
>>> from pkg1.mod1 import *
Invoking __init__.py for pkg1
>>> foo()
[mod1] foo()
>>> Foo()
Traceback (most recent call last):
  File "<stdin>", line 1, in <module>
NameError: name 'Foo' is not defined
>>> x = Foo
Traceback (most recent call last):
  File "<stdin>", line 1, in <module>
NameError: name 'Foo' is not defined
```

但是这样导入不受影响
```python
>>> from pkg1 import *
Invoking __init__.py for pkg1
>>> mod1.foo()
[mod1] foo()
>>> mod1.Foo()
<pkg1.mod1.Foo object at 0x7f03dabeaa60>
```

## 子包

我们将文件目录做如下修改，内容不变

***目录test***

        .
        └── pkg
           ├── subpkg1
           │   ├── mod1.py
           │   └── mod2.py
           └── subpkg2
               └── mod3.py

***mod1.py***

```python
def foo():
    print('[mod1] foo()')
class Foo:
    pass
```

***mod2.py***

```python
from . import mod1

def bar():
    print('[mod2] bar()')

class Bar:
    pass

mod1.foo()
```

***mod3.py***

```python
from pkg.subpkg1.mod1 import foo
foo()
from .. import subpkg1
print(subpkg1)
from ..subpkg1.mod2 import bar
bar()

def baz():
    print('[mod3] baz()')

class Baz:
    pass
```

```python
>>> from pkg.subpkg1 import mod2
[mod1] foo()
>>> from pkg.subpkg2 import mod3
[mod1] foo()
<module 'pkg.subpkg1' (namespace)>
[mod2] bar()
```
总结：

+ **from . import <module_name>** 用于导入同一目录下模块，也可以直接使用 **import <module_name>**
+ **from .. import <module_name>** 用于导入上一级目录下的模块
+  **from ..<package_name> import <module_name>** 用于导入上一目录下其他包里的模块

## 参考资料
[1] John Sturtz:Python Modules and Packages – An Introduction.Apr 17, 2018.https://realpython.com/python-modules-packages/#the-module-search-path

[2] 李轶凡:Python Basic. 2023年清华酒井科协暑期培训. July 18, 2023

[3] 门书生:Python中import的用法.July 12, 2021.https://zhuanlan.zhihu.com/p/63143493
