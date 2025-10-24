//
//  jouranlcard.swift
//  Journali
//
//  Created by Norah Masoud Aloqayli on 02/05/1447 AH.
//
import SwiftUI

struct JournalCard: View {
    let journal: Journal

    var body: some View {
        VStack(alignment: .leading, spacing: 8) {
            Text(journal.journalTitle)
                .font(.system(size: 22, weight: .bold))
                .foregroundColor(Color("FontColor"))
            
            Text(journal.currentDateString) // لازم تكون موجودة في الموديل
                .font(.system(size: 14))
                .foregroundColor(.gray)
            
            Text(journal.journalContent)
                .font(.system(size: 16))
                .foregroundColor(Color("FontColor2"))
                .lineLimit(3) // يخلي المحتوى مختصر في الكارد
        }
        .padding()
        .frame(maxWidth: .infinity, alignment: .leading)
        .background(Color("GlassColor"))
        .cornerRadius(16)
        .shadow(radius: 3)
    }
}
