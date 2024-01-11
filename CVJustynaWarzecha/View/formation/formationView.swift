////
////  formationView.swift
////  CVJustynaWarzecha
////
////  Created by Justyna Warzecha on 28/12/2023.
////
//
//import SwiftUI
//
//struct Formations {
//    var id = UUID()
//    let nom: String
//    let fonction: String
//    let anneeStart: String
//    let anneeEnd: String
//    let duree: String
//    let stack: [String]
//}
//
//
//struct formationView: View {
//    @State private var frameSize: CGFloat = 200
//    @GestureState private var isTapped: Bool = false
//    let formationArray: [String] = ["OnlineformaPro","Lp Smin","Apple foundation program"]
//    let formation: [Formations] = [Formations(nom: "NEC", fonction: "Développeuse",  anneeStart: "2021", anneeEnd: "2022", duree: "1 an", stack: ["HTML", "CSS", "JavaScript", "PowerShell", "C#"]), Formations(nom: "Solti", fonction: "Développeuse web", anneeStart: "2022", anneeEnd: "2023", duree: "1 mois", stack: ["HTML","CSS", "JavaScriot"])]
//    var body: some View {
//        ZStack{
//            Color(.bgTab)
//            
//                //.ignoresSafeArea()
//            VStack {
////                Text("Experience en dev")
////                    .font(.title)
//               // HStack{
////                    VStack(spacing: 35){
////                        ForEach(formation.indices, id: \.self) { index in
////                            let formationInfo = formation[index]
////                            ZStack{
////                                
////                                Circle()
////                                    .fill(.white)
////                                    .frame(width: 70, height: 70)
////                                    .background(
////                                        Circle()
////                                            .stroke(.pink.opacity(0.3), lineWidth: 1)
////                                            .padding(-3)
////                                    )
////                                VStack{
////                                    Text(formationInfo.duree)
////                                        .bold()
////                                        .font(.title3)
////                                    
////                                }
////                                
////                            }
////                            if index != formation.count - 1 {
////                                Rectangle()
////                                    .fill(Color.black.opacity(0.3))
////                                    .frame(width: 3, height: 90)
////                            }
////                            
////                            
////                        }
////                    }
//                    VStack( spacing: 10){
//                        ForEach(formation.indices, id: \.self){ index in
//                            let metier = formation[index]
//                            VStack(alignment: .leading){
//                                Text(metier.fonction + " chez ") 
//                                    .font(.title2)
//                                    .bold()
//                                +
//                                Text (metier.nom)
//                                    .font(.title2)
//                                    .bold()
//    
//                                    .foregroundStyle(.pink)
//                                Text("\(metier.anneeStart) - \(metier.anneeEnd)")
//                                    .foregroundStyle(.black)
//                                ForEach(metier.stack, id: \.self){ index in
//                                    VStack{
//                                        Text(index)
//                                        
//                                    }
//                                    
//                                }
//                                
//                            }
//                            
//                            
//                            .padding(7)
//                            .frame(maxWidth: .infinity, alignment: .leading)
//                            .background(.white.opacity(0.6))
//                            .cornerRadius(8)
//                            .overlay(
//                                RoundedRectangle(cornerRadius: 8)
//                                    .stroke(Color.white, lineWidth: 1)
//                                )
//                            .padding()
//                            
//                            //.border(.blue)
//                        }
//                    }
//                    
//                    .padding(.top, 70)
//                    .padding(.bottom, 70)
//                    
//                    
//                }
//                .frame(maxWidth: .infinity, alignment: .leading)
//            .padding(.leading)
//            }
//       // }
//    }
//}
//
//#Preview {
//    formationView()
//}
