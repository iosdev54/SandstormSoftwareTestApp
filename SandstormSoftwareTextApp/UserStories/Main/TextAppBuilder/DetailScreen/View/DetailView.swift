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
    
    var body: some View {
        GeometryReader { proxy in
            Constants.pandaImage
                .resizable()
                .aspectRatio(contentMode: .fill)
                .frame(width: proxy.size.width, height: proxy.size.height + proxy.safeAreaInsets.top + proxy.safeAreaInsets.bottom, alignment: .leading)
                .clipped()
                .ignoresSafeArea()
            
            HStack {
                Spacer()
                
                Button(action: { isDetailViewPresented = false }) {
                    Circle()
                        .fill(Constants.dismissButtonBackgroundColor)
                        .overlay {
                            Constants.dismissButtonImage
                                .font(.title2)
                                .foregroundColor(Constants.dismissButtonForegroundColor)
                        }
                }
                .frame(width: Constants.dismissButtonSize, height: Constants.dismissButtonSize)
                .offset(x: -Constants.dismissButtonPadding)
            }
        }
    }
}

struct DetailView_Previews: PreviewProvider {
    static var previews: some View {
        DetailView(isDetailViewPresented: .constant(true))
    }
}
