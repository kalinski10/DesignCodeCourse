//
//  CourseList.swift
//  DesignCodeCourse
//
//  Created by Kalin Balabanov on 05/02/2021.
//

import SwiftUI

struct CourseList: View {
    @ViewBuilder
    var body: some View {
        #if os(iOS)
        content
            .listStyle(InsetGroupedListStyle())
        #else
        content
            .frame(minWidth: 200, idealWidth: 250, maxWidth: 300)
        #endif
    }
    
    var content: some View {
        List(courseSections) { item in
            CourseRow(item: item)
        }
        .navigationTitle("Courses")
    }
}

struct CourseList_Previews: PreviewProvider {
    static var previews: some View {
        CourseList()
    }
}
