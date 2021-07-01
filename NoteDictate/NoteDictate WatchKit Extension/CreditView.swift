//
//  CreditView.swift
//  NoteDictate WatchKit Extension
//
//  Created by Renato Oliveira Fraga on 6/30/21.
//

import SwiftUI

struct CreditView: View {
    var body: some View {
        VStack {
            Text("Renato Fraga")
            Text("Jun 30 2021")
                .font(.footnote)
                .foregroundColor(Color.blue)
                .padding()
            Image(systemName: "gamecontroller")
                .padding()
            
        }
    }
}

struct CreditView_Previews: PreviewProvider {
    static var previews: some View {
        CreditView()
    }
}
