//
//  ContentView.swift
//  CustomDatePicker
//
//  Created by Mücahid Erdoğan on 22.05.2021.
//

import SwiftUI

struct ContentView: View {
    
    @State var selection: Int = 0
    @Namespace var animation
    
    var body: some View {
        
        NavigationView {
            
            VStack {
                
                Spacer()
                    .frame(height: 30)
        
            HStack(spacing: 5) {
                
                ZStack {
                    if selection == 0 {
                        CustomPickerBackground()
                            .matchedGeometryEffect(id: "bg", in: animation)
                    }
                    
                    Text("Selection")
                        .customPickerTextModifier(selection: $selection, textNumber: 0)
                        .onTapGesture {
                            withAnimation(.easeInOut){
                                selection = 0
                            }
                    }
                }
          
                ZStack {
                    if selection == 1 {
                        CustomPickerBackground()
                            .matchedGeometryEffect(id: "bg", in: animation)
                    }
                    
                    Text("Selection 2")
                        .customPickerTextModifier(selection: $selection, textNumber: 1)
                        .onTapGesture {
                            withAnimation(.easeInOut){
                                selection = 1
                            }
                    }
                }
                
                ZStack {
                    if selection == 2 {
                        CustomPickerBackground()
                            .matchedGeometryEffect(id: "bg", in: animation)
                    }
                    
                    Text("Selection 3")
                        .customPickerTextModifier(selection: $selection, textNumber: 2)
                        .onTapGesture {
                            withAnimation(.easeInOut){
                                selection = 2
                            }
                    }
                }
                
            }
            .background(Color.white)
            .clipShape(RoundedRectangle(cornerRadius: 12))
            .shadow(radius: 2)
            .padding(.top, 5)
            
            Spacer()
                
            }
            .navigationBarTitle("Custom Picker")
            
        }
        
    }
    
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}

struct CustomPickerTextModifier: ViewModifier {
    @Binding var selection: Int
    var textNumber: Int
    
    func body(content: Content) -> some View {
        content
            .foregroundColor(selection == textNumber ? .white : Color.black.opacity(0.7))
            .frame(width: 110, height: 40)
            .clipShape(RoundedRectangle(cornerRadius: 12))
            .font(.headline)
    }
}

struct CustomPickerBackground: View {
    var body: some View {
        RoundedRectangle(cornerRadius: 12)
            .frame(width: 110, height: 40)
            .foregroundColor(.orange)
    }
}

extension View {
    func customPickerTextModifier(selection: Binding<Int>, textNumber: Int) -> some View {
        self.modifier(CustomPickerTextModifier(selection: selection, textNumber: textNumber))
    }
}
