//
//  AutoScrollView.swift
//  Teleprompter
//
//  Created by Alexandru Pavalache on 03.04.2026.
//

import SwiftUI

struct SmoothTeleprompterView: View {
    let text: String
    let textAlignment: TextAlignment

    @State private var offset: CGFloat = 0
    @State private var contentHeight: CGFloat = 0
    @State private var startTime: Date?

    @ObservedObject var model: TeleprompterScrollModel
    
    var body: some View {
        GeometryReader { geo in
            ScrollView(.vertical, showsIndicators: false) {
                Text(text)
                    .font(.custom("FiraCode-Regular", size: 22))
                    .multilineTextAlignment(textAlignment)
                    .frame(maxWidth: .infinity, alignment: frameAlignment(for: textAlignment))
                    .padding()
                    .background(
                        GeometryReader { contentGeo in
                            Color.clear
                                .onAppear {
                                    contentHeight = contentGeo.size.height
                                }
                        }
                    )
                    .offset(y: -offset)
            }
            .onAppear { startTime = Date() }
            .overlay(
                TimelineView(.animation) { timeline in
                    Color.clear
                        .onChange(of: timeline.date) { _ in
                            updateOffset(viewHeight: geo.size.height)
                        }
                }
            )
        }
    }
    
    // MARK: - Private

    private func updateOffset(viewHeight: CGFloat) {
        guard contentHeight > 0 else { return }
        guard let start = startTime else { return }

        let elapsed = Date().timeIntervalSince(start)
        let distance = elapsed * 30
        let maxDistance = contentHeight - viewHeight

        if distance < maxDistance {
            offset = distance
        } else {
            startTime = Date()
            offset = 0
        }
    }
    
    private func frameAlignment(for alignment: TextAlignment) -> Alignment {
        switch alignment {
        case .leading:  return .leading
        case .center:   return .center
        case .trailing: return .trailing
        @unknown default: return .leading
        }
    }
}
