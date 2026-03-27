#!/usr/bin/env python3

from matplotlib import pyplot as plt
import numpy as np
from scipy.stats import multivariate_normal
from scipy import special
from matplotlib.backends.backend_pdf import PdfPages

plt.plot([1, 2, 3, 4, 3, 2, 1])
plt.savefig("line.pdf") # Windows, GNU/Linux, macOS 尚无 X11 的情形
plt.show() # Windows, GNU/Linux 带 X11 的情形

plt.clf()
plt.plot([1, 2, 3, 4, 3, 2, 1], '.')
plt.savefig("dots.pdf")

plt.clf()
t = np.linspace(-np.pi, np.pi, 100)
C, S = np.cos(t), np.sin(t)
plt.plot(t, C, label="cos")
plt.plot(t, S, label="sin")
plt.legend()
plt.savefig("sin_cos.pdf")

plt.clf()
plt.plot(t, C, 'bo', label='bo')
plt.plot(t + np.pi/5, C, 'g--', label='g--')
plt.plot(t + 2 * np.pi/5, C, 'y<', label='y<')
plt.plot(t + 3 * np.pi/5, C, 'rx', label='rx')
plt.legend()
plt.savefig("cos-variants.pdf")

plt.clf()
plt.figure(figsize=(6, 2.5)) # 单位是 inch
plt.margins(tight=True)
plt.plot(t, S, 'g-')
plt.xlim(t.min() * 1.5, t.max() * 1.5)
plt.xlabel("arc")
plt.ylabel("value")
plt.savefig("sin-axis.pdf")
# 有瑕疵，x 轴的标记在图片之外

plt.clf()
plt.figure(figsize=(10, 4.5))
plt.subplot(1, 2, 1)
plt.plot(t, C)
plt.subplot(1, 2, 2)
plt.plot(t, S)
plt.savefig("side-by-side.pdf")

plt.clf()
plt.figure(figsize=(5, 5))
n = 10240
X = np.random.normal(0, 1, n)
Y = np.random.normal(0, 1, n)
plt.scatter(X, Y, s=0.1, marker="x")
plt.savefig("scatter.pdf")

plt.clf()
plt.figure(figsize=(10, 5))
plt.subplot(1,2,1)
plt.hist(X)
plt.subplot(1,2,2)
plt.hist(X, bins=90)
plt.savefig("normal-hist.pdf")

plt.clf()
img = np.arange(10000).reshape(100, 100)
plt.imshow(img)
plt.colorbar()
plt.savefig("image.pdf")

plt.clf()
x, y = np.mgrid[-1:1:.01, -1:1:.01]
plt.subplot(1,2,1)
plt.imshow(x)
plt.subplot(1,2,2)
plt.imshow(y)
plt.colorbar()
plt.savefig("mgrid.pdf")

pos = np.dstack((x, y))
rv = multivariate_normal(mean=(0, 0), cov=((1, 0.5), (0.5, 0.5)))
prob_density = rv.pdf(pos)
plt.clf()
plt.figure(figsize=(5,5))
plt.contourf(x, y, prob_density)
plt.colorbar()
plt.xlabel("x")
plt.ylabel("y")
plt.savefig("bnormal.pdf")

# 绘制二维向量场
plt.clf()
P, Q = np.mgrid[-1:1:0.0005, -1:1:0.0005] * (2 * np.pi)
dP, dQ = -Q, P
plt.streamplot(Q, P, dQ, dP)
plt.xlabel("Q")
plt.ylabel("P")
plt.savefig("vector-field.pdf")

plt.clf()
dP, dQ = -np.sin(Q), P
plt.streamplot(Q, P, dQ, dP)
plt.xlabel("Q")
plt.ylabel("P")
plt.savefig("aharmonic.pdf")

plt.clf()
plt.figure(figsize=(10, 5))
x = np.linspace(0, 10, 200)
for n in range(5):
    plt.plot(x, special.jv(n, x), label=f"Order {n}")

plt.legend()
plt.savefig("bessel.pdf")

with PdfPages("animation.pdf") as pp:

    x = np.linspace(0, 10, 200)

    for i in range(1, 201):
        plt.clf()
        plt.xlim(0, 10)
        for n in range(5):
            plt.plot(x[:i], special.jv(n, x[:i]), label=f"Order {n}")
        pp.savefig()
