//
//  EditJournal.swift
//  Journali
//
//  Created by Norah Masoud Aloqayli on 26/04/1447 AH.
//

import SwiftUI

struct DeleteJournal<Content: View>: View {
    var onDelete: () -> Void
    @ViewBuilder var content: () -> Content
    
    @State private var offset: CGFloat = 0
    @GestureState private var drag: CGFloat = 0
    private let maxReveal: CGFloat = 90
    private let trigger: CGFloat = 40
    @State private var showDeletePopup = false
    
    var body: some View {
        ZStack {
            ZStack(alignment: .trailing) {
                
                // زر الحذف خلف الكارد
                Button {
                    withAnimation(.spring(response: 0.25, dampingFraction: 0.9)) {
                        offset = 0
                        showDeletePopup = true
                    }
                } label: {
                    Circle()
                        .fill(Color.red)
                        .frame(width: 48, height: 48)
                        .overlay(
                            Image(systemName: "trash")
                                .font(.headline)
                                .foregroundColor(.white)
                        )
                        .shadow(color: .black.opacity(0.25), radius: 8, x: 0, y: 4)
                }
                .padding(.trailing, 24)
                .opacity((offset + drag) < -8 ? 1 : 0)
                .scaleEffect((offset + drag) < -8 ? 1 : 0.8)
                
                // الكارد نفسه
                content()
                    .offset(x: offset + drag)
                    .gesture(
                        DragGesture()
                            .updating($drag) { value, state, _ in
                                state = max(-maxReveal, min(0, value.translation.width))
                            }
                            .onEnded { value in
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
           
            if showDeletePopup {
                ZStack {
                    Color.black.opacity(0.4)
                        .ignoresSafeArea()
                        .onTapGesture {
                            withAnimation {
                                showDeletePopup = false
                            }
                        }
                    
                    VStack(alignment: .leading, spacing: 16) {
                        Text("Delete Journal?")
                            .font(.system(size: 18, weight: .semibold))
                            .foregroundColor(.white)
                        
                        Text("Are you sure you want to delete this journal?")
                            .font(.system(size: 14))
                            .foregroundColor(.gray)
                            .padding(.horizontal)
                        
                        HStack(spacing: 12) {
                            Button {
                                withAnimation { showDeletePopup = false }
                            } label: {
                                Text("Cancel")
                                    .font(.system(size: 17))
                                    .frame(maxWidth: .infinity, minHeight: 44)
                                    .background(Color.white.opacity(0.1))
                                    .cornerRadius(25)
                                    .foregroundColor(.white)
                            }
                            
                            Button {
                                withAnimation {
                                    showDeletePopup = false
                                }
                                onDelete()
                            } label: {
                                Text("Delete")
                                    .font(.system(size: 17))
                                    .frame(maxWidth: .infinity, minHeight: 44)
                                    .background(Color.red)
                                    .cornerRadius(25)
                                    .foregroundColor(.white)
                            }
                        }
                    }
                    .padding()
                    .frame(width: 300)
                    .background(Color.black.opacity(0.8))
                    .cornerRadius(20)
                    .shadow(radius: 20)
                    .transition(.scale)
                }
                .zIndex(2)
            }
        }
    }
}
