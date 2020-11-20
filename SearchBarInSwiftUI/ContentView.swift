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
                        .padding(.leading,24)
                }
                .padding()
                .background(Color(.systemGray4))
                .cornerRadius(15)
                .padding(.horizontal)
                .overlay(
                    HStack{
                        Image(systemName: "magnifyingglass")
                        Spacer()
                        Image(systemName: "xmark.circle.fill").onTapGesture {
                            searchText = ""
                            hideKeyboard()
                        }
                    }.padding(.horizontal,24)
                    .foregroundColor(Color.black)
                )
                
                ForEach((0..<20).filter({"\($0)".contains(searchText) || searchText.isEmpty}), id:\.self){ num in
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


#if canImport(UIKit)
extension View{
    func hideKeyboard(){
        UIApplication.shared.sendAction(#selector(UIResponder.resignFirstResponder), to: nil, from: nil, for: nil)
    }
}
#endif
