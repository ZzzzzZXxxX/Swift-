//
//  File.swift
//  16031143201
//
//  Created by 左志新 on 2019/5/11.
//  Copyright © 2019 Zzx. All rights reserved.
//
import UIKit
var n=1543
var s=0
while(n>=3) {
    let temp=n/2
    if(2*temp != n)
    {
        s=s+1
    }
    n=temp
    print(n)
}
print(s)
