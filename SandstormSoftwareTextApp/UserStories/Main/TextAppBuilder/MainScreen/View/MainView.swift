//
//  MainView.swift
//  SandstormSoftwareTextApp
//
//  Created by Dmytro Grytsenko on 06.09.2023.
//

import SwiftUI

private extension Constants {
    static let spacing: CGFloat = 20
    static let padding: CGFloat = 20
}

struct MainView: View {
    var body: some View {
        GeometryReader { proxy in
            VStack(spacing: Constants.spacing) {
                Constants.pandaImage
                    .resizable()
                    .aspectRatio(contentMode: .fill)
                    .frame(width: 150, height: proxy.size.height * 0.3, alignment: .leading)
                    .clipped()
                
                HStack(spacing: Constants.spacing) {
                    CustomButtonView(title: "Lock", action: {})
                    
                    CustomButtonView(title: "Open from top", action: {})
                }
                Spacer()
                
                CustomButtonView(title: "Open full", action: {})
            }
        }
        .padding(.horizontal, Constants.padding)
    }
}

struct MainView_Previews: PreviewProvider {
    static var previews: some View {
        MainView()
    }
}
