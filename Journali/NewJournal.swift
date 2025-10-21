//
//  NewJournal.swift
//  Journali
//
//  Created by Norah Masoud Aloqayli on 26/04/1447 AH.
//
import SwiftUI

struct AddJournal: View {
    @ObservedObject var viewModel = JournalViewModel()
    @State private var title = ""
    @State private var content = ""
    @State var newJournals: Journal?
    @Environment(\.dismiss) var dismiss
    
    var body: some View {
        ZStack {
            Color("SheetColor")
                .ignoresSafeArea(edges: .all)
            VStack {
                Image(systemName: "minus")
                    .foregroundStyle(Color("ButtonColor"))
                    .frame(width: 183, height: 6)
                    
                HStack {
                    ZStack {
                        Capsule()
                            .frame(width: 44, height: 44) .cornerRadius(100)
                            .foregroundStyle(Color("GlassColor"))
                            .glassEffect()
                        Button {
                            
                        }label: {
                            Image(systemName: "xmark")
                                .foregroundColor(Color("IconColor"))
                                .font(.system(size: 18.64, weight: .medium, design: .default))
                                .padding()
                        }
                    }
                    .padding()
                    Spacer()
                    
                    ZStack {
                        Capsule()
                            .frame(width: 44, height: 44) .cornerRadius(100)
                            .foregroundStyle(Color("BottunColor2"))
                            .glassEffect()
                        Button {
                            
                        }label: {
                            Image(systemName: "checkmark")
                                .foregroundColor(Color("IconColor"))
                                .font(.system(size: 18.64, weight: .medium, design: .default))
                                .padding()
                        }
                    
                    }
                    .padding()
                   
                }
                TextField("Title", text: $title)
                    .font(.system(size: 34, weight: .bold, design: .default))
                    .foregroundStyle(Color("TextLabel"))
                    .padding()
                Text("\(viewModel.currentDateString)")
                    .font(.system(size: 15, weight: .regular, design: .default))
                    .foregroundColor(.gray)
                TextField("Type your journal...", text: $content)
                    .font(.system(size: 20, weight: .regular, design: .default))
                    .foregroundStyle(Color("TextLabel"))
                    .padding()
                
            }
        }
    }
}
#Preview {
    AddJournal()
 }
