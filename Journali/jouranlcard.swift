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
        VStack(alignment: .leading) {
            HStack {
                Text(journal.journalTitle)
                    .font(.system(size: 24, weight: .some(.bold)))
                    .foregroundColor(Color("FontColor2"))
                Spacer()
                Button{
                    
                } label: {
                    Image(systemName: "bookmark")
                        .foregroundColor(Color("FontColor2"))
                }
            }
            Text(journal.currentDateString) // لازم تكون موجودة في الموديل
                .font(.system(size: 14))
                .foregroundColor(.gray)
                
            Text(journal.journalContent)
                .font(.system(size: 16))
                .foregroundColor(Color("FontColor"))
                .lineLimit(3) // يخلي المحتوى مختصر في الكارد
                .padding(.top, 23)
        }
        .padding()
        .frame(width: 350, height: 227)
        .background(Color("SheetColor"))
        .cornerRadius(30)
    }
}

#Preview {
    JournalCard(journal: Journal(journalTitle: "Test Title", journalContent: "This is a preview of your journal entry."))
}
