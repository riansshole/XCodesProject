//
//  BlueThreeView.swift
//  TabView
//
//  Created by Rian on 26/06/21.
//

import SwiftUI

struct BlueThreeView: View {
    var body: some View {
        ZStack {
            Circle()
                .foregroundColor(.blue)
                .frame(width: 200, height: 200)
            Text("\(3)")
                .font(.system(size: 70, weight: .bold))
                .foregroundColor(.white)
        }
    }
}

struct BlueThreeView_Previews: PreviewProvider {
    static var previews: some View {
        BlueThreeView()
    }
}
