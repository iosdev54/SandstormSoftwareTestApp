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

struct SlideInFromTopTransition: ViewModifier {
    var offsetY: CGFloat = -UIScreen.main.bounds.height
    
    func body(content: Content) -> some View {
        content
            .offset(y: offsetY)
            .animation(.easeInOut, value: offsetY)
    }
}

extension AnyTransition {
    static var slideInFromTop: AnyTransition {
        AnyTransition.modifier(
            active: SlideInFromTopTransition(),
            identity: SlideInFromTopTransition(offsetY: 0)
        )
    }
}

struct MainView: View {
    @StateObject private var viewModel = MainViewModel()
    
    private var lockButtonTitle: String {
        viewModel.isOpenFromTopButtonDisabled ? "Unlock" : "Lock"
    }
    
    var body: some View {
        ZStack {
            GeometryReader { proxy in
                VStack {
                    Constants.pandaImage
                        .resizable()
                        .aspectRatio(contentMode: .fill)
                        .frame(width: 150, height: proxy.size.height * 0.3, alignment: .leading)
                        .clipped()
                    
                    HStack(spacing: Constants.spacing) {
                        CustomButtonView(title: lockButtonTitle, action: viewModel.toggleLock)
                        
                        CustomButtonView(title: "Open from top", isDisabled: viewModel.isOpenFromTopButtonDisabled, action: viewModel.openDetailViewFromTop)
                    }
                    
                    Spacer()
                    
                    CustomButtonView(title: "Open full", action: viewModel.openDetailViewFull)
                }
            }
            .padding(.horizontal, Constants.padding)
            
            if viewModel.isDetailViewFromTopPresented {
                DetailView(isDetailViewPresented: $viewModel.isDetailViewFromTopPresented)
                    .transition(.slideInFromTop)
                    .edgesIgnoringSafeArea(.all)
            }
            
            if viewModel.isDetailViewFullPresented {
                DetailView(isDetailViewPresented: $viewModel.isDetailViewFullPresented)
                    .transition(.move(edge: .bottom))
                    .edgesIgnoringSafeArea(.all)
            }
        }
    }
}

struct MainView_Previews: PreviewProvider {
    static var previews: some View {
        MainView()
    }
}
