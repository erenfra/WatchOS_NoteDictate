//
//  ContentView.swift
//  NoteDictate WatchKit Extension
//
//  Created by Renato Oliveira Fraga on 6/29/21.
//

import SwiftUI

struct ContentView: View {
    
    @State private var notes = [Note]()
    @State private var text = ""
    
    var body: some View {
        VStack{
            TextField("Add new note", text: $text)
            Button("Add Note") {
                let note = Note(id: UUID(), text: "Example")
                notes.append(note)
            }.foregroundColor(/*@START_MENU_TOKEN@*/.blue/*@END_MENU_TOKEN@*/)
            List(0..<notes.count, id: \.self) {i in
                Text(notes[i].text)
            }
        }
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
