//
//  AttributedText.swift
//  FontTextStrok
//
//  Created by Sachin Gupta on 7/11/21.
//

import SwiftUI
public struct AttributedText: View {
        @StateObject private var textViewStore = TextViewStore()

        private let attributedText: NSAttributedString

        public init(_ attributedText: NSAttributedString) {
            self.attributedText = attributedText
        }

        public var body: some View {
            GeometryReader { geometry in
                TextViewWrapper(
                    attributedText: attributedText,
                    maxLayoutWidth: geometry.maxWidth,
                    textViewStore: textViewStore
                )
            }
            .frame(
                idealWidth: textViewStore.intrinsicContentSize?.width,
                idealHeight: textViewStore.intrinsicContentSize?.height
            )
            .fixedSize(horizontal: false, vertical: true)
        }
    }

    @available(macOS 11.0, iOS 13.0, tvOS 14.0, *)
    private extension GeometryProxy {
        var maxWidth: CGFloat {
            size.width - safeAreaInsets.leading - safeAreaInsets.trailing
        }
    }
