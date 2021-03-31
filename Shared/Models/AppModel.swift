//
//  SFSymbolFinderApp.swift
//  Shared
//
//  Created by Lonnie on 2021/3/31.
//

import SwiftUI
class AppModel: ObservableObject {
    
    var names: [Icon] = []
    
    @Published var filtered: [Icon] = []
    
    var tintColor: Color = .black
    
    init() {
        self.load()
    }
    
    func load() {
        DispatchQueue.global().async {
            if let url = Bundle.main.path(forResource: "icons", ofType: "txt") {
                self.names = try! String(contentsOf: URL(fileURLWithPath: url)).components(separatedBy: .newlines).filter{ !$0.isEmpty }.map { Icon(name: $0)}
                self.filtered = self.names
            }
        }
    }
    
    func filter(_ keyword: String) {
        
        let word = keyword.lowercased()
        let date = Date()
        
        defer {
            print("Elapsed:\(Date().timeIntervalSince(date))")
        }
        if keyword.isEmpty {
            self.filtered = self.names
            return
        }
        
        self.filtered = self.names.filter({ (icon) -> Bool in
            icon.name.contains(word)
        })
        
    }
    
}
