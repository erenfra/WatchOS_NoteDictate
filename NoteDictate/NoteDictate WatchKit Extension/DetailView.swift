//
//  DetailView.swift
//  NoteDictate WatchKit Extension
//
//  Created by Renato Oliveira Fraga on 6/29/21.
//

import SwiftUI

struct DetailView: View {
    
    let index: Int
    let note: Note
    let counter: Int
    
    var body: some View {
        Text(note.text)
            .navigationTitle("Note \(index+1)/\(counter)")
    }
}

struct DetailView_Previews: PreviewProvider {
    static var previews: some View {
        DetailView(index: 0, note: Note(id: UUID(), text: "Hello World!"), counter: 1)
    }
}
