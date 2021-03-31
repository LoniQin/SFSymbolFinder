//
//  SettingView.swift
//  Shared
//
//  Created by Lonnie on 2021/3/31.
//

import SwiftUI
struct SettingView: View {
   
    @EnvironmentObject var model: AppModel
    
    @State var keyword = ""

    var body: some View {
        Form {
            ColorPicker(selection: $model.tintColor) {
                Text("Tint color")
            }
        }
    }

}

struct SettingView_Previews: PreviewProvider {
    static var previews: some View {
        SettingView().environmentObject(AppModel())
    }
}
