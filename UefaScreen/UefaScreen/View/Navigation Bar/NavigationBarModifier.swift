//
//  NavigationBarModifier.swift
//  UefaScreen
//
//  Created by Tejas Kashid on 03/06/24.
//

import SwiftUI

struct NavigationBarModifier: ViewModifier {

    var backgroundImage: String?
    var titleColor: UIColor?
    var points: Int?

    init(backgroundImage: String?, titleColor: UIColor?, points: Int?) {
        self.backgroundImage = backgroundImage
        self.points = points

        let coloredAppearance = UINavigationBarAppearance()
        
//        if let imageName = backgroundImage, let image = UIImage(named: imageName) {
//            let navbarImage = image.resizableImage(withCapInsets: .zero, resizingMode: .stretch)
//            coloredAppearance.backgroundImage = navbarImage
//        }
        
        coloredAppearance.backgroundImage = UIImage(named: backgroundImage ?? String())
        
        coloredAppearance.titleTextAttributes = [.foregroundColor: titleColor ?? .white]
        coloredAppearance.largeTitleTextAttributes = [.foregroundColor: titleColor ?? .white]
        coloredAppearance.backgroundColor = UIColor.blue1F3BD0
        coloredAppearance.backgroundImageContentMode = .bottomRight
        
        UINavigationBar.appearance().standardAppearance = coloredAppearance
        UINavigationBar.appearance().scrollEdgeAppearance = coloredAppearance
    }

    func body(content: Content) -> some View {
        ZStack {
            content
            VStack {
                GeometryReader { geometry in
                    Color.clear
                        .frame(height: geometry.safeAreaInsets.top)
                        .edgesIgnoringSafeArea(.top)
                    Spacer()
                }
            }
            .toolbar {
                ToolbarItem(placement: .navigationBarLeading) {
                    Button(action: {
                        // Handle tap
                    }) {
                        Image(systemName: "line.horizontal.3")
                            .accentColor(.white)
                    }
                }
                
                ToolbarItemGroup(placement: .navigationBarTrailing) {
                    HStack {
                        if let points = points {
                            Text("\(points)")
                                .bold()
                                .foregroundColor(.white)
                        }
                        Text("pts")
                            .foregroundColor(.white)
                        Button(action: {
                            // Handle tap
                        }) {
                            Image("three-dots")
                                .resizable()
                                .frame(width: 20, height: 20)
                                .colorInvert()
                        }
                    }
                }
            }
        }
    }
}

extension View {
    func navigationBarStyle(backgroundImage: String?, titleColor: UIColor?, points: Int?) -> some View {
        self.modifier(NavigationBarModifier(backgroundImage: backgroundImage, titleColor: titleColor, points: points))
    }
}

