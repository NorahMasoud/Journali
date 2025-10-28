//
//  Splash.swift
//  Journali
//
//  Created by Norah Masoud Aloqayli on 26/04/1447 AH.
//
import SwiftUI

struct Splash: View {
    @State private var isActive = false
    var body: some View {
        if isActive {
            MainPage()
        } else {
            ZStack {
                LinearGradient(gradient: Gradient(colors:[Color("Back1"), Color("Back2")]), startPoint: .top, endPoint: .bottom)
                    .ignoresSafeArea(edges: .all)
                VStack {
                    Image("Logo")
                        .resizable()
                        .frame(width: 77.7, height: 101)
                        .padding()
                    Text("Journali")
                        .foregroundColor(Color("FontColor"))
                        .font(.system(size: 42, weight: .bold, design: .default))
                        .fontWeight(.bold)
                        
                    
                    Text ("Your thoughts, your story")
                        .foregroundColor(Color("FontColor"))
                        .font(.system(size: 18, weight: .regular, design: .default))
                        .fontWeight(.light)
                }
                .onAppear {
                    DispatchQueue.main.asyncAfter(deadline: .now() + 3) {
                        isActive = true
                    }
                }
            }
        }
    }
}
#Preview {
    Splash()
}
