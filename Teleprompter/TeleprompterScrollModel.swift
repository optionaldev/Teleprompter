//
//  TeleprompterScrollModel.swift
//  Teleprompter
//
//  Created by Alexandru Pavalache on 03.04.2026.
//

import Foundation
internal import Combine

class TeleprompterScrollModel: ObservableObject {
    @Published var offset: CGFloat = 0
    @Published var isUserScrolling = false
}
