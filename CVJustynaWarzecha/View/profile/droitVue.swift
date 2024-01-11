//
//  droitVue.swift
//  CVJustynaWarzecha
//
//  Created by Justyna Warzecha on 05/01/2024.
//

import SwiftUI

struct droitVue: View {
    @Binding var offset3: CGFloat
    @State private var offset4: CGFloat = -UIScreen.main.bounds.width
    @Environment(\.dismiss) var dismiss

        var body: some View {
            VStack{
                HStack{
                    Spacer()
                    Button("X") {
                        self.offset3 = 0
                        dismiss()
                    }
                    .padding()
                    .font(.title)
                    .foregroundColor(.pink)
                }
                Spacer()
                Image("Super ça a matché")
                    .onDisappear {
                        self.offset3 = 0 // Réinitialiser l'offset à zéro lors de la disparition de la vue modale
                    }
                ZStack{
                    Image("o")
                        .resizable()
                        .aspectRatio(contentMode: .fit)
                        .frame(width: 400)
                        .offset(x: offset3)
                        .onAppear {
                            withAnimation(.easeInOut(duration: 1)) {
                                self.offset3 = 0 // Déplace l'élément au centre
                            }
                        }
               
                                    .offset(x: offset3)
                                    .onAppear {
                                        withAnimation(.easeInOut(duration: 2)) {
                                            self.offset4 = 0 // Déplace l'élément vers le centre
                                        }
                                    }
                }
                Spacer()
                
            }
    }
}

#Preview {
    droitVue(offset3: .constant(0))
}
