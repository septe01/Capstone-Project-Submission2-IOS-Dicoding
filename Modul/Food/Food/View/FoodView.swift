//
//  FoodView.swift
//  Food
//
//  Created by septe habudin on 08/01/23.
//

import SwiftUI

public struct FoodView: View {
    @EnvironmentObject var foodPresenter: FoodPresenter

    public init() {}

    public var body: some View {

        ZStack {
          if foodPresenter.loadingState {
            VStack {
              Text("Loading...")
            }
          } else {
            ScrollView(.vertical, showsIndicators: false) {
              ForEach(
                self.foodPresenter.categories,
                id: \.id
              ) { category in
                ZStack {

                    self.foodPresenter.linkBuilder(for: category) {
                        FoodRow(category: category)
                    }.buttonStyle(PlainButtonStyle())

                }.padding(8)
              }
            }
          }
        } .onAppear(perform: {
                if self.foodPresenter.categories.isEmpty {
                    self.foodPresenter.getCategories()
                }
            })
        .navigationBarTitle(
          Text("Foods Apps"),
          displayMode: .automatic
        )
    }
}
