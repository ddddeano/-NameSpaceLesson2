//
//  ContentView.swift
//  MatchedGeometryEffect
//
//  Created by Daniel Watson on 14/01/2021.
//

import SwiftUI

struct ContentView: View {
    @Namespace private var animation
    
    @State private var isZoomed = false
    
    var frame: CGFloat {
        isZoomed ? 300 : 44
    }
    
    var body: some View {
        VStack {
            Spacer()
            VStack{
                HStack {
                    RoundedRectangle(cornerRadius: 20)
                        .fill(Color.blue)
                        .frame(width: frame, height: frame)
                        .padding(.top, isZoomed ? 20 : 0)
                    
                    if isZoomed == false {
                        Text("Hello")
                            .font(.headline)
                            .matchedGeometryEffect(id: "Greeting", in: animation)
                        
                        Spacer()
                    }
                }
                if isZoomed == true {
                    Text("Hello")
                        .font(.headline)
                        .matchedGeometryEffect(id: "Greeting", in: animation)
                        .padding(.bottom, 60)
                    Spacer()
                }
            }
            .onTapGesture {
                withAnimation(.spring()) {
                    self.isZoomed.toggle()
                }
            }
            .padding()
            .frame(maxWidth: .infinity)
            .frame(height: isZoomed ? 400 : 60)
            .background(Color(white: 0.9))
        }
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
