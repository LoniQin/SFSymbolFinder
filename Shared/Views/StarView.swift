//
//  StarView.swift
//  SFSymbolFinder
//
//  Created by Lonnie on 2021/4/10.
//

import SwiftUI

struct StarView: View {
    
    let star: Bool
    
    var body: some View {
        Image(systemName: star ? "star.fill" : "star")
    }
}

struct StarView_Previews: PreviewProvider {
    
    static var previews: some View {
        VStack {
            StarView(star: true)
            StarView(star: false)
        }
    }
    
}
