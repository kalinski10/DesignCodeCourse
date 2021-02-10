//
//  CourseItem.swift
//  DesignCodeCourse
//
//  Created by Kalin Balabanov on 05/02/2021.
//

import SwiftUI

struct CourseItem: View {
    
    var course: Course
    // there is another way to get the corner radius to be adaptive to its container // the details are in WWDC20
    #if os(iOS)
    var cornerRadius: CGFloat = 22
    #else
    var cornerRadius: CGFloat = 10
    #endif
    
    var body: some View {
        VStack(alignment: .leading, spacing: 4.0) {
            Spacer()
            
            HStack {
                Spacer()
                Image(course.image)
                    .resizable()
                    .aspectRatio(contentMode: .fit)
                Spacer()
            }
            
            Text(course.title)
                .fontWeight(.bold)
            
            Text(course.subtitle)
                .font(.footnote)
            
        }
        .padding()
        .foregroundColor(.white)
        .background(course.color)
        .clipShape(RoundedRectangle(cornerRadius: cornerRadius, style: .continuous))
        .shadow(color: course.color.opacity(0.3), radius: 20, x: 0, y: 10)
    }
}

struct CourseItem_Previews: PreviewProvider {
    static var previews: some View {
        CourseItem(course: courses[0])
    }
}
