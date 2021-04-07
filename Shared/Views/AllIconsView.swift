//
//  AllIconsView.swift
//  SFSymbolFinder
//
//  Created by Lonnie on 2021/4/8.
//

import SwiftUI

struct AllIconsView: View {
    
    let model: AppModel
    
    var body: some View {
        let columnCount = 8
        let columns: [GridItem] =
            Array(repeating: .init(.fixed(30), spacing: 8), count: columnCount)
        ScrollView {
            LazyVGrid(columns: columns) {
                ForEach(model.filtered) { icon in
                    model.image(for: icon).foregroundColor(model.tintColor).padding(4)
                }
            }
        }.navigationTitle("All Symbols")
    }
}

struct AllIconsView_Previews: PreviewProvider {
    static var previews: some View {
        AllIconsView(model: AppModel.shared)
    }
}
