//
//  DetailView.swift
//  SandstormSoftwareTestApp
//
//  Created by Dmytro Grytsenko on 06.09.2023.
//

import SwiftUI

private extension Constants {
    static let dismissButtonSystemName = "xmark"
    static let dismissButtonSize: CGFloat = 32
    static let dismissButtonBackgroundColor: Color = .gray
    static let dismissButtonForegroundColor: Color = .white
    static let dismissButtonPadding: CGFloat = 20
}

struct DetailView: View {
    @Binding var isDetailViewPresented: Bool
    
    var body: some View {
        GeometryReader { proxy in
            ZStack(alignment: .topTrailing) {
                pandaImage
                    .frame(width: proxy.size.width, height: proxy.size.height, alignment: .leading)
                
                dismissButton
                    .frame(width: Constants.dismissButtonSize, height: Constants.dismissButtonSize)
                    .padding(Constants.dismissButtonPadding)
            }
        }
    }
    
    private var pandaImage: some View {
        Image(Constants.pandaImageName)
            .resizable()
            .aspectRatio(contentMode: .fill)
            .ignoresSafeArea()
    }
    
    private var dismissButton: some View {
        Button(action: { isDetailViewPresented = false }) {
            Circle()
                .fill(Constants.dismissButtonBackgroundColor)
                .overlay {
                    Image(systemName: Constants.dismissButtonSystemName)
                        .foregroundColor(Constants.dismissButtonForegroundColor)
                }
        }
    }
}


struct DetailView_Previews: PreviewProvider {
    static var previews: some View {
        DetailView(isDetailViewPresented: .constant(true))
    }
}
