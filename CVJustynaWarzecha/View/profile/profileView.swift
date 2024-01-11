//
//  profileView.swift
//  CVJustynaWarzecha
//
//  Created by Justyna Warzecha on 28/12/2023.
//

import SwiftUI
import WrappingStack

struct profileView: View {
    var aimeArray: [String] = ["🐶 chiens", "🍿 films", "🏔️ randonné", "🎧 musique"]
    //let photoNames = ["photo1", "photo2", "photo3"]
    @State private var offset: CGFloat = 0
    @State private var startOffset: CGFloat = 0
    @State private var leftSwipeIconVisible = false
    @State private var rightSwipeIconVisible = false
    @State private var showLeftModal = false
    @State private var showRightModal = false
    
    var body: some View {
        
        ZStack {
            VStack{
                ScrollView{
                    
                    photos()
                        .frame(width: 390, height: 530)
                    
                    Spacer()
                    VStack(spacing: 20){
                        proposSection(title: "Lieu", fillText: "Grenoble 🇫🇷")
                        proposSection(title: "A propos de moi", fillText: "Hello, je m'appelle Justyna et j'aimerais trouver le travail en tant que développeuse iOS.")
                        //                        .padding(6)
                        //                        .background(.pink.opacity(0.1))
                        //                        .cornerRadius(5)
                        //
                        aimeSection(title: "Ce que j'aime", fillarray: aimeArray)
                        HStack{
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
                            
                            //.frame(width: 150)
                            
                            Button(action: {
                                if let url = URL(string: "https://www.linkedin.com/") {
                                    UIApplication.shared.open(url)
                                }
                            })
                            {
                                Text("Github")
                                    .foregroundColor(.white)
                                    .padding()
                                    .background(Color.black)
                                    .cornerRadius(8)
                            }
                            
                            //.frame(width: 150)
                            Spacer()
                            Spacer()
                        }
                        .padding(.leading)
                    }
                    
                    .padding(9)
                    .background(.white.opacity(0.6))
                    .cornerRadius(8)
                    .overlay(
                        RoundedRectangle(cornerRadius: 8)
                            .stroke(Color.white, lineWidth: 1)
                        
                    )
                    .padding(.bottom)
                    .gesture(
                        DragGesture()
                            .onChanged { value in
                                self.offset = value.translation.width + self.startOffset
                                if value.translation.width < -10 {
                                    self.leftSwipeIconVisible = true
                                    self.rightSwipeIconVisible = false
                                } else if value.translation.width > 10 {
                                    self.rightSwipeIconVisible = true
                                    self.leftSwipeIconVisible = false
                                } else {
                                    self.leftSwipeIconVisible = false
                                    self.rightSwipeIconVisible = false
                                }
                            }
                            .onEnded { value in
                                withAnimation {
                                    if self.offset < -100 {
                                        // Action après un swipe vers la gauche
                                        self.offset = -UIScreen.main.bounds.width
                                        self.startOffset = self.offset
                                        self.leftSwipeIconVisible = false
                                        self.showLeftModal = true
                                    } else if self.offset > 100 {
                                        // Action après un swipe vers la droite
                                        self.offset = UIScreen.main.bounds.width
                                        self.startOffset = self.offset
                                        self.rightSwipeIconVisible = false
                                        self.showRightModal = true
                                    } else {
                                        self.offset = 0
                                        self.startOffset = 0
                                        self.leftSwipeIconVisible = false
                                        self.rightSwipeIconVisible = false
                                    }
                                }
                            }
                    )
                    
                    
                    
                }
                .background(.bgTab)
                .cornerRadius(15)
                
            }
            .navigationBarBackButtonHidden(true)
            .offset(x: offset)
            
            
            // Ajout d'icônes pour indiquer le swipe
            if leftSwipeIconVisible {
                Image(systemName: "heart.fill")
                    .font(.system(size: 40))
                    .foregroundColor(.red)
                    .offset(x: -50, y: 50)
            }
            
            //                        if rightSwipeIconVisible {
            //                           Text("X")
            //                                .font(.system(size: 40))
            //                                .foregroundColor(.blue)
            //                                .offset(x: 50, y: 50)
            //                        }
        }
        .sheet(isPresented: $showLeftModal) {
            // Vue présentée après un swipe vers la gauche
            test(offset1: $offset)
        }
        //                    .sheet(isPresented: $showRightModal) {
        //                        // Vue présentée après un swipe vers la droite
        //                        droitVue(offset: $offset)
        //
        //        }
    }
}

#Preview {
    profileView()
}

struct proposSection: View {
    var title: String
    var fillText: String
    var body: some View {
        VStack (alignment: .leading){
            Text(title)
                .bold()
                .font(.title3)
                .shadow(radius: 20)
            Text(fillText)
                .shadow(radius: 20)
        }
        .frame(width: 290, alignment: .leading)
        .padding(.trailing, 50)
    }
}

struct aimeSection: View {
    var title: String
    var fillarray: [String]
    var body: some View {
        VStack (alignment: .leading){
            Text(title)
                .bold()
                .font(.title3)
                .padding(.bottom,4)
            
            WrappingHStack(id: \.self, alignment: .leading){
                ForEach(fillarray, id: \.self){elementArray in
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
            .frame(width: 300, alignment: .leading)
            .padding(.trailing, 50)
            .padding(.bottom, 15)
        }
    }
}




struct photos: View {
    private let images = ["mePhoto2", "montagne", "lala"]
    var body: some View {
        TabView {
            ForEach(images, id: \.self) { item in
                ZStack{
                    Image(item)
                        .resizable()
                        .aspectRatio(contentMode: .fit)
                        .frame(width: 390, height: 600)
                        .cornerRadius(20)
                    
                    VStack(alignment: .leading) {
                        Text("Justyna, 30 ans")
                            .bold()
                            .font(/*@START_MENU_TOKEN@*/.title/*@END_MENU_TOKEN@*/)
                        HStack{
                            Text("Developpeuse iOS")
                            Image(systemName: "apple.logo").padding(.bottom, 2)
                        }
                        .padding(.bottom, 15)
                    }
                    .padding(.top, 440)
                    .padding(.trailing, 140)
                    .padding(.bottom)
                    .foregroundColor(.white)
                }
            }
        }
        .tabViewStyle(PageTabViewStyle())
    }
}
