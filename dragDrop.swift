//
//  dragDrop.swift
//  ClimateChangeGroupApp
//
//  Created by Martin G. Zapryanov on 4/17/25.
//
import SwiftUI
import Algorithms

struct DragDropView: View {
    @State var items: [String] = ["Electronics📱💻", "CDs 💿", "Batteries 🔋", "Boxes📦", "Juice boxes 🧃", "Paper 📄", "Cans🥫", "Glass🫙🍾", "Used Tissues🧻", "Juice pouches", "Receipts 🧾", "Tires 🛞", "Plastic bags", "Ziploc bags", "Chip Bags", "Ice Cream container", "Styrofoam🥤", "Shoes 👞", "Medical waste 💉", "Car parts", "Pizza Boxes🍕"]
//    let recyclingItems: Set<String> = ["Electronics📱💻", "CDs 💿", "Batteries 🔋", "Boxes📦", "Juice boxes 🧃", "Paper 📄", "Cans🥫", "Glass🫙🍾", "Tires 🛞",]
//    let trashItems: Set<String> = ["Used Band-Aids🩹", "Juice pouches", "Receipts 🧾" ]
    @State var recycling: [String] = []
    @State var trash: [String] = []
    @State var isItemsTargeted = false
    @State var isTrashtargeted = false
    @State var isRecyclingtargeted = false
    let ElectronicsURL = URL(string: "https://epa.illinois.gov/topics/waste-management/materials-management/electronics-recycling1.html#:~:text=Did%20you%20know%20that%20it,are%20unwanted%20by%20Illinois%20residents."
    )
    
    var body: some View {
        HStack(spacing: 20) {
            SortView(title: "Sort the items!", tasks: items, isTargeted: isItemsTargeted)
                .font(.custom("Chalkboard SE", size: 15))
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
            
            if recycling.contains("Electronics📱💻") {
                Text("This is a tricky one! Most people mistakenly throw away their unwanted electronics, but they are actually recyclable! However, it is important to note that electronics cannot be recycled in traditional curbside recycling bins. Instead, they are recycled through special recycling events or drop-off locations to ensure the proper disposal of devices.")
                Link("Visit this EPA link for more information on special recycling circumstances for electronics!", destination: (ElectronicsURL!))
            } else if trash.contains("Electronics📱💻") {
                Text("Not quite! More than 20% of electronics get thrown away because many people do not know that they are in fact recyclable! However, the reason behind public skepticism is the special circumstances or recycling these items, namely recycling them through special recycling events or drop-off locations to ensure the proper disposal of devices.")
            }
            
            if recycling.contains("CDs 💿") {
                Text("Correct! CDs are usually made out of materials like polycarbonate plastic and aluminum, which are definitely recyclable! By recycling them, we are also conserving some of the resources that are key to the process of creating CDs, like natural gas, crude oil, and water.")
            } else if trash.contains("CDs 💿") {
                Text("Try again. CDs can't be put into landfills because the materials they are made out of (such as plastic) are not biodegradable.")
            }
            
            if recycling.contains("Batteries 🔋") {
                Text("Right! Most types of batteries are recyclabe, but the recycling of them should take place in special drop-off locations or special recycling programs due to their flammability if exposed to heat.")
            } else if trash.contains("Batteries 🔋") {
                Text("Good try. Batteries need to be recycled because if thrown away in landfills because the toxic chemicals within them can leak into and contaminate the environment.")
            }
            
            if recycling.contains("Boxes📦") {
                    Text("Correct! Cardboard boxes such as cereal boxes are recyclable! However, it is important to make sure the box you are recycling is flattened prior to throwing it in the bin to allow us to recycle even more items to save our environment.")
                } else if trash.contains("Boxes📦") {
                    Text("Try again! Cardboard boxes are definitely recyclable because it can be broken down and processed to make new cardboard materials such as new boxes, paper towels, tissues, and paper!")
                }
                
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
    

