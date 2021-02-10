//
//  SsideBar.swift
//  DesignCodeCourse
//
//  Created by Kalin Balabanov on 05/02/2021.
//

import SwiftUI

struct SideBar: View {
    @ViewBuilder
    var body: some View {
        NavigationView {
            #if os(iOS)
            content
                .navigationTitle("Learn")
                .toolbar {
                    ToolbarItem(placement: .navigationBarTrailing) {
                        Image(systemName: "person.crop.circle")
                    }
                }
            #else
            content
                .frame(minWidth: 200, idealWidth: 250, maxWidth: 300)
                .toolbar {
                    ToolbarItem(placement: .automatic) {
                        Button{ print("somthing") }
                            label: { Image(systemName: "person.crop.circle") }
                    }
                }
            #endif
            
            CoursesView()
        }
    }
    
    var content: some View {
        List {
            NavigationLink(destination: CoursesView()) {
                Label("Courses", systemImage: "book.closed")
            }
            
            NavigationLink(destination: CoursesView()) {
                Label("Tutorials", systemImage: "list.bullet.rectangle")
            }
            
            NavigationLink(destination: CoursesView()) {
                Label("Livestreams", systemImage: "tv")
            }
            
            NavigationLink(destination: CoursesView()) {
                Label("Certificates", systemImage: "mail.stack")
            }
            
            NavigationLink(destination: CoursesView()) {
                Label("Search", systemImage: "magnifyingglass")
            }
        }
        .listStyle(SidebarListStyle())
    }
}

struct SsideBar_Previews: PreviewProvider {
    static var previews: some View {
        SideBar()
    }
}
