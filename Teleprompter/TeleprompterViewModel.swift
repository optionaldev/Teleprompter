//
//  TeleprompterViewModel.swift
//  Teleprompter
//
//  Created by Alexandru Pavalache on 03.04.2026.
//

import Foundation

final class TeleprompterViewModel {
    
    let leftText: String
    let rightText: String
    
    init() {
        var leftText = Constants.teleprompterTextLeft
        var rightText = Constants.teleprompterTextRight
        
        func transform(text: inout String) {
            text.insert(contentsOf: "\n\n\n\n\n\n\n\n\n\n\n\n\n", at: text.startIndex)
            
            /// Find:
            /// \n
            /// first line of text
            /// second line of text
            /// \n
            let pattern = #"\n([^\n]+)\n([^\n]+)\n"#
            
            /// Insert \n between first line of text and second line of text
            let replacement = "\n$1\n\n\n\n\n\n\n$2\n\n\n"

            text = text.replacingOccurrences(
                of: pattern,
                with: replacement,
                options: .regularExpression
            )
        }
        
        transform(text: &leftText)
        transform(text: &rightText)
        
        self.leftText = leftText
        self.rightText = rightText
    }
}
