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
    
    @State var tintColor: Color = .black

    var body: some View {
        List {
            TextField("Keyword", text: self.$keyword, onCommit: {
                model.filter(self.keyword)
            })
            ForEach(model.filtered) { icon in
                HStack {
                    Image(systemName: icon.name).foregroundColor(tintColor)
                    Spacer()
                    Text(icon.name).foregroundColor(tintColor)
                }
            }
        }
        .navigationTitle("SF icons")
        .navigationBarItems(trailing:
                                NavigationLink(
                                    destination:  SettingView(),
                                        label: {
                                            Image(systemName: "gearshape")
                                        }
                                )
        ).onAppear {
            tintColor = model.tintColor
        }
    }

}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView().environmentObject(AppModel())
    }
}
