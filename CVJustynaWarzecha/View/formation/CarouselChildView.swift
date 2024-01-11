//
//  CarouselChildView.swift
//  CVJustynaWarzecha
//
//  Created by Justyna Warzecha on 05/01/2024.
//

import SwiftUI

struct CarouselChildView: View, Identifiable {
    var id: Int
    @ViewBuilder var content : any View
    
    var body: some View {
        ZStack {
            AnyView(content)
        }
    }
}

var placeholderCarouselChildViews: [CarouselChildView] = [
    CarouselChildView(id: 1) {
        ZStack {
            VStack(spacing: 30){
                Image("simplon")
                    .resizable()
                    .aspectRatio(contentMode: .fit)
                    .frame(width: 370)
               
            }
        }
    },
    CarouselChildView(id: 2) {
        ZStack {
            VStack(spacing: 30){
                Image("smin")
                    .resizable()
                    .aspectRatio(contentMode: .fit)
                    .frame(width: 370)
            }
        }
    }
    ,
    CarouselChildView(id: 3) {
        ZStack {
            VStack(spacing: 30){
                Image("online")
                    .resizable()
                    .aspectRatio(contentMode: .fit)
                    .frame(width: 370)
                
            }
        }
        
    }
]

#Preview {
    CarouselView()
}
