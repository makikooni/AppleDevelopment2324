//
//  ContentView.swift
//  WhyNotTry
//
//  Created by Weronika E. Falinska on 16/02/2024.
//

import SwiftUI

struct ContentView: View {
    var activities = ["Archery", "Baseball", "Basketball", "Bowling", "Boxing", "Cricket", "Curling", "Fencing", "Golf", "Hiking", "Lacrosse", "Rugby", "Squash"]

    @State private var selected = "Boxing"
    @State private var id = 1

    
    var colors: [Color] = [.blue, .cyan, .gray, .green, .indigo, .mint, .orange, .pink, .purple, .red]

    
    var body: some View {
        VStack{
            Spacer()

            Text("Hello, Warrior!")
                .font(.largeTitle)
                .fontWeight(.bold)
            
            VStack{
                Circle()
                    .blur(radius: /*@START_MENU_TOKEN@*/6.0/*@END_MENU_TOKEN@*/)
                    .padding(.all, 40.0)
                    .foregroundColor(colors.randomElement() ?? .pink)
                    .overlay(
                        Image(systemName:"figure.\(selected.lowercased())")
                            .font(.system(size: 144))
                            .foregroundColor(.white)
                    )
                
                Text("\(selected)!")
                    .font(.title)
                
            }
            .transition(.slide)
            .id(id)
            
            Spacer()

            Button("Try again") {
                withAnimation(.easeInOut(duration: 1)) {
                    selected = activities.randomElement() ?? "Archery"
                    id += 1
                }
            }
            .buttonStyle(.borderedProminent)
        }
    }
}

#Preview {
    ContentView()
}
