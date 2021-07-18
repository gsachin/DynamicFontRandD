//
//  ContentView.swift
//  FontTextStrok
//
//  Created by Sachin Gupta on 7/11/21.
//

import SwiftUI

struct ContentView: View {
 
    var body: some View {
        VStack{
            Text("AKSDJFKDEOA;WE,CALSD")
                .scaledFont(name: "SFProText-Heavy", size: 12)
            AttributedText(
                NSAttributedString(
                    string: "I had called upon my friend, ...",
                    attributes:[
                       // NSAttributedString.Key.paragraphStyle: attributedStringParagraphStyle,
                        NSAttributedString.Key.strokeWidth: 3.0,
                        NSAttributedString.Key.foregroundColor: UIColor.black,
                        NSAttributedString.Key.strokeColor: UIColor.black,
                        NSAttributedString.Key.font:UIFont.customFont(forTextStyle: .caption2, fontName: "SFProText-Heavy")
                        //NSAttributedString.Key.font: UIFont.systemFont(ofSize: 50)
                    ]
                )
            )
            .lineLimit(2)
            .truncationMode(.middle)
            StrokeTextLabel()
                .scaledFont(name: "SFProText-Heavy", size: 18)
                .background(Color.blue)
        StrokeTextLabel1()
            .background(Color.red)
        Spacer() .background(Color.yellow)
        }
            .onAppear(){
                for family: String in UIFont.familyNames
                {
                    print(family)
                    for names: String in UIFont.fontNames(forFamilyName: family)
                    {
                        print("== \(names)")
                    }
                }
            }
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
//import SwiftUI
//import UIKit
//
//struct SomeView: View {
//    var body: some View {
//        StrokeTextLabel()
//    }
//}

struct StrokeTextLabel: UIViewRepresentable {
    func makeUIView(context: Context) -> UILabel {
        let attributedStringParagraphStyle = NSMutableParagraphStyle()
        attributedStringParagraphStyle.alignment = NSTextAlignment.center
        let attributedString = NSAttributedString(
            string: "ClassicClassicClassicClassic",
            attributes:[
                NSAttributedString.Key.paragraphStyle: attributedStringParagraphStyle,
                NSAttributedString.Key.strokeWidth: 3.0,
                NSAttributedString.Key.foregroundColor: UIColor.black,
                NSAttributedString.Key.strokeColor: UIColor.black,
                NSAttributedString.Key.font:UIFont.customFont(forTextStyle: .caption2, fontName: "SFProText-Heavy")
                    //UIFont(name: "SFProText-Heavy", size: 50)
                //NSAttributedString.Key.font: UIFont.systemFont(ofSize: 50)
            ]
        )

        let strokeLabel = UILabel(frame: CGRect.zero)
        strokeLabel.attributedText = attributedString
        strokeLabel.backgroundColor = UIColor.clear
        strokeLabel.sizeToFit()
        strokeLabel.numberOfLines = 0
        strokeLabel.font = UIFont.preferredFont(forTextStyle: .body)
        strokeLabel.adjustsFontForContentSizeCategory = true
        strokeLabel.center = CGPoint.init(x: 0.0, y: 0.0)
        return strokeLabel
    }

    func updateUIView(_ uiView: UILabel, context: Context) {
        
    }
}
struct StrokeTextLabel1: UIViewRepresentable {
    func makeUIView(context: Context) -> UILabel {
        let attributedStringParagraphStyle = NSMutableParagraphStyle()
        attributedStringParagraphStyle.alignment = NSTextAlignment.center
        let attributedString = NSAttributedString(
            string: "ClassicClassicClassicClassic",
            attributes:[
                NSAttributedString.Key.paragraphStyle: attributedStringParagraphStyle,
                NSAttributedString.Key.strokeWidth: 3.0,
                NSAttributedString.Key.foregroundColor: UIColor.black,
                NSAttributedString.Key.strokeColor: UIColor.black,
                //NSAttributedString.Key.font: UIFont(name: "SFProText-Heavy", size: 50)
                NSAttributedString.Key.font: UIFont.systemFont(ofSize: 50,weight: .heavy)
            ]
        )

        let strokeLabel = UILabel(frame: CGRect.zero)
        strokeLabel.attributedText = attributedString
        strokeLabel.backgroundColor = UIColor.clear
        strokeLabel.sizeToFit()
        strokeLabel.center = CGPoint.init(x: 0.0, y: 0.0)
        return strokeLabel
    }

    func updateUIView(_ uiView: UILabel, context: Context) {}
}


//#if DEBUG
//struct SomeView_Previews: PreviewProvider {
//    static var previews: some View {
//        SomeView()
//    }
//}
//#endif
extension UIFont {
class func customFont(forTextStyle style: UIFont.TextStyle, fontName:String)->UIFont {
    let customFonts: [UIFont.TextStyle: UIFont] = [
        .largeTitle:UIFont(name:fontName,size: 50) ?? UIFont(),
        .title1:UIFont(name:fontName,size: 42) ?? UIFont(),
        .title2:UIFont(name:fontName,size: 33) ?? UIFont(),
        .title3:UIFont(name:fontName,size: 30) ?? UIFont(),
        .headline:UIFont(name:fontName,size: 25) ?? UIFont(),
        .body:UIFont(name:fontName,size: 25) ?? UIFont(),
        .callout:UIFont(name:fontName,size: 24) ?? UIFont(),
        .subheadline:UIFont(name:fontName,size: 22) ?? UIFont(),
        .footnote:UIFont(name:fontName,size: 19) ?? UIFont(),
        .caption1:UIFont(name:fontName,size: 18) ?? UIFont(),
        .caption2:UIFont(name:fontName,size: 16) ?? UIFont(),
    ]
    
    if let customFont = customFonts[style] {
        let metrics = UIFontMetrics(forTextStyle: style)
        let scaledFont = metrics.scaledFont(for: customFont)
        return scaledFont
    } else {
        return UIFont()
    }
}
}

@available(iOS 13, macCatalyst 13, tvOS 13, watchOS 6, *)
struct ScaledFont: ViewModifier {
    @Environment(\.sizeCategory) var sizeCategory
    var name: String
    var size: CGFloat

    func body(content: Content) -> some View {
       let scaledSize = UIFontMetrics.default.scaledValue(for: size)
        return content.font(Font(UIFont.customFont(forTextStyle: .largeTitle, fontName: name) as CTFont))
    }
}

@available(iOS 13, macCatalyst 13, tvOS 13, watchOS 6, *)
extension View {
    func scaledFont(name: String, size: CGFloat) -> some View {
        return self.modifier(ScaledFont(name: name, size: size))
    }
}
