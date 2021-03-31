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
            Toggle("Show only staring items", isOn: $showStarItem)
            ForEach(model.filtered.filter({ !self.showStarItem || $0.star })) { icon in
                NavigationLink(
                    destination: IconDetailView(icon: icon).environmentObject(model),
                    label: {
                        HStack {
                            Image(systemName: icon.name).foregroundColor(tintColor)
                            Text(icon.name)
                            Spacer()
                            Image(systemName: icon.star ? "star.fill" : "star").foregroundColor(tintColor)
                        }
                    })
            }
        }
        .navigationTitle("SF icons")
        .navigationBarItems(trailing: NavigationLink(
            destination:  SettingView(),
                label: {
                    Image(systemName: "gearshape")
                }
        ))
        .onAppear {
            tintColor = model.tintColor
        }
    }

}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView().environmentObject(AppModel())
    }
}
