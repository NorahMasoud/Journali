//
//  Models.swift
//  Journali
//
//  Created by Norah Masoud Aloqayli on 26/04/1447 AH.
//
// Identifiable يساعد على ان يخلي سويفت يو اي يعرف الفرق بين المذكرات حقت المستخدم وهذا يعني في حال قرر المستخدم يسوي حذف او حفظ او حتى سوررت هنا سهل على السويفت يعرف المذكره المحدده
// uuid هنا هي تساعد identififable في انه يعرف المذكره المقصوده من خلال رقم هويه محدده له
// DateFormatter is a foundation class used to convert date as you want.
// dateFormat is a tool that tells it how convert date
import Foundation  //why? becouse I need to handle with data, date and time..

struct Journal: Identifiable {
    let id = UUID()
    var journalTitle: String
    var journalContent: String
    let date = Date()
    var currentDate: Date = Date()
    var isBookmarked: Bool = false
    
    var currentDateString: String {
            let formatter = DateFormatter()
            formatter.dateFormat = "dd/MM/yyyy"
            return formatter.string(from: currentDate)
        }
    
}
    

