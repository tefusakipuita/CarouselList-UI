//
//  CardView.swift
//  Carousel List
//
//  Created by 中筋淳朗 on 2020/11/11.
//

import SwiftUI

struct CardView: View {
    
    // MARK: - Property
    
    var screen = UIScreen.main.bounds
    var cardWidth: CGFloat
    var borderWidth: CGFloat
    var borderHeight: CGFloat
    
    var card: Card
    
    
    // MARK: - Body
    
    var body: some View {
        ZStack {
            
            // MARK: - Border
            LinearGradient(gradient: Gradient(colors: [Color.black.opacity(0.6), Color.gray]), startPoint: .topLeading, endPoint: .bottomTrailing)
                .frame(width: borderWidth, height: borderHeight)
                .cornerRadius(40)
            
            // MARK: - Card
            VStack (spacing: 0) {
                Image(card.imageName)
                    .resizable()
                    .scaledToFill()
                    .frame(width: cardWidth, height: 320)
                    .clipped()
                Text(card.name)
                    .fontWeight(.bold)
                    .foregroundColor(Color.black.opacity(0.7))
//                    .padding(.leading)
                    .frame(width: cardWidth)
                    .padding(.vertical, 13)
                    .background(
                        LinearGradient(gradient: Gradient(colors: [Color("Color1"), Color("Color2")]), startPoint: .topLeading, endPoint: .bottomTrailing)
                    )
            } //: VStack
            .cornerRadius(40)
            .shadow(color: Color.black.opacity(0.4), radius: 10, x: 10, y: 10)
        } //: ZStack
    }
}

// MARK: - Preview

struct CardView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
