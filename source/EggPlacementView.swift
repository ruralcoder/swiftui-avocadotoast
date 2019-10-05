//
//  EggPlacementView.swift
//  avocadotoast
//
//  Created by Stephen Anderson on 10/4/19.
//  Copyright © 2019 Ruralcoder. All rights reserved.
//

import SwiftUI

struct EggPlacementView: View {
    @State var eggPlacement: UnitPoint = UnitPoint(x: 0, y: 0)
    var body: some View {
        ZStack {
            Image("toast").resizable().aspectRatio(contentMode: .fit).padding()
            DraggableEgg(eggPlacement: $eggPlacement)
        }.navigationBarTitle(Text("Egg Placement"))
    }
    
    
}

struct DraggableEgg: View {
    
    @GestureState var dragState = DragState.inactive
    @Binding var eggPlacement: UnitPoint
    
    enum DragState {
        case inactive
        case pressing
        case dragging(translation: CGSize)
        
        var translation: CGSize {
            switch self {
            case .inactive, .pressing:
                return .zero
            case .dragging(let translation):
                return translation
            }
        }
        
        var isActive: Bool {
            switch self {
            case .inactive:
                return false
            case .pressing, .dragging:
                return true
            }
        }
        
        var isDragging: Bool {
            switch self {
            case .inactive, .pressing:
                return false
            case .dragging:
                return true
            }
        }
    }
    
    var body: some View {
        let minimumLongPressDuration = 0.0
        let gesture = LongPressGesture(minimumDuration: minimumLongPressDuration)
            .sequenced(before: DragGesture())
            .updating($dragState) { value, state, transaction in
                switch value {
                // Long press begins.
                case .first(true):
                    state = .pressing
                // Long press confirmed, dragging may begin.
                case .second(true, let drag):
                    state = .dragging(translation: drag?.translation ?? .zero)
                // Dragging ended or the long press cancelled.
                default:
                    state = .inactive
                }
        }
        .onEnded { value in
            guard case .second(true, let drag?) = value else { return }
            self.eggPlacement.x = drag.location.x
            self.eggPlacement.y = drag.location.y
        }
    
        return Image("egg")
            .resizable()
            .overlay(dragState.isDragging ? Circle().stroke(Color.white, lineWidth: 2) : nil)
            .frame(width: 200, height: 200, alignment: .center)
            .offset(
                x: self.eggPlacement.x,
                y: self.eggPlacement.y
        )
            .animation(nil)
            .shadow(radius: dragState.isActive ? 8 : 0)
            .animation(.easeIn)
            .gesture(gesture)
    }
}
    







struct EggPlacementView_Previews: PreviewProvider {
    
    static var previews: some View {
        NavigationView {
            EggPlacementView()
        }
    }
}
