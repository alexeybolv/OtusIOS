//
//  RecipesScreenView.swift
//  OtusIOS1
//
//  Created by Alexey Bolvonovich on 24.03.21.
//

import SwiftUI
import Networking

final class RecipesPuppyViewModel {

    @Published private(set) var items: [Recipe] = .init()
    @Published private(set) var page: Int = 0
    @Published private(set) var isPageLoading: Bool = false

    func loadPage() {
        guard isPageLoading == false else { return }
        isPageLoading = true
        page += 1
        RecipeAPI.getRecipe(i: "potato", q: "salad", p: page) { (response, error) in
            if let results = response?.results {
                self.items.append(contentsOf: results)
                print(results)
            }
            self.isPageLoading = false
        }
    }
}

struct RecipesScreenView: View {
    var body: some View {
        Text(/*@START_MENU_TOKEN@*/"Hello, World!"/*@END_MENU_TOKEN@*/)
    }
}

struct RecipesScreenView_Previews: PreviewProvider {
    static var previews: some View {
        RecipesScreenView()
    }
}
