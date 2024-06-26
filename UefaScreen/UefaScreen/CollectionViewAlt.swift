//
//  CollectionViewAlt.swift
//  UefaScreen
//
//  Created by Tejas Kashid on 03/06/24.
//
import SwiftUI

struct CollectionViewAlt: View {
    let items = Array(1...20)
    let rows = [
        GridItem(.flexible()),
//        GridItem(.flexible()),
//        GridItem(.flexible())
    ]

    var body: some View {
        NavigationView {
            ScrollView(.horizontal) {
                LazyHGrid(rows: rows, spacing: 20) {
                    ForEach(items, id: \.self) { item in
                        VStack {
                            Text("Item \(item)")
                                .font(.headline)
                                .padding()
                                .background(Color.blue)
                                .foregroundColor(.white)
                                .cornerRadius(8)
                        }
                    }
                }
                .padding()
            }
            .navigationTitle("Horizontal Grid")
            .onAppear {
                // Customize navigation bar title appearance
                let appearance = UINavigationBarAppearance()
                appearance.titleTextAttributes = [.foregroundColor: UIColor.red]
                
                UINavigationBar.appearance().standardAppearance = appearance
                UINavigationBar.appearance().compactAppearance = appearance
                UINavigationBar.appearance().scrollEdgeAppearance = appearance
            }
        }
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        CollectionViewAlt()
    }
}
