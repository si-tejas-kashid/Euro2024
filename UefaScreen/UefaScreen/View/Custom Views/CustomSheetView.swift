//
//  CustomSheetView.swift
//  UefaScreen
//
//  Created by Tejas Kashid on 01/07/24.
//

import SwiftUI

struct ContentsView: View {
    @State private var showSheet = false

    var body: some View {
        ZStack {
            VStack {
                Button(action: {
                    showSheet.toggle()
                }) {
                    Text("Show Sheet")
                        .padding()
                        .background(Color.blue)
                        .foregroundColor(.white)
                        .cornerRadius(8)
                }
            }
            .blur(radius: showSheet ? 3 : 0)
            .disabled(showSheet)

            if showSheet {
                Color.black.opacity(0.5)
                    .edgesIgnoringSafeArea(.all)
                    .onTapGesture {
                        showSheet.toggle()
                    }
                
                CustomSheetView(showSheet: $showSheet)
                    .transition(.move(edge: .bottom))
                    .animation(.easeInOut)
            }
        }
        .sheet(isPresented: $showSheet) {
            CustomSheetView(showSheet: $showSheet)
        }
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentsView()
    }
}


struct CustomSheetView: View {
    @Binding var showSheet: Bool

    var body: some View {
        VStack {
            Spacer()
            
            VStack {
                Text("This is the sheet content")
                    .padding()
                
                Button(action: {
                    showSheet.toggle()
                }) {
                    Text("Dismiss")
                        .padding()
                        .background(Color.blue)
                        .foregroundColor(.white)
                        .cornerRadius(8)
                }
            }
            .background(Color.white)
            .cornerRadius(15)
            .shadow(radius: 10)
        }
        .edgesIgnoringSafeArea(.bottom)
    }
}

//struct CustomSheetView_Previews: PreviewProvider {
//    @State static var showSheet = true
//
//    static var previews: some View {
//        CustomSheetView(showSheet: $showSheet)
//    }
//}
