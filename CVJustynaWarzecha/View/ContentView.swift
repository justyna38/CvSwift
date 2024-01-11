//
//  ContentView.swift
//  CVJustynaWarzecha
//
//  Created by Justyna Warzecha on 26/12/2023.
//

import SwiftUI

struct ContentView: View {
    @State private var showLaunchScreen = true

    var body: some View {
                ZStack {
                    if showLaunchScreen {
                        LaunchScreen()
                            .onAppear {
                                DispatchQueue.main.asyncAfter(deadline: .now() + 2) {
                                    withAnimation {
                                        self.showLaunchScreen = false
                                    }
                                }
                            }
                    } else {
                        // Votre vue principale après l'écran de lancement
                       TabViewScreen()
                    }
                }
            }
        }


#Preview {
    ContentView()
}

