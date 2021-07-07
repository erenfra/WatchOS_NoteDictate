//
//  Note.swift
//  NoteDictate WatchKit Extension
//
//  Created by Renato Oliveira Fraga on 6/29/21.
//

import Foundation

struct Note: Identifiable, Codable {
    
    let id : UUID
    let text: String
}
