//
//  Cancelpop.swift
//  Journali
//
//  Created by Norah Masoud Aloqayli on 30/04/1447 AH.
//@ObservedObject var viewModel = JournalViewModel() هنا انا كتبت كود المودل بذي الطريقه طلع انها تسوي نسخه جديده عن حقت الصفحه الرئيسيه
import SwiftUI

struct Cancelpop: View {
    @ObservedObject var viewModel: JournalViewModel
    @Binding var showCancel : Bool
    var dismiss: DismissAction
    var body: some View {
        ZStack {
            VStack {
                Text("Are you sure you want to discard changes on this journal?")
                    .font(Font.system(size: 17))
                    .foregroundColor(Color("ButtonColor"))
                    .padding()
    
                Button(action: {
                    showCancel = false // يخفي البوب اب
                    dismiss()// يقفل الشييت كامل
                }) {
                    Text("Discard Changes")
                        .font(.system(size: 17))
                        .foregroundColor(.red)
                        .frame(width: 272 , height: 48)
                        .background(Color("ButtonCancel").opacity(24))
                        .cornerRadius(25)
                }
                .padding(.bottom, 0)
                Button(action: {
                    showCancel = false // يقفل البوب اب بسص الشييت يقعد
                }) {
                    Text("Keep Editing")
                        .font(.system(size: 17))
                        .foregroundColor(.white)
                        .frame(width: 272 , height: 48)
                        .background(Color("ButtonCancel").opacity(24))
                        .cornerRadius(25)
                }
            }
            
        }
        
        .frame(width: 300, height: 212)
        .glassEffect(.regular.tint(Color.black.opacity(60)), in: RoundedRectangle(cornerRadius: 25))
        .foregroundColor(.black)
    }
}
