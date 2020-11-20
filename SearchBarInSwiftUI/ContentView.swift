//
//  ContentView.swift
//  SearchBarInSwiftUI
//
//  Created by Sraavan Chevireddy on 11/20/20.
//

import SwiftUI

struct ContentView: View {
    
    @State var searchText = ""
    var body: some View {
        NavigationView{
            ScrollView{
                HStack{
                    TextField("Search", text: $searchText)
                }
                .padding()
                .background(Color(.systemGray4))
                .cornerRadius(12)
                .padding(.horizontal)
                
                ForEach(0..<20, id:\.self){ num in
                    HStack{
                        Text("\(num)"); Spacer()
                    }
                    .padding()
                    Divider()
                        .padding(.leading)
                }
            }
            .navigationTitle("Food")
        }
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
