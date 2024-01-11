//
//  test.swift
//  CVJustynaWarzecha
//
//  Created by Justyna Warzecha on 05/01/2024.
//

import SwiftUI

struct test: View {
    @Binding var offset1: CGFloat
    @State private var offset2: CGFloat = -UIScreen.main.bounds.width
    @Environment(\.dismiss) var dismiss
    
    var body: some View {
        ZStack{
            VStack{
                HStack{
                    Spacer()
                    Button("X") {
                        self.offset1 = 0
                        dismiss()
                    }
                    .padding()
                    .font(.title)
                    .foregroundColor(.pink)
                }
                Spacer()
            }
           
       
            ZStack {
                VStack(alignment: .leading, spacing: 10){
                Text("Merci beaucoup d'avoir matché mon profil.")
                    .font(.title)
                    .padding()
                    .offset(x: offset1)
                    .onAppear {
                        withAnimation(.easeInOut(duration: 1)) {
                            self.offset1 = 0 // Déplace l'élément au centre
                        }
                    }
                Text("N'hésitez pas à me contacter sur LinkedIn")
                    .font(.title)
                    .padding(.leading)
                    .padding(.trailing)
                    .offset(x: offset1)
                    .onAppear {
                        withAnimation(.easeInOut(duration: 1)) {
                            self.offset1 = 0 // Déplace l'élément au centre
                        }
                    }
                Button(action: {
                    
                    if let url = URL(string: "https://www.linkedin.com/in/justyna-warzecha-721261191/") {
                        UIApplication.shared.open(url)
                    }
                }) {
                    Text("LinkedIn")
                        .foregroundColor(.white)
                        .padding()
                        .background(Color.blue)
                        .cornerRadius(8)
                }
                .padding(.leading)
                .padding(.trailing)
                
                
                .offset(x: offset1)
                .onAppear {
                    withAnimation(.easeInOut(duration: 2)) {
                        self.offset2 = 0 // Déplace l'élément vers le centre
                    }
                }
                .offset(x: offset1)
                .onAppear {
                    withAnimation(.easeInOut(duration: 1)) {
                        self.offset1 = 0 // Déplace l'élément au centre
                    }
                }

            }
            .padding()
            .padding()
            //.background(.bgTab)
        .cornerRadius(15)
            }
        Spacer()
            .frame(width: 200)

        //.padding(.bottom, 300)
       
        }
    }
}


#Preview {
    test(offset1: .constant(0))
}
