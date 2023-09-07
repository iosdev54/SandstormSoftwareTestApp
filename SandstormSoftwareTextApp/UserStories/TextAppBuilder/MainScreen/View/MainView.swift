//
//  MainView.swift
//  SandstormSoftwareTextApp
//
//  Created by Dmytro Grytsenko on 06.09.2023.
//

import SwiftUI

private extension Constants {
    static let pandaImageWidth: CGFloat = 150
    static let pandaImageHeightMultiplier: CGFloat = 0.3
    static let spacing: CGFloat = 20
    static let padding: CGFloat = 20
}

struct MainView: View {
    @StateObject private var viewModel = MainViewModel()
    
    var body: some View {
        ZStack {
            GeometryReader { proxy in
                VStack {
                    pandaImage
                        .frame(width: Constants.pandaImageWidth, height: proxy.size.height * Constants.pandaImageHeightMultiplier, alignment: .leading)
                        .clipped()
                    
                    HStack(spacing: Constants.spacing) {
                        CustomButtonView(title: lockButtonTitle, action: viewModel.toggleLock)
                        
                        CustomButtonView(title: "Open from top", isDisabled: viewModel.isOpenFromTopButtonDisabled) {
                            withAnimation {
                                viewModel.openDetailViewFromTop()
                            }
                        }
                    }
                    
                    Spacer()
                    
                    CustomButtonView(title: "Open full", action: viewModel.openDetailViewFull)
                }
            }
            .padding(.horizontal, Constants.padding)
            
            if viewModel.isDetailViewFromTopPresented {
                DetailView(isDetailViewPresented: $viewModel.isDetailViewFromTopPresented)
                    .transition(.slideInFromTop)
                    .zIndex(1)
            }
            
            if viewModel.isDetailViewFullPresented {
                DetailView(isDetailViewPresented: $viewModel.isDetailViewFullPresented)
                    .zIndex(1)
            }
        }
        .background(.gray)
    }
    
    private var lockButtonTitle: String {
        viewModel.isOpenFromTopButtonDisabled ? "Unlock" : "Lock"
    }
    
    private var pandaImage: some View {
        Image(Constants.pandaImageName)
            .resizable()
            .aspectRatio(contentMode: .fill)
    }
}

struct MainView_Previews: PreviewProvider {
    static var previews: some View {
        MainView()
    }
}
