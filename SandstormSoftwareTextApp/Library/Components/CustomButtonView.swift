//
//  CustomButtonView.swift
//  SandstormSoftwareTextApp
//
//  Created by Dmytro Grytsenko on 06.09.2023.
//

import SwiftUI

private extension Constants {
    static let buttonForegroundColor: Color = .white
    static let buttonBackgroundColor: Color = .blue
    static let buttonHeight: CGFloat = 56
    static let buttonCornerRadius: CGFloat = 18
    static let buttonStrokeColor: Color = .indigo
    static let buttonStrokeLineWidth: CGFloat = 3
}

struct CustomButtonView: View {
    let title: String
    let action: () -> Void
    
    var body: some View {
        Button(action: action) {
            Text(title)
                .frame(height: Constants.buttonHeight)
                .frame(maxWidth: .infinity)
                .background(Constants.buttonBackgroundColor)
                .foregroundColor(Constants.buttonForegroundColor)
                .cornerRadius(Constants.buttonCornerRadius)
                .overlay(
                    RoundedRectangle(cornerRadius: Constants.buttonCornerRadius)
                        .stroke(Constants.buttonStrokeColor, lineWidth: Constants.buttonStrokeLineWidth)
                )
        }
    }
}

struct CustomButtonView_Previews: PreviewProvider {
    static var previews: some View {
        CustomButtonView(title: "Lock", action: {})
    }
}
