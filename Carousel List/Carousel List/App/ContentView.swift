//
//  ContentView.swift
//  Carousel List
//
//  Created by 中筋淳朗 on 2020/11/11.
//

import SwiftUI

struct ContentView: View {
    
    // MARK: - Property
    
    var screen = UIScreen.main.bounds
    var cardWidth = UIScreen.main.bounds.width - 170
    
    @State var titleAnimation = false
    
    @State var slideX: CGFloat = 0
    @State var count: CGFloat = 0
    
    let maxScale:CGFloat = 1.17
    let maxIndex: CGFloat = 1.22
    
    
    // MARK: - Body
    
    var body: some View {
            ZStack {
                // MARK: - Card Scroll
                ScrollView (.horizontal, showsIndicators: false) {
                    HStack (spacing: 27) {
                        ForEach(cardData) { card in
                            
                            GeometryReader(content: { geometry in
                                
                                // MARK: - Card
                                CardView(cardWidth: cardWidth, borderWidth: cardWidth + 5, borderHeight: 370, card: card)
                                    .scaleEffect(
                                        max(1, //最小値
                                            min(maxScale, //最大値
                                                maxIndex -  // 少しの間1.2でキープできるように
                                                abs( // 1 ~ 1.2 の間は拡大縮小する
                                                    (screen.width / 2
                                                        - geometry.frame(in: .global).midX
                                                    ) / 430 //拡大の緩急と開始地点をコントロール
                                                )
                                                // それぞれのカードの中心のx座標
//                                                geometry.frame(in: .global).midX
                                            ) //: min
                                        ) //: max
                                    ) //: scaleEffect
                            })
                            .frame(width: cardWidth + 5, height: 370)
                        } //: ForEach
                    } //: HStack
                    .padding(.vertical, 130)
                    .padding(.horizontal, screen.width / 2 - cardWidth / 2)
                } //: Scroll
                
                // MARK: - Title
                VStack {
                    Text("Select your first pokemon")
                        .font(.system(size: 28, weight: .regular))
                        .foregroundColor(Color.black.opacity(0.7))
                        .scaleEffect(titleAnimation ? 1.1 : 1)
                        .shadow(color: Color.black.opacity(0.4), radius: 6, x: 4, y: 4)
                        .animation(Animation.easeInOut(duration: 1.2).repeatForever())
                    Spacer()
                }
                .padding(.top, 60)
            } //: ZStack
            
            // MARK: - Background
            .background(
                LinearGradient(gradient: Gradient(colors: [Color("Color1"), Color("Color2")]), startPoint: .topLeading, endPoint: .bottomTrailing)
                    .frame(width: screen.width)
                    .ignoresSafeArea()
            )
            .onAppear(perform: {
                titleAnimation = true
            })
    }
}

// MARK: - Preview

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
