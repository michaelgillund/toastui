//
//  ContentView.swift
//  Shared
//
//  Created by Michael Gillund on 3/30/22.
//

import SwiftUI

struct ContentView: View {
    
    @State var isVisible = false
    
    var body: some View {
        ZStack {
            ZStack(alignment: .top) {
                Rectangle()
                    .foregroundColor(.clear)
                    .edgesIgnoringSafeArea(.all)
                Toast(image: "headphones", title: "AirPods Max", subtitle: "Connected")
                    .offset(y: isVisible ? 0 : -150)
                    .animation(
                        Animation.spring()
                    )
                    .onTapGesture(perform: {
                        self.isVisible.toggle()
                    })
            }
            .padding()
            .onAppear(perform: {
                self.isVisible.toggle()
                DispatchQueue.main.asyncAfter(deadline: .now() + 1.25) {
                    self.isVisible.toggle()
                }
            })
            Toggle("", isOn: $isVisible)
                .labelsHidden()
        }
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
