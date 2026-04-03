//
//  TwoColumnTeleprompter.swift
//  Teleprompter
//
//  Created by Alexandru Pavalache on 03.04.2026.
//

import SwiftUI

struct TwoColumnTeleprompter: View {
    let leftText: String
    let rightText: String
    let speed: CGFloat = 30

    var body: some View {
        HStack(spacing: 0) {
            SmoothTeleprompterView(
                text: leftText,
                textAlignment: .leading
            )
            .frame(maxWidth: .infinity)

            Divider()

            SmoothTeleprompterView(
                text: rightText,
                textAlignment: .trailing
            )
            .frame(maxWidth: .infinity)
        }
    }
}
