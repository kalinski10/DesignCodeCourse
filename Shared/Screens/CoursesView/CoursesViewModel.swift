//
//  CoursesViewModel.swift
//  DesignCodeCourse
//
//  Created by Kalin Balabanov on 07/02/2021.
//

import SwiftUI


final class CoursesViewModel: ObservableObject {
    
    @Published var isShowing = false
    @Published var selectedCourse: Course?
    @Published var isDisabled = false
    
    
    func dismiss() {
            isShowing.toggle()
            DispatchQueue.main.asyncAfter(deadline: .now() + 0.5) { self.isDisabled = false }
    }
    
    
    func selectCourse(_ course: Course) {
           selectedCourse = course
           isDisabled = true
           isShowing.toggle()
    }
    
    
}
