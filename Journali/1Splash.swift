//
//  Splash.swift
//  Journali
//
//  Created by Norah Masoud Aloqayli on 26/04/1447 AH.
//
import SwiftUI

struct Splash: View {
    var body: some View {
        ZStack {
            Color("BackgroundColor")
                .ignoresSafeArea(edges: .all)
            VStack {
                Image("Logo")
                    .resizable()
                    .frame(width: 77.7, height: 101)
                    .padding()
                Text("Journali")
                    .font(.system(size: 42, weight: .black))
                    .foregroundColor(Color("FontColor"))
            }
        }
    }
}
#Preview {
    Splash()
}
