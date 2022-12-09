//
//  AboutView.swift
//  Capstone Project
//
//  Created by septe habudin on 07/12/22.
//

import SwiftUI

struct AboutView: View {

    @EnvironmentObject var profilePresenter: ProfilePresenter

    var body: some View {
        ZStack {
            SwiftUI.Color(.white).ignoresSafeArea()
            if profilePresenter.loadingState {
                VStack {
                    Text("Loading...")
                }
            } else {
                ZStack {
                    ScrollView {
                        VStack(spacing: 14) {
                            VStack(spacing: 14) {

                                if let profileImg = profilePresenter.profile {
                                    AsyncImage(url: URL(string: profileImg.img)) { Image in
                                        Image
                                            .resizable()
                                            .frame(width: 100, height: 100)
                                            .cornerRadius(100)
                                    } placeholder: {
                                        ProgressView()
                                            .progressViewStyle(CircularProgressViewStyle(tint: Color("ColorGreyDark")))
                                            .frame(width: 100, height: 100)

                                    }
                                }

                                VStack(spacing: 4) {
                                    Text(profilePresenter.profile?.name ?? "")
                                        .font(.title3)
                                        .bold()
                                        .foregroundColor(Color.black)

                                    Text(profilePresenter.profile?.title ?? "")
                                        .font(.subheadline)
                                        .tracking(1)
                                        .foregroundColor(Color.black)
                                }

                                HStack(spacing: 50) {
                                    if let profile = profilePresenter.profile {
                                        ButtonView(url: profile.git, image: "git")
                                        ButtonView(url: profile.instagram, image: "instagram")
                                        ButtonView(url: profile.linkedin, image: "linkedin")
                                    }
                                }
                                .padding(.top, 20)
                            }
                            .padding()

                            Divider()
                                .frame(height: 1)
                                .overlay(.gray)

                            Text("""
                               \t\(profilePresenter.profile?.bio ?? "")
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
        .onAppear(perform: {
            if self.profilePresenter.profile == nil {
                self.profilePresenter.getProfile()
            }
        })
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
    static let profilePresenter = ProfilePresenter(profileUseCase: Injection.init().provideProfile())
    
    static var previews: some View {
        AboutView().environmentObject(profilePresenter)
    }
}
