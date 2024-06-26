//
//  GeometryReaderPract.swift
//  UefaScreen
//
//  Created by Tejas Kashid on 13/06/24.
//

import SwiftUI

struct GeometryReaderPract: View {
    var body: some View {
        ScrollView(.vertical) {
            VStack {
                ScrollView(.horizontal) {
                    HStack {
                        Text("Item 1")
                        Text("Item 2")
                        Text("Item 3")
                    }
                    .background(Color.gray)
                    .padding(.horizontal) // Padding for the HStack
                }

                VStack {
                    ForEach(0..<10) { index in
                        Text("Item \(index)")
                    }
                    .background(Color.gray)
                    .padding(.horizontal,20) // Padding for the VStack
                }
            }
        }
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        GeometryReaderPract()
    }
}
