//
//  RadioButton.swift
//  PhoenixUI Kit
//
//  Created by Tomiwa Idowu on 12/14/23.
//

import SwiftUI

import SwiftUI

struct RadioButton: View {
@Binding var isChecked: Bool    //the variable that determines if its checked
//let onTapToActive: ()-> Void//action when taped to activate
//let onTapToInactive: ()-> Void //action when taped to inactivate

var body: some View {
    Group{
        if isChecked {
            CheckedCircleView {
                isChecked = false
            }
        } else {
            UncheckedCircleView {
                isChecked = true
            }
        }
    }
}
}

struct CheckedCircleView: View {
    var onTap: () -> Void

    var body: some View {
        VStack {
            ZStack {
                Circle()
                    .fill(Color.polarisColors.textDecorative1)
                    .frame(width: 32, height: 32)
                Circle()
                    .fill(Color.white)
                    .frame(width: 24, height: 24)
                Circle()
                    .fill(Color.polarisColors.textDecorative1)
                    .frame(width: 16, height: 16)
            }
            .onTapGesture { onTap() }
        }
        .frame(width: 32, height: 32)
        
    }
}

struct UncheckedCircleView: View {
    var onTap: () -> Void

    var body: some View {
        Circle()
            .fill(Color.white)
            .frame(width: 32, height: 32)
            .overlay(Circle().stroke(Color.black, lineWidth: 1))
            .onTapGesture { onTap() }
    }
}
public struct RadioButton_Previews: PreviewProvider {
    public static var previews: some View {
        RadioButton(isChecked: .constant(true))
    }
}
