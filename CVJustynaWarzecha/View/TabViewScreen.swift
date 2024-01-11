//
//  TabViewScreen.swift
//  CVJustynaWarzecha
//
//  Created by Justyna Warzecha on 06/01/2024.
//

import SwiftUI

struct TabViewScreen: View {
    var body: some View {
        VStack{
            HStack{
                Image("r")
                    .resizable()
                    .aspectRatio(contentMode: .fit)
                    .frame(width: 150)
            }
            TabView{
                profileView()
                    .tabItem {
                        Label("About me", systemImage: "person")
                    }
                    .padding()
                experienceView3()
                    .tabItem {
                        Label("Experience", systemImage: "suitcase")
                    }
                    .padding()
                CarouselView()
                    .tabItem {
                        Label("Formations", systemImage: "graduationcap")
                            .padding()
                    }
            }
            .tint(.pink.opacity(0.7))
            
                    .onAppear() {
                     UITabBar.appearance().backgroundColor = .white
                        //UITableView.appearance().layer.cornerRadius = 14
                    }
        }
    }
}

#Preview {
    TabViewScreen()
}
