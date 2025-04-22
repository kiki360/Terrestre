//
//  dragDrop.swift
//  ClimateChangeGroupApp
//
//  Created by Martin G. Zapryanov on 4/17/25.
//
import SwiftUI

struct DragDropView: View {
    @State var items: [String] = ["Electronics 📱💻", "CDs 💿", "Batteries 🔋", "Boxes📦", "Balls ⚽️", "Juice boxes 🧃", "Paper 📄", "Cans🥫", "Glass jars 🫙", "Glass bottles🍾", "Used Band-Aids🩹", "Juice pouches", "Receipts 🧾", "Tires 🛞", "Loose plastic bags", "Ziploc bags", "Chip Bags", "Ice Cream container", "styrofoam 🥤", "Shoes 👞", "Medical waste 💉", "Diapers", "Car parts"]
    @State var recycling: [String] = []
    @State var trash: [String] = []
    
    var body: some View {
        HStack(spacing: 20) {
            
        }
        
    }
}


struct SortView: View {
    
    let title: String
    let tasks: [String]
    
    var body: some View {
        Text("Hi")
    }
}

