//
//  EditJournal.swift
//  Journali
//
//  Created by Norah Masoud Aloqayli on 26/04/1447 AH.
//
import SwiftUI

struct DeleteJournal: View {
    @ObservedObject var viewModel: JournalViewModel
    @Binding var journalToDelete: Journal?
    @Binding var showDeletePopup: Bool
    
    var body: some View {
        ZStack {
            VStack {
                Text("Delete Journal")
                    .font(.system(size: 17, weight: .bold, design: .default))
                    .foregroundColor(Color("FontColor"))
                    .padding()
                
                Text("Are you sure you want to delete this journal?")
                    .font(.system(size: 17, weight: .regular, design: .default))
                    .foregroundColor(Color("ButtonColor"))
                    .padding()
                
                HStack {
                    Button(action: {
                        showDeletePopup = false // يخفي البوب اب
                        
                    }) {
                        Text("Cancel")
                            .font(.system(size: 17))
                            .foregroundColor(.red)
                            .frame(width: 272 , height: 48)
                            .background(Color("ButtonCancel").opacity(24))
                            .cornerRadius(25)
                    }
                    .padding(.bottom, 0)
                    Button(action: {
                        if let journal = journalToDelete {
                            viewModel.deleteJournal(journal)
                    }
                        showDeletePopup = false // يقفل البوب اب بسص الشييت يقعد
                        journalToDelete = nil
                    }) {
                        Text("Delete")
                            .font(.system(size: 17))
                            .foregroundColor(.white)
                            .frame(width: 272 , height: 48)
                            .background(Color("Cancel").opacity(24))
                            .cornerRadius(25)
                    }
                }
            }
            
        }
        
        .frame(width: 300, height: 212)
        .glassEffect(.regular.tint(Color.black.opacity(60)), in: RoundedRectangle(cornerRadius: 25))
        .foregroundColor(.black)
    }
}
