//
//  SFSymbolFinderApp.swift
//  Shared
//
//  Created by Lonnie on 2021/3/31.
//

import SwiftUI
import Combine
class AppModel: ObservableObject {
    
    var names: [Icon] = []
    
    var stores: [String: Image] = [:]
    
    @Published var filtered: [Icon] = []
    
    @AppStorage("showStarItem") var showStarItem = false
    
    @CodableAppStorage("starItems") var starItems: [String]?
    
    var tintColor: Color = .black
    
    static var shared = AppModel()
    
    init() {
        self.load()
    }
    
    func load() {
        //let task = URLSession.shared.dataTaskPublisher(for: URL(string: "https://www.baidu.com")!).receive(subscriber: <#T##Subscriber#>)
        DispatchQueue.global().async {
            if let url = Bundle.main.path(forResource: "icons", ofType: "txt") {
                let starSet = Set(self.starItems ?? [])
                self.names = try! String(contentsOf: URL(fileURLWithPath: url))
                    .components(separatedBy: .newlines)
                    .filter{ !$0.isEmpty }
                    .map { Icon(name: $0, star: starSet.contains($0)) }
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
    
    func image(for icon: Icon) -> Image {
        if stores[icon.name] == nil {
            stores[icon.name] = Image(systemName: icon.name)
        }
        return stores[icon.name]!
    }
    
    func save(_ icon: Icon) {
        var starSet = Set(self.starItems ?? [])
        if icon.star {
            starSet.insert(icon.id)
        } else {
            starSet.remove(icon.id)
        }
        self.starItems = Array(starSet)
        if let index = filtered.firstIndex(where: {$0.name == icon.name }) {
            filtered[index] = icon
        }
        if let index = names.firstIndex(where: {$0.name == icon.name }) {
            names[index] = icon
        }
    }
    
}
