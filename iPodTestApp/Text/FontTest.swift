//
//  SellMeView.swift
//  iPodTestApp
//
//  Created by TJ Littlejohn on 7/5/21.
//

import Foundation
import SwiftUI

struct FontTestView: View {
    var body: some View {
        Text("Hello, World!")
            .font(.custom("Chicago", size: 25))
        
    }
}

struct FontTestView_Preview: PreviewProvider {
    static var previews: some View {
        Group {
            FontTestView()
        }
    }
}
