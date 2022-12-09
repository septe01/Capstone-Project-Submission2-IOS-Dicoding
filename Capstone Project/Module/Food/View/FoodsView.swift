//
//  FoodsView.swift
//  Capstone Project
//
//  Created by septe habudin on 07/12/22.
//

import SwiftUI

struct FoodsView: View {
    @EnvironmentObject var foodPresenter: FoodPresenter

    var body: some View {

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
                    FoodRow(category: category)
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

struct FoodsView_Previews: PreviewProvider {
    static let foodPresent = FoodPresenter(categoryUseCase: Injection.init().provideCategory())
    static var previews: some View {
        FoodsView().environmentObject(foodPresent)
    }
}
