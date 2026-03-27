#!/usr/bin/env python3
# 课堂练习，把 csv 转成 HDF5

import numpy as np

import itertools as it
meta = {}
with open("C3--Trace--99996.txt") as metadata:
    l = next(metadata).strip() # 读第一行
    meta["model"], meta["model_param"], ds_name = l.split(",")
    l = next(metadata).strip() # 读第二行
    _, _, _, ds_length = l.split(",")
    l = next(metadata).strip() # 读第三行
    l = next(metadata).strip() # 读第四行
    _, meta["TrigTime"], _ = l.split(",")
    l = next(metadata).strip() # 读第五行
    headers = l.split(",")
    
lecroy = np.loadtxt("C3--Trace--99996.txt", skiprows=5, delimiter=",")
ds_type = [ (h, 'f8') for h in headers]
ds = np.empty(int(ds_length), dtype=ds_type)
for i, h in enumerate(headers):
    ds[h] = lecroy[:, i]

with h5py.File("C3--Trace--99996.h5", "w") as opt:
    opt[ds_name] = ds
    for k, v in meta.items():
        opt[ds_name].attrs[k] = v
