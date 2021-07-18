//
//  TextViewStore.swift
//  FontTextStrok
//
//  Created by Sachin Gupta on 7/11/21.
//

import SwiftUI

    @available(macOS 11.0, iOS 13.0, tvOS 14.0, *)
    final class TextViewStore: ObservableObject {
        @Published var intrinsicContentSize: CGSize?

        func didUpdateTextView(_ textView: TextViewWrapper.View) {
            intrinsicContentSize = textView.intrinsicContentSize
        }
    }
