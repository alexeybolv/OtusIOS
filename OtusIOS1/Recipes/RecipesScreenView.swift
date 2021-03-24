//
//  RecipesScreenView.swift
//  OtusIOS1
//
//  Created by Alexey Bolvonovich on 24.03.21.
//

import SwiftUI
import Networking
import UIComponents

final class RecipesPuppyViewModel: ObservableObject {

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

extension Recipe: Identifiable {

    public var id: String {
        href
    }
}

struct RecipeCell: View {

    @EnvironmentObject var recipesPuppyViewModel: RecipesPuppyViewModel

    var item: Recipe

    var body: some View {
        VStack(alignment: .leading) {
            Text(item.title.asStringOrEmpty.trim())
                .font(.headline)
            Text(item.ingredients.asStringOrEmpty)
                .font(.callout)
                .foregroundColor(.gray)
            if recipesPuppyViewModel.isPageLoading && recipesPuppyViewModel.items.isLast(item) {
                Divider()
            }
        }
    }
}

struct RecipesScreenView: View {

    @ObservedObject var recipesPuppyViewModel: RecipesPuppyViewModel = .init()

    var body: some View {
        NavigationView {
            List(recipesPuppyViewModel.items) { item in
                VStack(alignment: .leading) {
                    NavigationLink(destination: RecipeDetailsScreenView()) {
                        RecipeCell(item: item)
                            .environmentObject(recipesPuppyViewModel)
                            .onAppear() {
                                if recipesPuppyViewModel.items.isLast(item) {
                                    recipesPuppyViewModel.loadPage()
                                }
                            }
                    }
                }
            } // List
            .navigationTitle("Recipes")
            .onAppear() {
                recipesPuppyViewModel.loadPage()
            }
        }
    }
}

struct RecipeDetailsScreenView: View {

    var body: some View {
        Text("🍓")
            .font(Font.system(size: 200.0))
    }
}

struct RecipesScreenView_Previews: PreviewProvider {
    static var previews: some View {
        RecipesScreenView()
    }
}
