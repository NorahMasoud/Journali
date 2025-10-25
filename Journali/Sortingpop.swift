//
//  Sortingpop.swift
//  Journali
//
//  Created by Norah Masoud Aloqayli on 03/05/1447 AH.
// Also I want on user click on the screen in any place the pop is disapper
import SwiftUI

struct Sortingpop: View {
    @Binding var sortingPop : Bool
    var sortByBookmark: () -> Void //البوب أب يصبح مرن ويقدر يستخدم أي دوال خارجية بدون معرفة التفاصيل الداخلية
        var sortByDate: () -> Void
    var body: some View {
        ZStack {
            //طيب هنا عشان اخلي اليوزر يضغط علي اي مكان في الشاشه وتروح البوب اب
            Color.black.opacity(0.1) // خلفية شفافة
                    .ignoresSafeArea()
                    .onTapGesture {
                        sortingPop = false
                    }
            Image(systemName: "rectangle.fill")
                .resizable()
                .frame(width: 238, height: 109)
                .foregroundColor(.black)
                .cornerRadius(25)
                .glassEffect(.regular.tint(Color.black.opacity(60)), in: RoundedRectangle(cornerRadius: 25))
                
            VStack {
                
                Button(action: {
                    sortByBookmark()
                    sortingPop = false
                }) {
                    Text("Sort by Bookmark")
                        .font(.system(size: 17))
                        .foregroundColor(.white)
                        .padding(5)
                       
                }
                Divider()
                .background(Color.gray)
                .frame(width: 200)
                
                Button(action: {
                    sortByDate()
                    sortingPop = false
                }) {
                    Text("Sort by Entry Date")
                        .font(.system(size: 17))
                        .foregroundColor(.white)
                        .padding(6)
                }
            }
            
        }
        
    }
}

