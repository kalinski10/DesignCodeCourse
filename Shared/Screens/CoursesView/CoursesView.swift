//
//  CoursesView.swift
//  DesignCodeCourse
//
//  Created by Kalin Balabanov on 05/02/2021.
//

import SwiftUI

struct CoursesView: View {
    
    @StateObject var viewModel = CoursesViewModel()
    @Namespace var namespace
    @Namespace var namespace2
    
    var body: some View {
        #if os(iOS)
        content
        .navigationBarHidden(true)
        #else
        content
        .navigationTitle("Courses")
        #endif
    }
    
    var content: some View {
        ZStack {
            ScrollView {
                LazyVGrid(columns: [GridItem(.adaptive(minimum: 160), spacing: 16)],
                          spacing: 16) {
                    ForEach(courses) { course in
                        VStack {
                            CourseItem(course: course)
                                .matchedGeometryEffect(id: course.id, in: namespace, isSource: !viewModel.isShowing)
                                .frame(height: 200)
                                .onTapGesture {
                                    withAnimation(.spring(response: 0.5, dampingFraction: 0.7, blendDuration: 0)) {
                                        viewModel.selectCourse(course)
                                    }
                                }
                                .disabled(viewModel.isDisabled)
                        }
                        .matchedGeometryEffect(id: "container\(course.id)", in: namespace, isSource: !viewModel.isShowing)
                    }
                }
                .padding()
                .frame(maxWidth: .infinity)
                
                Text("Latest Sections")
                    .fontWeight(.semibold)
                    .frame(maxWidth: .infinity, alignment: .leading)
                    .padding()
                
                LazyVGrid(columns: [GridItem(.adaptive(minimum: 240))] ) {
                    ForEach(courseSections) { item in
                        #if os(iOS)
                        NavigationLink(destination: CourseDetailView(course: viewModel.selectedCourse ?? courses[1], namespace: namespace2)) {
                            CourseRow(item: item)
                        }
                        #else
                        CourseRow(item: item)
                        #endif
                    }
                }
                .padding()
                
            }
            .zIndex(1)
            .blur(radius: viewModel.isShowing ? 40 : 0)
            
            if viewModel.isShowing {
                ZStack(alignment: .topTrailing) {
                    CourseDetailView(course: viewModel.selectedCourse ?? courses[0], namespace: namespace)
                        .frame(maxWidth: 712)
                    
                    Button {
                        withAnimation { viewModel.dismiss() }
                    } label: { DismissButton() }
                }
                .zIndex(2)
            }
        }
    }
}

struct CoursesView_Previews: PreviewProvider {
    static var previews: some View {
        CoursesView()
    }
}

//                .transition(.asymmetric(insertion: AnyTransition.opacity.animation(Animation.spring().delay(0.3)),
//                                        removal: AnyTransition.opacity.animation(.spring()))) /// this is how to add a delayed transition
