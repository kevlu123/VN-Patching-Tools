"""
Copyright (C) 2023 Kevin Lu
Modified from advhd_ws2.py
"""

import glob
import sys

def list_names_choices(ws2_folder):
    names = set()
    options = []
    for inpath in glob.glob(ws2_folder + "/*.ws2"):
        with open(inpath, 'rb') as fp:
            data = bytearray(fp.read())
        
        cur = 0
        while True:
            cur1 = data.find(b'%LC', cur)
            cur2 = data.find(b'%LF', cur)
            if cur1 < 0:
                cur = cur2
            elif cur2 < 0:
                cur = cur1
            else:
                cur = min(cur1, cur2)
            if cur < 0: break
            addr = cur
            size = data.find(b'\x00', addr) - addr
            text = data[addr: addr+size].decode('sjis')
            if not text in names:
                names.add(text)
                print(f"Name: {text[3:]}")
            cur +=  size + 1
        
        cur = 0
        pattern = b'\x0f\x03'
        while len(options) < 3:
            cur = data.find(pattern, cur)
            if cur < 0 or cur + 2 > len(data) -1: break
            cur = cur + len(pattern)
            if data[cur]==0 and data[cur+1]==0: 
                cur += 2
                continue
            while data[cur]!=0xff:
                rawaddr = cur
                addr = cur + 2
                size = data.find(b'\x00', addr) - addr
                text = data[addr: addr+size].decode('sjis')
                rawsize = data.find(b'\x00', addr+size+5)  - rawaddr + 1
                options.append(text)
                if len(options) >= 3:
                    break
                cur += rawsize
            cur += 1
    
    for option in options:
        print(f"Choice: {option}")

if __name__ == "__main__":
    if len(sys.argv) != 2:
        print("Usage: python list_names_choices.py <ws2_folder>")
        exit()
    
    list_names_choices(sys.argv[1])
    