//
//  NewJournal.swift
//  Journali
//
//  Created by Norah Masoud Aloqayli on 26/04/1447 AH.
//@ObservedObject var viewModel = JournalViewModel() هنا انا كتبت كود المودل بذي الطريقه طلع انها تسوي نسخه جديده عن حقت الصفحه الرئيسيه

import SwiftUI

struct AddJournal: View {
    @ObservedObject var viewModel: JournalViewModel
    @State private var title = ""
    @State private var content = ""
    @State var newJournals: Journal?
    @Environment(\.dismiss) var dismiss
    @State var showCancel = false
    var existingJournal: Journal?
    
    var body: some View {
        ZStack {
            Color("SheetColor")
                .ignoresSafeArea(edges: .all)
            VStack {
                Image(systemName: "minus")
                    .foregroundStyle(Color("ButtonColor"))
                    .font(.system(size: 50, weight: .medium, design: .default)) //اخترت font عشان مو راضي يضبط معي لما استخدمت frame
                    .padding()
                
                HStack {
                    ZStack {
                        Capsule()
                            .frame(width: 44, height: 44) .cornerRadius(100)
                            .foregroundStyle(Color("GlassColor"))
                            .glassEffect()
                        Button {
                            showCancel = true
                        }label: {
                            Image(systemName: "xmark")
                                .foregroundColor(Color("IconColor"))
                                .font(.system(size: 18.64, weight: .medium, design: .default))
                                .padding()
                        }
                        
                    }
                    //هذا شرط اذا كان شو كانسل اذا جاط ترو يطلع للمستخدم والعكس
                    Spacer()
                    
                    ZStack {
                        Capsule()
                            .frame(width: 44, height: 44) .cornerRadius(100)
                            .foregroundStyle(Color("BottunColor2"))
                            .glassEffect()
                        Button {
                            if let journal = existingJournal {
                                viewModel.updateJournal(journal, newTitle: title, newContent: content)
                            } else {
                                viewModel.addJournal(title: title, content: content)
                            }
                            dismiss()
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
                    .font(.system(size: 34, weight: .bold))
                    .foregroundColor(title.isEmpty ? Color.white : Color.gray)
                    .padding()
                Text("\(viewModel.currentDateString)")
                    .font(.system(size: 15, weight: .regular, design: .default))
                    .foregroundColor(.gray)
                    .frame(maxWidth: .infinity, alignment: .leading)
                    .padding()
                // TextEditor helps to write text in lines
                // ok, we need to user paceholder but the text editor don't support this so this why we use if ..
                
                ZStack(alignment: .topLeading){
                    if content.isEmpty {
                        Text("Type your journal...")
                            .font(.system(size: 20, weight: .regular, design: .default))
                            .foregroundColor(.gray)
                            .padding()
                    }
                    TextEditor(text: $content)
                            .foregroundColor(.white)
                            .font(.system(size: 20))
                            .padding(4)
                            .scrollContentBackground(.hidden) // delete the textEditor background
                            .background(Color.clear)
                   
                    
                }

            }
            Spacer()
            
            if showCancel {
                            Cancelpop(
                                viewModel: viewModel,
                                showCancel: $showCancel,
                                dismiss: dismiss
                            )
                            .transition(.scale)
                            .zIndex(1) // عشان يطلع فوق المحتوى
                        }
        }
        .onAppear {
            if let journal = existingJournal {
                title = journal.journalTitle
                content = journal.journalContent
            }
        }
    }
}
#Preview {
    AddJournal(viewModel: JournalViewModel())
}
