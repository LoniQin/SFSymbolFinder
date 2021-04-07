//
//  IconDetailView.swift
//  Shared
//
//  Created by Lonnie on 2021/3/31.
//

import SwiftUI
struct IconDetailView: View {
    
    @EnvironmentObject var model: AppModel
    
    @State var icon: Icon

    var body: some View {
        Form {
            HStack {
                Text("Name:")
                Spacer()
                Text(icon.name).font(.body)
            }
            HStack {
                Text("Image:")
                Spacer()
                Image(systemName: icon.name)
                    .frame(width: 44, height: 44, alignment: /*@START_MENU_TOKEN@*/.center/*@END_MENU_TOKEN@*/)
                    .scaleEffect(2)
                    .foregroundColor(model.tintColor)
            }
        }.navigationBarItems(trailing: Button(action: {
            self.icon.star.toggle()
        }, label: {
            Image(systemName: icon.star ? "star.fill" : "star")
        })).onDisappear {
            if let index = self.model.filtered.firstIndex(where: {$0.name == icon.name }) {
                self.model.filtered[index] = self.icon
            }
            if let index = self.model.names.firstIndex(where: {$0.name == icon.name }) {
                self.model.names[index] = self.icon
            }
        }
    }

}

struct IconDetailView_Previews: PreviewProvider {
    static var previews: some View {
        NavigationView {
            IconDetailView(icon: .init(name: "gearshape")).environmentObject(AppModel.shared)
        }
        
    }
}
