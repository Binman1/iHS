//
//  A.swift
//  iHS Swift
//
//  Created by Ali Zare Sh on 11/10/16.
//  Copyright © 2016 Ali Zare Sh. All rights reserved.
//

import Foundation
import UIKit


/* 
    BinMan1 : This file is for All global variables, functions or structors
 */


/// Height of Phone screan
let HEIGHTPHONE = UIScreen.mainScreen().bounds.height

/// Width of Phone screan
let WIDTHPHONE = UIScreen.mainScreen().bounds.width


/// Name of DB
let DBNAME = "iHS15.sqlite"

/// Get DB From db path for all uses 
func GetDBFromPath () -> FMDatabase {
    let path = NSTemporaryDirectory() + "/" + DBNAME
    return FMDatabase(path: path)
}

/// Language ID Selected By User
let SELECTEDLANGID = -1

/// Language ID FOR DB
struct LangID {
    static let ENGLISH = 1
    static let PERSIAN = 2
    static let ARABIC = 3
    static let TURKISH = 4
}


/// Print everything to console logs
func Printer(object : AnyObject) {
    print(object)
}
