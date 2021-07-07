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
    @AppStorage("lineCount") var lineCount = 1
    
    var body: some View {
        VStack{
            HStack{
                TextField("Add new note", text: $text)
                Button {
                    guard text.isEmpty == false else {return}
                    let note = Note(id: UUID(), text: text)
                    notes.append(note)
                    text = ""
                    save()
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
                            .lineLimit(lineCount)
                    }
                }.onDelete(perform: delete)
                Button("Lines: \(lineCount)") {
                    lineCount += 1
                    
                    if lineCount ==  4 {
                        lineCount = 1
                    }
                }.buttonStyle(BorderedButtonStyle(tint: .blue))
            }
//            Button ("Credit") {
//                NavigationLink("Work Folder", destination: CreditView())
//
//            }
            
        }.navigationTitle("Note Dictate")
        .onAppear(perform: load)
    }
    
    func delete(offsets: IndexSet) {
        withAnimation {
            notes.remove(atOffsets: offsets)
            save()
        }
    }
    
    func getDocumentDirectory() -> URL {
        let paths = FileManager.default.urls(for: .documentDirectory, in: .userDomainMask)
        return paths[0]
    }
    
    func save() {
        
        do {
            let data = try JSONEncoder().encode(notes)
            let url = getDocumentDirectory().appendingPathComponent("notes")
            try data.write(to: url)
        } catch {
            print("Save Failed")
        }
    }
    
    func load() {
        DispatchQueue.main.async {
            do {
                let url = getDocumentDirectory().appendingPathComponent("notes")
                let data = try Data(contentsOf: url)
                notes = try JSONDecoder().decode([Note].self, from: data)
            } catch {
                // do nothing
            }
        }
    }
    
    
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
