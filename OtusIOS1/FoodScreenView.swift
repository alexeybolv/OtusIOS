//
//  FoodScreenView.swift
//  OtusIOS1
//
//  Created by Alexey Bolvonovich on 14.03.21.
//

import SwiftUI

final class FoodScreenViewModel: ObservableObject {

    @Published private(set) var foods = [
        Food(name: "Strawberry", emoji: "🍓", isFave: false),
        Food(name: "Apple", emoji: "🍏", isFave: true),
        Food(name: "Cheese", emoji: "🧀", isFave: false),
        Food(name: "Tomato", emoji: "🍅", isFave: true)
    ]
}

struct Food {
    let name: String
    let emoji: String
    let isFave: Bool
}

extension Food: Identifiable {
    var id: String {
        name
    }
}

struct FoodScreenView: View {

    @ObservedObject var viewModel: FoodScreenViewModel = .init()

    @State var favesShowed: Bool = false

    var body: some View {
        NavigationView {
            List {
                FilterView(favesShowed: $favesShowed)
                ForEach(viewModel.foods) { item in
                    if !favesShowed || item.isFave {
                        FoodListCell(food: item)
                    }
                }
            }
            .navigationTitle("Food")
        }
    }
}

struct FilterView: View {

    @Binding var favesShowed: Bool

    var body: some View {
        Toggle(isOn: $favesShowed) {
            Text("Favorites")
        }
    }
}

struct FoodListCell: View {

    let food: Food

    var body: some View {
        NavigationLink(destination: FoodDetailsScreenView(emoji: food.emoji)) {
            Text(food.name)
        }
    }
}

struct FoodScreenView_Previews: PreviewProvider {
    static var previews: some View {
        FoodScreenView()
    }
}
