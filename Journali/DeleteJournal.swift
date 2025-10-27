//
//  EditJournal.swift
//  Journali
//
//  Created by Norah Masoud Aloqayli on 26/04/1447 AH.
//
import SwiftUI


struct DeleteJournal<Content : View>: View{
    var onDelete: () -> Void
        @ViewBuilder var content: () -> Content
    @State private var offset: CGFloat = 0 //يمثل موضع الكارد يعني 0 هو في المكان الطبيعي لو صار بسالب يعني انسحب لليسار
    @GestureState private var drag: CGFloat = 0
    private let maxReveal: CGFloat = 90 //الحد الاقصى للسحب
    private let trigger: CGFloat = 40 //المسافه
    
    var body: some View {
        //هنا حطينا زي ستاك عشان نبي نحط زر الحذف وراء الكارد
        ZStack(alignment: .trailing) {
            Button {
                withAnimation(.spring(response: 0.25, dampingFraction: 0.9)) { offset = 0 }
                onDelete()
            } label: {
                Circle()
                    .fill(Color.red)
                    .frame(width: 48, height: 48)
                    .overlay(Image(systemName: "trash").font(.headline).foregroundColor(.white))
                    .shadow(color: .black.opacity(0.25), radius: 8, x: 0, y: 4)
            }
            .padding(.trailing, 24)
            .opacity((offset + drag) < -8 ? 1 : 0)
            .scaleEffect((offset + drag) < -8 ? 1 : 0.8)
            
            content()
             .offset(x: offset + drag)
             .gesture(
                 DragGesture()
                     .updating($drag) { value, state, _ in
                         // نسحب الكارد لليسار، state تمثل الحركة اللحظية
                         state = max(-maxReveal, min(0, value.translation.width))
                     }
                     .onEnded { value in
                         // بعد رفع اليد، نحدد هل يبقى مفتوح أو يرجع مغلق
                         withAnimation(.spring(response: 0.25, dampingFraction: 0.9)) {
                             offset = value.translation.width < -trigger ? -maxReveal : 0
                         }
                     }
             )
            
             .onTapGesture {
                    if offset != 0 {
                    withAnimation(.spring(response: 0.25, dampingFraction: 0.9)) {
                    offset = 0
                    }
                }
            }
        }
    }
}
/* struct DeleteJournal: View {
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
*/
