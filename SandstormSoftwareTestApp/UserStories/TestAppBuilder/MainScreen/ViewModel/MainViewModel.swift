//
//  MainViewModel.swift
//  SandstormSoftwareTestApp
//
//  Created by Dmytro Grytsenko on 06.09.2023.
//

import Foundation

final class MainViewModel: ObservableObject {
    @Published var isOpenFromTopButtonDisabled = false
    @Published var isDetailViewFromTopPresented = false
    @Published var isDetailViewFullPresented = false
    
    func toggleLock() {
        isOpenFromTopButtonDisabled.toggle()
    }
    
    func openDetailViewFromTop() {
        isDetailViewFromTopPresented = true
    }
    
    func openDetailViewFull() {
        isDetailViewFullPresented = true
    }
}
