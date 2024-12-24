//
//  SwiftUIText.swift
//  SwiftUIShowcase
//
//  Created by Глеб Хамин on 23.12.2024.
//

import SwiftUI

struct SwiftUIText: View {

    var body: some View {
        NavigationStack {
            ScrollView {
                TextTitleVIew(title: "font")
                Text("Hellow, World")
                    .font(.largeTitle)
                Text("Hellow, World")
                    .font(.title)
                Text("Hellow, World")
                    .font(.title2)
                Text("Hellow, World")
                    .font(.title3)
                Text("Hellow, World")
                    .font(.headline)
                Text("Hellow, World")
                    .font(.callout)
                Text("Hellow, World")
                    .font(.subheadline)
                Text("Hellow, World")
                    .font(.footnote)
                Text("Hellow, World")
                    .font(.caption)
                Text("Hellow, World")
                    .font(.caption2)

                TextTitleVIew(title: "fontWeight")

                Text("Hellow, World")
                    .fontWeight(.black)
                Text("Hellow, World")
                    .fontWeight(.heavy)
                Text("Hellow, World")
                    .fontWeight(.bold)
                Text("Hellow, World")
                    .fontWeight(.semibold)
                Text("Hellow, World")
                    .fontWeight(.medium)
                Text("Hellow, World")
                    .fontWeight(.regular)
                Text("Hellow, World")
                    .fontWeight(.light)
                Text("Hellow, World")
                    .fontWeight(.thin)
                Text("Hellow, World")
                    .fontWeight(.ultraLight)

                TextTitleVIew(title: "style")

                Text("Hellow, World")
                    .bold()
                Text("Hellow, World")
                    .italic()

                TextTitleVIew(title: "underline")

                Text("Hellow, World")
                    .underline()
                Text("Hellow, World")
                    .underline(color: .red)
                Text("Hellow, World")
                    .underline(color: Color.red)
                Text("Hellow, World")
                    .underline(false, color: .red)
                Text("Hellow, World")
                    .underline(true, color: .red)

                TextTitleVIew(title: "strikethrough")

                Text("Hellow, World")
                    .strikethrough()
                Text("Hellow, World")
                    .strikethrough(color: .red)
                Text("Hellow, World")
                    .strikethrough(color: Color.red)
                Text("Hellow, World")
                    .strikethrough(false, color: .red)
                Text("Hellow, World")
                    .strikethrough(true, color: .red)

                TextTitleVIew(title: "fontDesign")

                Text("Hellow, World")
                    .fontDesign(.default)
                Text("Hellow, World")
                    .fontDesign(.none)
                Text("Hellow, World")
                    .fontDesign(.rounded)
                Text("Hellow, World")
                    .fontDesign(.monospaced)
                Text("Hellow, World")
                    .fontDesign(.serif)

                TextTitleVIew(title: "foregroundStyle")

                Text("Hellow, World")
                    .foregroundStyle(Color.blue)
                Text("Hellow, World")
                    .foregroundStyle(Color.red.opacity(0.3))

                TextTitleVIew(title: "font.system")

                Text("Hellow, World")
                    .font(.system(size: 40))
                Text("Hellow, World")
                    .font(.system(size: 40, weight: .ultraLight, design: .default))

                TextTitleVIew(title: "multilineTextAlignment")

                VStack(spacing: 10) {
                    Text("Writing code in Swift is a true pleasure! This programming language combines simplicity and power, allowing developers to create efficient and safe applications.")
                    Text("Writing code in Swift is a true pleasure! This programming language combines simplicity and power, allowing developers to create efficient and safe applications.")
                        .multilineTextAlignment(.leading)
                    Text("Writing code in Swift is a true pleasure! This programming language combines simplicity and power, allowing developers to create efficient and safe applications.")
                        .multilineTextAlignment(.trailing)
                    Text("Writing code in Swift is a true pleasure! This programming language combines simplicity and power, allowing developers to create efficient and safe applications.")
                        .multilineTextAlignment(.center)
                }

                TextTitleVIew(title: "baselineOffset")

                Text("Writing code in Swift is a true pleasure! This programming language combines simplicity and power, allowing developers to create efficient and safe applications.")
                Divider()
                Text("Writing code in Swift is a true pleasure! This programming language combines simplicity and power, allowing developers to create efficient and safe applications.")
                    .baselineOffset(10) // Интервал между строк ПОД строкой
                Divider()
                Text("Writing code in Swift is a true pleasure! This programming language combines simplicity and power, allowing developers to create efficient and safe applications.")
                    .baselineOffset(-10) // Интервал между строк НАД строкой
                Divider()
                Text("Writing code in Swift is a true pleasure! This programming language combines simplicity and power, allowing developers to create efficient and safe applications.")
                    .multilineTextAlignment(.center)
                Divider()

                TextTitleVIew(title: "kerning")

                Text("Writing code in Swift is a true pleasure! This programming language combines simplicity and power, allowing developers to create efficient and safe applications.")
                Text("Writing code in Swift is a true pleasure! This programming language combines simplicity and power, allowing developers to create efficient and safe applications.")
                    .kerning(0.0)
                Text("Writing code in Swift is a true pleasure! This programming language combines simplicity and power, allowing developers to create efficient and safe applications.")
                    .kerning(2.0)
                Text("Writing code in Swift is a true pleasure! This programming language combines simplicity and power, allowing developers to create efficient and safe applications.")
                    .kerning(-2.0)

                TextTitleVIew(title: "minimumScaleFactor")

                Text("Writing code in Swift is a true pleasure! This programming language combines simplicity and power, allowing developers to create efficient and safe applications.")
                    .frame(width: 200, height: 100, alignment: .center)
                Text("Writing code in Swift is a true pleasure! This programming language combines simplicity and power, allowing developers to create efficient and safe applications.")
                    .frame(width: 200, height: 100, alignment: .center)
                    .minimumScaleFactor(0.1)
                Text("Writing code in Swift is a true pleasure! This programming language combines simplicity and power, allowing developers to create efficient and safe applications.")
                    .frame(width: 300, height: 150, alignment: .center)
                    .minimumScaleFactor(0.1)

                TextTitleVIew(title: "uppercased/lowercased/capitalized")
                
                Text("Writing code in Swift is a true pleasure!".uppercased())
                Text("Writing code in Swift is a true pleasure!".lowercased())
                Text("Writing code in Swift is a true pleasure!".capitalized)
            }
        }
        .navigationTitle("Text")
    }
}

private struct TextTitleVIew: View {
    var title: String
    var body: some View {
        Text(title)
            .font(.title3)
            .foregroundStyle(.white)
            .padding(10)
            .background(
                Capsule()
                    .foregroundStyle(.blue)
            )
    }
}

#Preview {
    SwiftUIText()
}


