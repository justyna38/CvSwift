//
//  experienceView3.swift
//  CVJustynaWarzecha
//
//  Created by Justyna Warzecha on 05/01/2024.
//
struct Formations {
    var id = UUID()
    let image: String
    let nom: String
    let fonction: String
    var descriptif: [String]
    let anneeStart: String
    let anneeEnd: String
    let duree: String
    let stack: [String]
}

import SwiftUI
import WrappingStack

struct experienceView3: View {
    let formationArray: [String] = ["OnlineformaPro","Lp Smin","Apple foundation program"]
    let formation: [Formations] = [Formations(image: "nec", nom: "New Energie Concept", fonction: "Développeuse apprenti", descriptif: ["Participation dans le développement d'une application web", "La mainteanance et création des logiciels internes à l'entreprise"],  anneeStart: "septembre 2022", anneeEnd: "août 2023", duree: "1 an", stack: ["HTML", "CSS", "JavaScript", "PowerShell", "C#"]), Formations(image: "solti", nom: "Solti", fonction: "Développeuse front-end", descriptif: ["La mise à jour du desing de site web"], anneeStart: "mars 2022", anneeEnd: "avril 2022", duree: "1 mois", stack: ["HTML","CSS", "JavaScript"])]
    var body: some View {
        ZStack{
            Color(.bgTab)
            
            ScrollView{
                ExtractedView(formation: formation)
                
            }
        }
        .cornerRadius(15)
        
    }
}
#Preview {
    experienceView3()
}



struct ExtractedView: View {
    let formation: [Formations]
    var body: some View {
        VStack{
            
            ForEach(formation.indices, id: \.self){ index in
                let metier = formation[index]
                
                VStack(alignment: .leading){
                  
                    HStack {
                        Image(metier.image)
                                .resizable()
                                .aspectRatio(contentMode: .fit)
                                .frame(width: 60, height: 90)
                                .clipShape(Circle())
                                .padding(6)
                            .overlay(Circle().stroke(.bgTab, lineWidth: 2))
                        Text("\(metier.anneeStart) - \(metier.anneeEnd)")
                            .font(.title3)
                            .foregroundStyle(.black)
                        
                    }
                    Text(metier.nom)
                            .font(.title)
                            .bold()

                            //.foregroundStyle(.pink)
                    
                    
                    
                    Text(metier.fonction)
                        .font(.title2)
                        .bold()
                

                    
                  
                    ForEach(metier.descriptif, id: \.self){elementArray in
                        VStack(alignment: .leading){
                            HStack{
                                Circle()
                                    .frame(width: 10)
                                    .foregroundStyle(.pink.opacity(0.5))
                                Text(elementArray)
                                    .font(.title3)
                            }
                        }
                        .padding(.bottom)
                    }
                       // .foregroundStyle(.pink)
                   
                    WrappingHStack(id: \.self, alignment: .leading){
                        ForEach(metier.stack, id: \.self){elementArray in
                            Button(action: /*@START_MENU_TOKEN@*/{}/*@END_MENU_TOKEN@*/, label: {
                                Text(elementArray)
                                    .padding(5)
                                    .foregroundColor(.black)
                            })
                            .background(.bgTab)
                            .cornerRadius(6)
                            .padding(4)
                            
                        }
                        
                        
                        
                    }
                    .frame(width: 310, alignment: .leading)
                    .padding(.trailing, 50)
                    .padding(.bottom, 15)
                    
                }
                
                
                .padding(7)
                .frame(width: 350, alignment: .leading)
                .background(.white.opacity(0.6))
                .cornerRadius(8)
                .overlay(
                    RoundedRectangle(cornerRadius: 8)
                        .stroke(Color.white, lineWidth: 1)
                    )
                .padding()
                
                //.border(.blue)
            }
        }
        .navigationTitle("Experience")
        .padding(.top, 50)
        
    }
}
