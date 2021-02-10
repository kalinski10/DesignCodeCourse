//
//  CourseDetailView.swift
//  DesignCodeCourse
//
//  Created by Kalin Balabanov on 07/02/2021.
//

import SwiftUI

struct CourseDetailView: View {
    
    var course: Course
    var namespace: Namespace.ID
    // there is another way to get the corner radius to be adaptive to its container // the details are in WWDC20
    #if os(iOS)
    var cornerRadius: CGFloat = 10
    #else
    var cornerRadius: CGFloat = 0
    #endif
    @State var showModal = false
    
    
    var body: some View {
        #if os(iOS)
        content
            .background(Color(.systemBackground))
            .edgesIgnoringSafeArea(.all)
        #else
        content
        #endif
    }
    
    var content: some View {
        ScrollView {
            VStack {
                CourseItem(course: course, cornerRadius: 0)
                    .matchedGeometryEffect(id: course.id , in: namespace)
                    .frame(height: 300)
                
                VStack {
                    ForEach(courseSections) { item in
                        CourseRow(item: item)
                            .sheet(isPresented: $showModal) {
                                CourseSectionDetailView()
                            }
                            .onTapGesture {
                                showModal = true
                            }
                        Divider()
                    }
                }
                .padding()
            }
        }
        .clipShape(RoundedRectangle(cornerRadius: cornerRadius, style: .continuous))
        .matchedGeometryEffect(id: "container\(course.id)", in: namespace)
    }
}

struct CourseDetailView_Previews: PreviewProvider {
    @Namespace static var namespace
    static var previews: some View {
        CourseDetailView(course: courses[0], namespace: namespace)
    }
}
