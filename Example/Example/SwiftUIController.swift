//
//  SwiftUIController.swift
//  Example
//
//  Created by Muis on 09/01/20.
//

import Foundation
import SwiftUI

final class SwiftUIController: UIHostingController<ContentView> {
    static func create() -> SwiftUIController {
        let vc = SwiftUIController(rootView: ContentView())
        vc.view.backgroundColor = .white
        return vc
    }
}

struct ContentView: View {
    var body: some View {
        GeometryReader { g in
            Text("Hello!")
                .foregroundColor(.black)
                .frame(width: g.size.width, height: nil, alignment: .leading)
        }
    }
}
