//
//  ContentView.swift
//  SearchBarInSwiftUI
//
//  Created by Sraavan Chevireddy on 11/20/20.
//

import SwiftUI

struct ContentView: View {
    
    @State var searchText = ""
    @State var isSearching = false
    
    var body: some View {
        NavigationView{
            ScrollView{
                
                HStack{
                    HStack{
                        TextField("Search", text: $searchText)
                            .padding(.leading,24)
                    }
                    .frame(height: 10)
                    .padding()
                    .background(Color(.systemGray4))
                    .cornerRadius(20)
                    .padding(.horizontal)
                    .onTapGesture {
                        isSearching = true
                    }
                    .overlay(
                        HStack{
                            Image(systemName: "magnifyingglass")
                            Spacer()
                            if isSearching{
                                Button(action: {
                                    isSearching = false
                                    searchText = ""
                                    hideKeyboard()
                                }, label: {
                                    Button(action: {
                                        searchText = ""
                                        hideKeyboard()
                                        isSearching = false
                                    }, label: {
                                        Image(systemName: "xmark.circle.fill")
                                    })
                                })
                            }
                        }.padding(.horizontal,24)
                        .foregroundColor(Color.black)
                    ).transition(.move(edge: .trailing))
                    .animation(.interactiveSpring())
                    
                    // Cancel button
                    if isSearching{
                        Button(action: {
                            searchText = ""
                            hideKeyboard()
                            isSearching = false
                        }, label: {
                            Text("Cancel")
                        }).padding(.trailing,10)
                        .transition(.move(edge: .trailing))
                        .animation(.interactiveSpring())
                    }
                }
                
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
