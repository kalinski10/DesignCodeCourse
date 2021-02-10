//
//  DismissButton.swift
//  DesignCodeCourse
//
//  Created by Kalin Balabanov on 07/02/2021.
//

import SwiftUI

struct DismissButton: View {
    var body: some View {
        Image(systemName: "xmark")
            .imageScale(.small)
            .frame(width: 33, height: 33)
            .foregroundColor(.white)
            .background(Color.black.opacity(0.6))
            .clipShape(Circle())
            .padding()
    }
}

struct DismissButton_Previews: PreviewProvider {
    static var previews: some View {
        DismissButton()
    }
}
