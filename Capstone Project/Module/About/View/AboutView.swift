//
//  AboutView.swift
//  Capstone Project
//
//  Created by septe habudin on 07/12/22.
//

import SwiftUI

struct AboutView: View {
    var body: some View {
        ZStack {
            SwiftUI.Color(.white).ignoresSafeArea()
            ZStack {
                ScrollView {
                    VStack(spacing: 14) {
                        VStack(spacing: 14) {
                            Image("profile")
                                .resizable()
                                .frame(width: 100, height: 100)
                                .cornerRadius(100)

                            VStack(spacing: 4) {
                                Text("SepteHabudin")
                                    .font(.title3)
                                    .bold()
                                    .foregroundColor(Color.black)

                                Text("FullStack Developer")
                                    .font(.subheadline)
                                    .tracking(1)
                                    .foregroundColor(Color.black)
                            }

                            HStack(spacing: 50) {
                                ButtonView(url: "https://github.com/septe01", image: "git")
                                ButtonView(url: "https://www.instagram.com/septestia", image: "instagram")
                                ButtonView(url: "https://www.linkedin.com/in/septe-habudin/", image: "linkedin")
                            }
                            .padding(.top, 20)
                        }
                        .padding()

                        Divider()
                            .frame(height: 1)
                            .overlay(.gray)

                        Text("""
                               \tI am a FullStack Developer, I can build applications with javascript programming. when I make a web application I can use reactJs from my skills section, and when I make a mobile application I can use react native, as well as build a service I can use nodejs.
                               but currently I am a FrontEnd Developer at a technology company in Jakarta, my job is to build web applications with the javascript library, namely ReactJS.
                               """)
                        .font(.body)
                        .multilineTextAlignment(.leading)
                        .padding()
                        .foregroundColor(Color.black)

                    }
                    .padding(.top, 50)
                }

            }
        }
    }
}

struct ButtonView: View {
    var url = ""
    var image = ""
    var body: some View {
        Link(destination: URL(string: url)!) {
            Image(image)
                .resizable()
                .aspectRatio( contentMode: .fit)
                .frame(width: 20, height: 20)
        }
        .padding(.all, 10)
        .background(Color("ColorGreySoft"))
        .cornerRadius(30)
    }
}

struct AboutView_Previews: PreviewProvider {
    static var previews: some View {
        AboutView()
    }
}
