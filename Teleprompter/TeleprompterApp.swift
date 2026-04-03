//
//  TeleprompterApp.swift
//  Teleprompter
//
//  Created by Alexandru Pavalache on 03.04.2026.
//

import SwiftUI

@main
struct TeleprompterApp: App {
    
    var body: some Scene {
        WindowGroup {
            TwoColumnTeleprompter(leftText: viewModel.leftText, rightText: viewModel.rightText)
        }
    }
    
    // MARK: - Private
    
    private let viewModel = TeleprompterViewModel()
}
