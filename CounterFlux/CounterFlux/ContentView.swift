//
//  ContentView.swift
//  CounterFlux
//
//  Created by Alexey Bolvonovich on 20.06.21.
//

import SwiftUI
import Combine

final class Store <State, Action>: ObservableObject {

    typealias Reducer = (State, Action) -> State

    private let reducer: Reducer

    @Published var state: State

    init(firstState: State, reducer: @escaping Reducer) {
        state = firstState
        self.reducer = reducer
    }

    func dispatch(action: Action) {
        state = reducer(state, action)

    }
}

struct ContentView: View {

    enum Action {
        case increment
        case decrement
    }

    @ObservedObject var counterStore = Store<Int, Action>(firstState: 0) { previousState, action in
        switch action {
        case .increment:
            return previousState + 1
        case .decrement:
            return previousState - 1
        }
    }

    var body: some View {
        VStack {
            Text("\(counterStore.state)")
                .font(.largeTitle)
                .padding(.bottom, 20)
            HStack(spacing: 20) {
                Button {
                    counterStore.dispatch(action: .increment)
                } label: {
                    Text("Up")
                }
                Button {
                    counterStore.dispatch(action: .decrement)
                } label: {
                    Text("Down")
                }
            }
        }
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
