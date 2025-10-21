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
    @Published var jurnals: [Journal] = []
    @Published var searchText: String = ""
    var filteredJournals: [Journal] {
        if searchText.isEmpty {
            return jurnals
        } else {
            return jurnals.filter {
                $0.journalTitle.contains(searchText) || $0.journalContent.contains(searchText)
            }
        }
    }
    
}

