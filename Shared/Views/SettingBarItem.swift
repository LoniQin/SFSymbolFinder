//
//  SettingBarItem.swift
//  SFSymbolFinder
//
//  Created by Lonnie on 2021/3/31.
//

import SwiftUI

struct SettingBarItem: View {
    var body: some View {
        NavigationLink(
            destination:  SettingView(),
                label: {
                    Image(systemName: "gearshape")
                }
        )
    }
}

struct SettingItem_Previews: PreviewProvider {
    static var previews: some View {
        SettingBarItem()
    }
}
