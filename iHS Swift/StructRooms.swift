//
//  StructRooms.swift
//  iHS Swift
//
//  Created by arash on 11/12/16.
//  Copyright © 2016 Ali Zare Sh. All rights reserved.
//

/*
 Arash : model for rooms tableview
 */


import Foundation


struct SectionForRooms {
    var name: String!
    var names: [String]!
    var imageNames : [String]!
    var collapsed: Bool!
    
    init(name : String , names : [String] , imageNames : [String] , collapsed : Bool ) {
        self.name = name
        self.names = names
        self.imageNames = imageNames
        self.collapsed = collapsed
    }

}
