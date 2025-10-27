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
                    .font(.system(size: 34, weight: .bold, design: .default))
                    .foregroundColor(title.isEmpty ? Color.gray : Color.white)
                    .padding()
                Text("\(viewModel.currentDateString)")
                    .font(.system(size: 15, weight: .regular, design: .default))
                    .foregroundColor(.gray)
                    .frame(maxWidth: .infinity, alignment: .leading)
                    .padding()
                TextField("Type your journal...", text: $content)
                    .font(.system(size: 20, weight: .regular, design: .default))
                    .foregroundColor(title.isEmpty ? Color.gray : Color.white)
                    .padding()
                Spacer()
                
            }
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
/* if showCancel {
      ZStack {
       Image("Square")
             .padding()
             .frame(width: 310, height: 200)
             .cornerRadius(20)
             .clipShape(RoundedRectangle(cornerRadius: 25))
             .cornerRadius(34)
             .glassEffect(.regular.tint(Color.black.opacity(0.1)), in: RoundedRectangle(cornerRadius: 25))
             .transition(.scale)
           VStack{
               Text("Are you sure you want to discard changes on this journal?")
                   .font(.system(size: 17, weight: .regular))
                   .foregroundColor(.gray)
               Button {
                   withAnimation(.spring()) {
                       showCancel = false
                          dismiss()
                      }
               } label: {
                   Text("Discard Changes")
                       .font(.system(size: 16, weight: .semibold))
                       .foregroundColor(.red)
                       .frame(maxWidth: .infinity)
                       .padding()
                       .background(.ultraThinMaterial)
                       .clipShape(RoundedRectangle(cornerRadius: 12))
               }
               
               Button {
                   withAnimation(.spring()) {
                       showCancel = false
                   }
               } label: {
                   Text("Keep Editing")
                       .font(.system(size: 16, weight: .semibold))
                       .foregroundColor(.white)
                       .frame(maxWidth: .infinity)
                       .padding()
                       .background(.ultraThinMaterial)
                       .clipShape(RoundedRectangle(cornerRadius: 12))
               }
           }
       }
   }*/

