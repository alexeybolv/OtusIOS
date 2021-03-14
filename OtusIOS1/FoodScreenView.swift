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

    @EnvironmentObject var viewModel: FoodScreenViewModel
    @EnvironmentObject var router: Router

    @State var favesShowed: Bool = false

    var body: some View {
        NavigationView {
            List {
                QuickButtons()
                FilterView(favesShowed: $favesShowed)
                ForEach(viewModel.foods) { item in
                    if !favesShowed || item.isFave {
                        FoodListCell(food: item)
                    }
                }
            }
            .navigationTitle("Food")
            .navigationBarTitleDisplayMode(.inline)
            .overlay(NavigationLink(destination: FoodDetailsScreenView(emoji: "🥜"),
                     isActive: $router.isSuperFoodShowed) {
                EmptyView().hidden()
            })
        }
    }
}

struct QuickButtons: View {

    var body: some View {
        HStack {
            Spacer()
            Image(systemName: "function")
                .padding()
                .frame(width: 50, height: 50)
                .background(Color.gray)
                .foregroundColor(.white)
                .cornerRadius(8)
            Spacer()
            Image(systemName: "airplane")
                .padding()
                .frame(width: 50, height: 50)
                .background(Color.gray)
                .foregroundColor(.white)
                .cornerRadius(8)
            Spacer()
            Image(systemName: "ipod")
                .padding()
                .frame(width: 50, height: 50)
                .background(Color.gray)
                .foregroundColor(.white)
                .cornerRadius(8)
            Spacer()
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
