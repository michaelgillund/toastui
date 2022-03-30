//
//  Toast.swift
//  ToastNotification
//
//  Created by Michael Gillund on 3/30/22.
//

import SwiftUI

struct Toast: View {
    
    @Environment(\.colorScheme) var colorScheme
    var image: String?
    var title: String
    var subtitle: String?
    
    var body: some View {
        HStack(spacing: 16) {
            if image != nil {
                Image(systemName: image!)
                    .resizable()
                    .scaledToFit()
                    .frame(width: 28, height: 28)
            }
            VStack(alignment: .center) {
                Text(title)
                    .lineLimit(1)
                    .font(.headline)
                
                if subtitle != nil {
                    Text(subtitle!)
                        .lineLimit(1)
                        .font(.subheadline)
                        .foregroundColor(.secondary)
                }
            }
            .padding(image == nil ? .horizontal : .trailing)
        }
        .padding(.horizontal)
        .frame(height: 56)
        .background(Color(colorScheme == .dark ? UIColor.secondarySystemBackground : UIColor.systemBackground))
        .cornerRadius(28)
        .shadow(color: Color(UIColor.black.withAlphaComponent(0.08)), radius: 8, x: 0, y: 4)
    }
}

struct Toast_Previews: PreviewProvider {
    static var previews: some View {
        VStack(spacing: 24) {
            Toast(image: "airpodspro", title: "AirPods Pro", subtitle: "Connected")
            Toast(image: "headphones", title: "AirPods Max", subtitle: "50%")
                .environment(\.colorScheme, .dark)
        }
    }
}
