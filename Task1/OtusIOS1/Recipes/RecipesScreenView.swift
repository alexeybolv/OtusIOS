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

    enum Dish: String, CaseIterable {
        case salad
        case soup
    }

    @Published private(set) var items: [Recipe] = .init()
    @Published private(set) var page: Int = 0
    @Published private(set) var isPageLoading: Bool = false

    private var dish: Dish?

    func getItems(dish: Dish) -> [Recipe] {
        if self.dish != dish {
            page = 0
            items.removeAll()
            self.dish = dish
            loadPage()
        }
        return items
    }

    func loadPage() {
        guard isPageLoading == false else { return }
        isPageLoading = true
        page += 1
        RecipeAPI.getRecipe(i: "potato", q: dish?.rawValue ?? "", p: page) { (response, error) in
            if let results = response?.results {
                self.items.append(contentsOf: results)
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
    @State private var selectedDish: RecipesPuppyViewModel.Dish = .salad

    var body: some View {
        NavigationView {
            VStack {
                HStack {
                    Spacer(minLength: 30)
                    Picker(selection: $selectedDish, label: Text("")) {
                        ForEach(RecipesPuppyViewModel.Dish.allCases, id: \.self) {
                            Text($0.rawValue)
                        }
                    }
                    .pickerStyle(SegmentedPickerStyle())
                    Spacer(minLength: 30)
                }
                List(recipesPuppyViewModel.getItems(dish: selectedDish)) { item in
                    VStack(alignment: .leading) {
                        NavigationLink(destination: RecipeDetailsScreenView(recipe: item)) {
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
            }.navigationTitle("Recipes")
        }
    }
}

struct RecipeDetailsScreenView: View {

    let recipe: Recipe

    var body: some View {
        VStack {
            Text(recipe.title ?? "")
                .font(Font.system(size: 32.0, weight: .bold))
                .multilineTextAlignment(.center)
            List {
                Section(header: Text("Ingredients")) {
                    Text(recipe.ingredients ?? "")
                        .font(Font.system(size: 20.0))
                }
                Section(header: Text("Web")) {
                    NavigationLink(destination: RecipeWebScreenView(recipe: recipe)) {
                        Text(recipe.href)
                            .font(Font.system(size: 20.0))
                            .foregroundColor(.blue)
                    }
                }
            }
        }
    }
}

struct RecipeWebScreenView: View {

    let recipe: Recipe

    var body: some View {
        if let url = URL(string: recipe.href) {
            Webview(url: url)
        }
    }
}

struct RecipesScreenView_Previews: PreviewProvider {
    static var previews: some View {
        RecipesScreenView()
    }
}
