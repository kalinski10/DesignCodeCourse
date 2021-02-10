//
//  CourseSectionDetailView.swift
//  DesignCodeCourse (iOS)
//
//  Created by Kalin Balabanov on 08/02/2021.
//

import SwiftUI

struct CourseSectionDetailView: View {
    @Environment(\.presentationMode) var presentationMode
    
    var body: some View {
        #if os(iOS)
        content
        #else
        content
            .frame(width: 800, height: 600)
        #endif
    }
    
    var content: some View {
        ZStack(alignment: .topTrailing) {
            ScrollView {
                CourseItem(course: courses[0], cornerRadius: 0)
                    .frame(height: 300)
                
                VStack(alignment: .leading, spacing: 20) {
                    Text("some loads of text i guess this is where i will try to improve my writing skills because it seems i am not doing very well. it just doesnt feel very right to be able to text they way i do, my hands need to be rested. Let me try without my watch. okay this is goin to be a very good sample lets see how i will be able to cope with it. to be completely honest i am actualy surprised how well i can type without looking at my keyboard. now the other interesting thing is that i am not sure which way is more comfortable")
                    
                    Text("what you'll build").font(.title).bold()
                    Text("in this course, we'll build an app from scratch focusing on the new techniques in ios 14. we'll use the sidebar and tabbar naviation [pattern, which translates well to all platforms and give you the power to adapt for any tyoe od content. Also, we'll use LazyVgrid and so fourth i cant actually be asked to typ what ive been told. but if i tyoe like so it might actually be a lot easier given the way i actually operate with my left hand. i tend to use primarily only my index finger which is actually pretty crazy. okay what else can i tyoe in order to be a little bit better, now lets see how fast i can actually type something and now lets see how fast i can go without actually looking down and how accurate i can actually type. the one thing that i am noticing is that my left hand actually gets tired a lot faster than my right hand. i dont know if ti si becuase i am adding extra pressure on it.")
                    
                    Text("Requirements").font(.title).bold()
                    Text("now i am curious how wshould i position my hands in order to have the most optimal typing experience. another crazy thing that is happening is that i am starting to not be able to remember how to type words which is affecting my speed. i am actually not pretty sure that i am just not confidetn enough with my left hand. which is pretty crazy if you think about it. i do try and use all of my fingers but i need to constantly look down in order to get them right. could i actually be a dyslexic?")
                }
                .padding()
            }
            DismissButton()
                .onTapGesture {
                    presentationMode.wrappedValue.dismiss()
                }
        }
    }
}

struct CourseSectionDetailView_Previews: PreviewProvider {
    static var previews: some View {
        CourseSectionDetailView()
    }
}
