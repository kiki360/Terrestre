//
//  dragDrop.swift
//  ClimateChangeGroupApp
//
//  Created by Martin G. Zapryanov on 4/17/25.
//
import SwiftUI
import Algorithms

struct DragDropView: View {
    @State var items: [String] = ["Electronics📱💻", "CDs 💿", "Batteries 🔋", "Boxes📦", "Juice boxes 🧃", "Paper 📄", "Cans🥫", "Glass🫙🍾", "Used Band-Aids🩹", "Juice pouches", "Receipts 🧾", "Tires 🛞", "Plastic bags", "Ziploc bags", "Chip Bags", "Ice Cream container", "Styrofoam🥤", "Shoes 👞", "Medical waste 💉", "Car parts"]
    @State var recycling: [String] = []
    @State var trash: [String] = []
    @State var isItemsTargeted = false
    @State var isTrashtargeted = false
    @State var isRecyclingtargeted = false
    
    var body: some View {
        ZStack{
            Circle()
            HStack(spacing: 20) {
                SortView(title: "Sort the items!", tasks: items, isTargeted: isItemsTargeted)
                    .font(.custom("Chalkboard SE", size: 15))
                //Change the color of the text Here!
                    .dropDestination(for: String.self) { droppedItems, location in
                        for task in droppedItems {
                            trash.removeAll {$0 == task}
                            recycling.removeAll {$0 == task}
                        }
                        let totalItems = items + droppedItems
                        items = Array(totalItems.uniqued())
                        return true
                    } isTargeted: { isTargeted in
                        isItemsTargeted = isTargeted
                    }
                SortView(title: "🗑️ Trash", tasks: trash, isTargeted: isTrashtargeted)
                    .font(.custom("Chalkboard SE", size: 15))
                //Change the color of the text Here!
                    .dropDestination(for: String.self) { droppedItems, location in
                        for task in droppedItems {
                            items.removeAll {$0 == task}
                            recycling.removeAll {$0 == task}
                        }
                        let totalItems = trash + droppedItems
                        trash = Array(totalItems.uniqued())
                        return true
                    } isTargeted: { isTargeted in
                        isTrashtargeted = isTargeted
                    }
                
                SortView(title: "♻️ Recycling", tasks: recycling, isTargeted: isRecyclingtargeted)
                    .font(.custom("Chalkboard SE", size: 15))
                //Change the color of the text Here!
                    .dropDestination(for: String.self) { droppedItems, location in
                        for task in droppedItems {
                            items.removeAll {$0 == task}
                            trash.removeAll {$0 == task}
                        }
                        let totalItems = recycling + droppedItems
                        recycling = Array(totalItems.uniqued())
                        return true
                    } isTargeted: { isTargeted in
                        isRecyclingtargeted = isTargeted
                    }
                
            }
            .padding()
            .opacity(0.8)
        }
    }
}



struct SortView: View {
    
    let title: String
    let tasks: [String]
    let isTargeted: Bool
    
    var body: some View {
        VStack(alignment: .leading) {
            Text(title)
                .font(.largeTitle)
            
            ZStack {
                RoundedRectangle(cornerRadius: 12)
                    .frame(maxWidth: 250, maxHeight: 718)
                    .foregroundStyle(isTargeted ? .teal.opacity(0.15) :Color(.secondarySystemFill))
                
                VStack(alignment: .leading, spacing: 12) {
                    ForEach(tasks, id: \.self) { task in
                        Text(task)
                            .background(Color(uiColor: .secondarySystemGroupedBackground))
                            .cornerRadius(8)
                            .shadow(radius: 1, x: 1, y: 1)
                            .draggable(task)
                    }
                    Spacer()
                }
                .padding(.vertical)
            }
        }
    }
}
