//
//  Icon.swift
//  SFSymbolFinder
//
//  Created by Lonnie on 2021/3/31.
//

import Foundation

struct Icon: Identifiable {
    
    var id: String { name }
    
    let name: String
    
    var star: Bool
    
    init(name: String, star: Bool = false) {
        self.name = name
        self.star = star
    }
    
}
