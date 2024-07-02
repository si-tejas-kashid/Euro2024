//
//  DragTrial.swift
//  UefaScreen
//
//  Created by Tejas Kashid on 02/07/24.
//

import SwiftUI

struct DragTrial: View {
    @State var viewState = CGSize.zero

    var body: some View {
        RoundedRectangle(cornerRadius: 30)
            .fill(Color.blue)
            .frame(width: 300, height: 400)
            .offset(x: viewState.width, y: viewState.height)
            .gesture(
                DragGesture().onChanged { value in
                    viewState = value.translation
                }
                .onEnded { value in
                    withAnimation(.spring()) {
                        viewState = .zero
                    }
                }
            )
    }
}

#Preview {
    DragTrial()
}
