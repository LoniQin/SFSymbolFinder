//
//  ContentView.swift
//  Shared
//
//  Created by Lonnie on 2021/3/31.
//

import SwiftUI
struct ContentView: View {
   
    @EnvironmentObject var model: AppModel
    
    @State var keyword = ""
    
    @State var showStarItem = false
    
    @State var tintColor: Color = .black

    var body: some View {
        List {
            TextField("Keyword", text: self.$keyword, onCommit: {
                model.filter(self.keyword)
            })
            ForEach(model.filtered.filter({ !self.showStarItem || $0.star })) { icon in
                NavigationLink(
                    destination: IconDetailView(icon: icon).environmentObject(model),
                    label: {
                        HStack {
                            model.image(for: icon).foregroundColor(tintColor)
                            Text(icon.name)
                            Spacer()
                            StarView(star: icon.star).foregroundColor(tintColor)
                        }
                    })
            }
        }
        .navigationTitle("SF Symbols")
        .navigationBarItems(trailing: SettingBarItem())
        .onAppear {
            tintColor = model.tintColor
            showStarItem = model.showStarItem
        }
    }

}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView().environmentObject(AppModel.shared)
    }
}
