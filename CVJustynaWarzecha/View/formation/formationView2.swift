////
////  formationView2.swift
////  CVJustynaWarzecha
////
////  Created by Justyna Warzecha on 02/01/2024.
////
//
//import SwiftUI
//
//struct formationView2: View {
//    let centerWidth = UIScreen.main.bounds.width/2
//    let centerHeight = UIScreen.main.bounds.height/2
//    
//    @State private var positions: [CGPoint] = []
//    @State private var frameSize: CGSize = .zero
//    
//    private let blurRaduis = 20.0
//    private let alphaThreshold = 0.3
//    private let ballCount = 8
//    
//    
//    let timer = Timer.publish(every: 9, on: .main, in: .common).autoconnect().receive(on: RunLoop.main)
//    init() {
//        self.positions = Array(repeating: .zero, count: ballCount)
//    }
//    
//    
//    var body: some View {
//        ZStack{
//            Color(.red)
//            GeometryReader{ geometry in
//                VStack{
//                    Image("online")
//                        .resizable()
//                        .aspectRatio(contentMode: /*@START_MENU_TOKEN@*/.fill/*@END_MENU_TOKEN@*/)
//                        .frame(maxWidth: geometry.size.width)
//                        .aspectRatio(0.65, contentMode: .fit)
//                        .clipped()
//                        .mask{
//                            Canvas { context, size in
//                                let circles = (0..<ballCount).map{ tag in
//                                    context .resolveSymbol(id: tag)!
//                                    
//                                }
//                                context.addFilter(.alphaThreshold(min: alphaThreshold))
//                                context.addFilter(.blur(radius: blurRaduis))
//                                context.drawLayer {
//                                    context2 in
//                                    circles.forEach {
//                                        circle in
//                                        context2.draw(circle, at: .init(x: size.width/2, y: size.height/2))
//                                    }
//                                }
//                            } symbols: {
//                                ForEach(positions.indices, id: \.self) { id in
//                                    Circle().frame(width: id == 0 ? geometry.size.width - blurRaduis/alphaThreshold : geometry.size.width/2)
//                                        .tag(id)
//                                        .offset(x: id == 0 ? 0 : positions[id].x, y: id == 0 ? 0 : positions[id].y)
//                                    
//                                }
//                                
//                            }
//                        }
//                }
//                .onReceive(timer, perform: { _ in
//                    withAnimation(.easeInOut(duration: 4)) {
//                        positions = positions.map { _ in
//                            randomPosition(in: frameSize, ballSize: .init(width:geometry.size.width / 2, height: geometry.size.height / 2))
//                        }
//                    }
//                })
//                .onAppear{
//                    frameSize = .init(width: geometry.size.width, height: geometry.size.width / 0.65)
//                    self.positions = Array(repeating: .zero, count: ballCount)
//                }
//            }
//          
//        }
//     
//        
//    }
//}
//
//#Preview {
//    formationView2()
//}
//
//func randomPosition(in bounds: CGSize, ballSize: CGSize) -> CGPoint {
//    let xRange = ballSize.width / 2 ...
//    bounds.width - ballSize.width / 2
//    let yRange = ballSize.height / 2 ...
//    bounds.height - ballSize.height / 2
//    
//    let randomX = CGFloat.random(in: xRange)
//    let randomY = CGFloat.random(in: yRange)
//    
//    let center = CGPoint(x: bounds.width / 2, y: bounds.height / 2)
//    
//    let offsetX = randomX - center.x
//    let offsetY = randomY - center.y
//    
//    return CGPoint(x: offsetX, y: offsetY)
//}
//
