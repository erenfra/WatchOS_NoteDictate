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
            HStack{
                TextField("Add new note", text: $text)
                Button {
                    guard text.isEmpty == false else {return}
                    let note = Note(id: UUID(), text: text)
                    notes.append(note)
                    text = ""
                } label: {
                    Image(systemName: "plus")
                        .padding()
                }.fixedSize()
                .buttonStyle(BorderedButtonStyle(tint: .blue))
            }
            List{
                ForEach(0..<notes.count, id: \.self) { i in
                    NavigationLink(destination: DetailView(index: i, note: notes[i], counter: notes.count)){
                        Text(notes[i].text)
                            .lineLimit(1)
                    }
                }.onDelete(perform: delete)
            }
//            Button ("Credit") {
//                NavigationLink("Work Folder", destination: CreditView())
//
//            }
            
        }.navigationTitle("Note Dictate")
    }
    
    func delete(offsets: IndexSet) {
        withAnimation {
            notes.remove(atOffsets: offsets)
        }
    }
    
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
