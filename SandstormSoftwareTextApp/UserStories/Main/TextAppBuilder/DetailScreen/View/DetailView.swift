//
//  DetailView.swift
//  SandstormSoftwareTextApp
//
//  Created by Dmytro Grytsenko on 06.09.2023.
//

import SwiftUI

private extension Constants {
    static let dismissButtonImage = Image(systemName: "xmark")
    static let dismissButtonSize: CGFloat = 32
    static let dismissButtonBackgroundColor: Color = .gray
    static let dismissButtonForegroundColor: Color = .white
    static let dismissButtonPadding: CGFloat = 20
}

struct DetailView: View {
    @Binding var isDetailViewPresented: Bool
    
    private var dismissButton: some View {
        Button(action: { isDetailViewPresented = false }) {
            Circle()
                .fill(Constants.dismissButtonBackgroundColor)
                .overlay {
                    Constants.dismissButtonImage
                        .foregroundColor(Constants.dismissButtonForegroundColor)
                }
        }
    }
    
    var body: some View {
        GeometryReader { _ in
            Constants.pandaImage
                .resizable()
                .aspectRatio(contentMode: .fill)
                .frame(maxWidth: .infinity, alignment: .leading)
                .clipped()
                .ignoresSafeArea()
        }
        .overlay(alignment: .topTrailing) {
            dismissButton
                .frame(width: Constants.dismissButtonSize, height: Constants.dismissButtonSize)
                .offset(x: -Constants.dismissButtonPadding)
        }
    }
}

struct DetailView_Previews: PreviewProvider {
    static var previews: some View {
        DetailView(isDetailViewPresented: .constant(true))
    }
}
