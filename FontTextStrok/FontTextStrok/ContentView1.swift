//
//  ContentView1.swift
//  FontTextStrok
//
//  Created by Sachin Gupta on 7/11/21.
//

import SwiftUI

struct ContentView1: View {
    static var test:String = "9999+ CAL"//some very very very long description string to be initially wider than screen"
    static var testBinding = Binding<String>(get: { test }, set: {
//        print("New value: \($0)")
        test = $0 } )
    var body: some View {
        MultilineTextField("Enter some text here", text: ContentView1.testBinding, onCommit: {
            print("Final text: \(ContentView1.test)")
        })
    }
}

struct ContentView1_Previews: PreviewProvider {
    static var previews: some View {
        ContentView1()
    }
}
