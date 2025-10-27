//
//  ContentView.swift
//  Journali
//
//  Created by Norah Masoud Aloqayli on 26/04/1447 AH.
//

import SwiftUI

struct MainPage: View {
    @StateObject var viewModel = JournalViewModel()
    @State var sortingPop = false
    @State  var isBookmarked: Bool = false
    @State private var showDeletePopup = false
    @State private var journalToDelete: Journal?

    
    var body: some View {
        NavigationStack {
            ZStack {
                Color("Back2")
                    .ignoresSafeArea(edges: .all)
                VStack {
                    HStack{
                        Text("Journal")
                            .font(.system(size: 34, weight: .bold, design: .default))
                            .foregroundColor(Color("FontColor"))
                        Spacer() //حطيته بين العنطرين عشان كل واحد يروح في جهه
                        ZStack{
                                Capsule()
                                    .frame(width: 104, height: 48) .cornerRadius(24)
                                    .foregroundStyle(Color("GlassColor"))
                                    .glassEffect()
                            HStack{
                                Button {
                                    sortingPop = true
                                } label: {
                                    Image(systemName: "line.3.horizontal.decrease")
                                           .foregroundColor(Color("IconColor"))
                                           .padding()
                                }
                                       
                                Button{ // عشان نخلي علامه الزايد زر نستخدم داله بوتن
                                    viewModel.showNewJournal = true
                                } label: {
                                    Image(systemName: "plus")
                                        .foregroundColor(Color("IconColor"))
                                        .padding()
                                }
                            }
                        } //هنا استخذمنا modifier sheet عشان نعرضها كشييت وبعد سوينا binding لل فيو مودل وحددنا بضبط شو نبو جورنل عشان لما تتغير قيمته تظهر على الفيو

                        .sheet(isPresented: $viewModel.showNewJournal){
                            AddJournal(viewModel: viewModel)
                        } // هنا عشان اظهر محتويات واجهه addjournaal في شاشه المستخدم وربطناها مع الفيو مودل لانه هو المسؤل عن هذا الشي
                        .sheet(isPresented: $viewModel.showEditSheet) {
                            if let selectedJournal = viewModel.selectedJournal {
                                AddJournal(viewModel: viewModel, existingJournal: selectedJournal)
                            }
                        }
                    }
                    Spacer() //حطيت هنا بين عناصر اللي فوق وبين عناصر النص عشان يحط مسافه بينهم
                    
                    
                    if viewModel.journals.isEmpty{
                        Image("EmptyJournal")
                            .resizable()
                            .frame(width: 151.39, height: 97.32)
                            .padding()
                        Text("Begin Your Journal")
                            .font(.system(size: 24, weight: .bold, design: .default))
                            .foregroundColor(Color("FontColor2"))
                            .padding(.bottom, 10)
                        Text("Craft your personal diary, tap the \nplus icon to begin")
                            .font(.system(size: 18, weight: .light, design: .default))
                            .foregroundColor(Color("FontColor"))
                            .multilineTextAlignment(.center)
                    } else {
                        ScrollView {
                            VStack(spacing: 16){
                                ForEach(viewModel.filteredJournals) { journal in
                                    Button {
                                        viewModel.selectedJournal = journal
                                        viewModel.showEditSheet = true
                                    } label: {
                                        JournalCard(viewModel: viewModel,
                                                    journal: journal,
                                                    isBookmarked: journal.isBookmarked
                                        )
                                    }
                                }
                            }
                        }
                    }
                        
                    Spacer() //هنا جطيته بينه وبين عناصر السيرش عشان يعطي مسافه بينهم وبكذه تكون هذي في النص
                    
                    ZStack {
                            Capsule()
                                .frame(width: 351, height: 48) .cornerRadius(24)
                                .foregroundStyle(Color("GlassColor"))
                                .glassEffect()
                        HStack {
                            Image(systemName: "magnifyingglass")
                                .frame(width: 25, height: 22)
                                .foregroundColor(Color("ButtonColor"))
                                .padding()
                            
                            TextField("Search", text: $viewModel.searchText)
                                .foregroundColor(Color("TextLabel"))
                            Image(systemName: "microphone")
                                .foregroundColor(Color("ButtonColor"))
                                .frame(width: 18, height: 22)
                                .padding()
                        }
                    }

                }
                .padding()
                //شرط في حال صار ترو يتنفذ الكود اللي داخلها
                if sortingPop {
                    Sortingpop( sortingPop: $sortingPop,
                                        sortByBookmark: viewModel.sortByBookmark,
                                        sortByDate: viewModel.sortByDate // نمررها كـ Binding
                     ) //هنا استدعنا صفحه سورت بوب اب
                        .position(x: 250, y: 72)
                        .transition(.scale)
                        .zIndex(1)
                }
            }
        }
    }
}

#Preview {
    MainPage()
}
