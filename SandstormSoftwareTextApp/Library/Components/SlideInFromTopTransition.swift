//
//  SlideInFromTopTransition.swift
//  SandstormSoftwareTextApp
//
//  Created by Dmytro Grytsenko on 07.09.2023.
//

import SwiftUI

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
