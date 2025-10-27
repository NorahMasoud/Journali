//
//  ViewModels.swift
//  Journali
//
//  Created by Norah Masoud Aloqayli on 26/04/1447 AH.
// استخدمنا class عشان نقدر نستخدم الفونكشن اللي فيه وبعد
// observablrObject: هي تخلي هذا الكلاس مراقبمن الفيو واي تغير فيه تتغير تلقائيا في الفيو
// Published: وهو يساعد observablrObject في انه يرسل شعار للفيو على التغيير
// اخترنا يكون var jurnals كمصفوفه لان سهل في التعديل وترتيب
// كتبنا ان var jurnals نوع [Journal] لان نبغى كل قيمه في هذا المتغير يحتوي على عنوان ومحتوى
//var searchText: String = "" هنا سوينا متغير لقيمه السيرش لازم عشان نعرف القيمه اللي دخلها المستخدم وبناء عليه نسوي فلتر وتغيير في الفيو
//var filteredJournals: [Journal] هنا استخدمنا computed property بدل func لانها سريعه وسهله في حال صار تغيير اما func هنا لازم كل شوي نستدعي الداله وهذا ممكن يبطئ اظهار التغيير
//filter هي دالة على المصفوفة ترجع مصفوفة جديدة تحتوي على العناصر اللي تحقق شرط معين
// $0 يمثل كل عنصر من عناصر المصفوفة
// (||) هنا يقول اذا التايتل حق الملاجظه هو  الموجود في السيرش حقق الشرط او اذا الكونتكت موجوده حقق بعد الشرط

import SwiftUI

class JournalViewModel: ObservableObject {
    @Published var journals: [Journal] = []
    @Published var searchText: String = ""
    @Published var currentDate: Date = Date()
    @Published var showNewJournal = false
    @Published var selectedJournal: Journal?
    @Published var showEditSheet = false
    @Published var journalToDelete: Journal?
  
    var currentDateString: String {
            let formatter = DateFormatter()
            formatter.dateFormat = "dd/MM/yyyy"
            return formatter.string(from: currentDate)
        }
    
    var filteredJournals: [Journal] {
        if searchText.isEmpty {
            return journals
        } else {
            return journals.filter {
                $0.journalTitle.contains(searchText) || $0.journalContent.contains(searchText)
            }
        }
    }
    //هنا نسوي funcراح تستقبل قيمتين
    func addJournal(title: String, content: String) {
        //هنا سوينا object من struct Journal وكتبنا ان هو juranal عشان كل قيمه يستقبلها تتخزن في قيم struct
        let newJournals = Journal(journalTitle: title, journalContent: content) // why is let?
        journals.append(newJournals) //هنا كتبنا هذا السطر عشان يضيف newJournals في مصفوفه jurnals في نهايتها
    }
    
    func updateJournal(_ journal: Journal, newTitle: String, newContent: String) {
        if let index = journals.firstIndex(where: { $0.id == journal.id }) {
            journals[index].journalTitle = newTitle
            journals[index].journalContent = newContent
        }
    }
    
    func sortByBookmark() {
        journals.sort { (first: Journal, second: Journal) in
            if first.isBookmarked && !second.isBookmarked {
                return true   // الأول يسبق الثاني
            } else if !first.isBookmarked && second.isBookmarked {
                return false  // الثاني يسبق الأول
            } else {
                return false  // كلاهما نفس الحالة، ترتيبهم يبقى كما هو
            }
        }
    }
    
    func sortByDate() {
        journals.sort { (first: Journal, second: Journal) in
            return first.date > second.date
        }
    }
    //هنا سوينا داله تاخد معطى واحه من نوع Journal (مصفوفه حقت المذكرات)
    func bookMark (for journal: Journal){
        if let journaIndex = journals.firstIndex(where: {$0.id == journal.id}) {
            journals[journaIndex].isBookmarked.toggle()
        } //طيب هنا لازم نسوي شيك على الاي دي حق المذكره اللي اختارها المستخدم كيف من خلال الكود اللي داخل ايف لت
        // firstIndex(where: هو داله تساعد في بحقت عن العنصر في المصفوفه من خلال الاي دي
        // طيب ذحين اذا تحقق الكود اللي داخل if let راح يتنفذ الكود اللي تحت
        // مصفوفه الجرنل {المذكره اللي اختاره المستخدم}. متغير البوك ماركت عشان هو اللي يعتمد عليه الداله في حل ترو او فولس.toggle هو داله من سويفت تقلب قيمه المتغير من ترو لفوس
        
    }
    func deleteJournal(_ journal: Journal) {
        journals.removeAll { $0.id == journal.id }
    }
}

