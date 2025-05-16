//
//  dragDrop.swift
//  ClimateChangeGroupApp
//
//  Created by Martin G. Zapryanov on 4/17/25.
//
import SwiftUI
import Algorithms

struct DragDropView: View {
    @State var items: [String] = ["Electronics📱💻", "CDs 💿", "Batteries 🔋", "Boxes📦", "Juice boxes 🧃", "Paper 📄", "Cans🥫", "Glass🫙🍾", "Used Tissues🧻", "Juice boxes 🧃", "Receipts 🧾", "Tires 🛞", "Plastic bags", "Ziploc bags", "Chip Bags", "Ice Cream containers", "Medical waste 💉", "Car parts", "Pizza Boxes🍕"]
    @State var recycling: [String] = []
    @State var trash: [String] = []
    @State var depends: [String] = []
    @State var isItemsTargeted = false
    @State var isTrashtargeted = false
    @State var isRecyclingtargeted = false
    @State var isDependstargeted = false
    let ElectronicsURL = URL(string: "https://epa.illinois.gov/topics/waste-management/materials-management/electronics-recycling1.html#:~:text=Did%20you%20know%20that%20it,are%20unwanted%20by%20Illinois%20residents.")
    @State var showRecycledElectronics: Bool = false
    @State var showTrashedElectronics: Bool = false
    @State var showDependsElectronics: Bool = false
    @State var showRecycledCDs: Bool = false
    @State var showTrashedCDs: Bool = false
    @State var showDependsCDs: Bool = false
    @State var showRecycledBatteries: Bool = false
    @State var showTrashedBatteries: Bool = false
    @State var showDependsBatteries: Bool = false
    @State var showRecycledBoxes: Bool = false
    @State var showTrashedBoxes: Bool = false
    @State var showDependsBoxes: Bool = false
    
    
    
    var body: some View {
        HStack(spacing: 20) {
            SortView(title: "Sort the items!", tasks: items, isTargeted: isItemsTargeted)
                .font(.custom("Chalkboard SE", size: 15))
                .dropDestination(for: String.self) { droppedItems, location in
                    for task in droppedItems {
                        trash.removeAll {$0 == task}
                        recycling.removeAll {$0 == task}
                        depends.removeAll {$0 == task}
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
                        depends.removeAll {$0 == task}
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
                        depends.removeAll {$0 == task}
                    }
                    let totalItems = recycling + droppedItems
                    recycling = Array(totalItems.uniqued())
                    return true
                } isTargeted: { isTargeted in
                    isRecyclingtargeted = isTargeted
                }
            
            SortView(title: "Depends", tasks: depends, isTargeted: isDependstargeted)
                .dropDestination(for: String.self) { droppedItems, location in
                    for task in droppedItems {
                        items.removeAll {$0 == task}
                        trash.removeAll {$0 == task}
                        recycling.removeAll {$0 == task}
                    }
                    let totalItems = depends + droppedItems
                    depends = Array(totalItems.uniqued())
                    return true
                } isTargeted: { isTargeted in
                    isDependstargeted = isTargeted
                }
            
            if recycling.contains("Electronics📱💻") {
                Button("Show Feedback") {
                    showRecycledElectronics.toggle()
                }
                .alert("This is a tricky one! Most people mistakenly throw away their unwanted electronics, but they are actually recyclable! However, it is important to note that electronics cannot be recycled in traditional curbside recycling bins.", isPresented: $showRecycledElectronics) {
                    
                }
                
            } else if trash.contains("Electronics📱💻") {
                Button("Show Feedback") {
                    showTrashedElectronics.toggle()
                }
                .alert("Not quite! More than 80% of electronics get thrown away because many people do not know that they are in fact recyclable! However, the reason behind public skepticism is the special circumstances or recycling these items, namely recycling them through special recycling events or drop-off locations to ensure the proper disposal of devices.", isPresented: $showTrashedElectronics) {
                    
                }
            } else if depends.contains("Electronics📱💻"){
                Button("Show Feedback") {
                    showDependsElectronics.toggle()
                }
                .alert("You got it! Due to their materials, electronics are recyclable, but putting them in a regular recycling bin poses a fire hazard, so it is best to recycle them through special drop-off locations or special recycling programs. In addition, you can ask your phone/tech provider like Verizon or T-Mobile if you can trade in your device for a newer one and dispose of your it that way! Click the link below to find out more about recycling electronics.", isPresented: $showDependsElectronics) {
                    
                }
                Link("Visit this EPA link for more information on special recycling circumstances for electronics!", destination: (ElectronicsURL!))
            }
            
            if recycling.contains("CDs 💿") {
                Button("Show Feedback") {
                    showRecycledCDs.toggle()
                }
                .alert("Correct...mostly! CDs are usually made out of materials like polycarbonate plastic and aluminum, which are definitely recyclable! By recycling them, we are also conserving some of the resources that are key to the process of creating CDs, like natural gas, crude oil, and water. However, because CDs are usually made of polycarbonate, this mix of plastics makes it kind of hard for standard recycling machines to recycle them. Try again!", isPresented: $showRecycledCDs) {
                    
                }
            } else if trash.contains("CDs 💿") {
                Button("Show Feedback") {
                    showTrashedCDs.toggle()
                }
                .alert("Try again. CDs can't be put into landfills because the materials they are made out of (such as plastic) are not biodegradable.", isPresented: $showTrashedCDs) {
                    
                }
                
            } else if depends.contains("CDs 💿"){
                Button("Show Feedback") {
                    showDependsCDs.toggle()
                }
                .alert("You got it! Due to their materials, CDs are recyclable, but due to their mixed-plastic composition, it is best to recycle them in places like local library drop-off stations, schools, or thrift-stores.", isPresented: $showDependsCDs) {
                    
                }
                
            }
            
            if recycling.contains("Batteries 🔋") {
                Button("Show Feedback") {
                    showRecycledBatteries.toggle()
                }
                .alert("Almost there! Most types of batteries are recyclable, but the recycling of them should take place in special drop-off locations or special recycling programs due to their flammability if exposed to heat.", isPresented: $showRecycledBatteries) {
                    
                }
                
            } else if trash.contains("Batteries 🔋") {
                Button("Show Feedback") {
                    showTrashedBatteries.toggle()
                }
                .alert("Good try. Batteries need to be recycled because if thrown away in landfills because the toxic chemicals within them can leak into and contaminate the environment.", isPresented: $showTrashedBatteries) {
                    
                }
                
            } else if depends.contains("Batteries 🔋"){
                Button("Show Feedback") {
                    showDependsBatteries.toggle()
                }
                .alert("Yes! Due to their flammability, batteries should be recycled in special drop-off locations or special recycling programs due to their flammability if exposed to heat. WHOAH! A lot of these are Depends! Recyclng is a tricky process that has a lot of rules and steps, so it's always good to know what to do with daily-use materials in order to save our planet!", isPresented: $showDependsBatteries) {
                    
                }
                
            }
            
            if recycling.contains("Boxes📦") {
                Button("Show Feedback") {
                    showRecycledBoxes.toggle()
                }
                .alert("Correct! Cardboard boxes such as cereal boxes are recyclable! However, it is important to make sure the box you are recycling is flattened prior to throwing it in the bin to allow us to recycle even more items to save our environment.", isPresented: $showRecycledBoxes) {
                    
                }
                
            } else if trash.contains("Boxes📦") {
                Button("Show Feedback") {
                    showTrashedBoxes.toggle()
                }
                .alert("Try again! Cardboard boxes are definitely recyclable because it can be broken down and processed to make new cardboard materials such as new boxes, paper towels, tissues, and paper!", isPresented: $showTrashedBoxes) {
                    
                }
            
            } else if depends.contains("Boxes📦"){
                Button("Show Feedback") {
                    showDependsBoxes.toggle()
                }
                .alert("This is a bit simpler. If anything could be normally recycled, it's cardboard boxes! Give this one another try!", isPresented: $showDependsBoxes) {
                    
                }
                
            }
            
            if recycling.contains("Juice boxes 🧃") {
                Text("Yes! Juice boxes are recyclable because they are often made of plastic, paperboard, and aluminum, all of which are recyclable!")
            } else if trash.contains("Juice boxes 🧃") {
                Text("Oops! juice boxes are made of a combination of plastic, paper, and aluminum, which definitely makes them recyclable.")
            } else if depends.contains("Juice boxes 🧃"){
                Text("Oops! Try this one again! Hint: Juice boxes are usually made of cardboard and some metal!")
            }
            
            if recycling.contains("Paper 📄") {
                Text("Correct! Paper is definitely recyclable because it is made of the most important and abundant renewable resource- trees!")
            } else if trash.contains("Paper 📄") {
                Text("Oops! When you think of recycling, paper should definitely ring a bell! Paper is made of wood, meaning it is recyclable.")
            } else if depends.contains("Paper 📄"){
                Text("Try this one again! Hint: Paper is made of wood/plant material!")
            }
            
            if recycling.contains("Cans🥫") {
                Text("Yes! Cans are usually made of aluminum or other metals and alloys, which are recyclable. These metals also include steel, copper, brass, tin, and others as well. In fact, almost all metals are recyclable (except of course ones that are radioactive, which we hope you aren't recycling...)")
            } else if trash.contains("Cans🥫") {
                Text("Incorrect. Cans are almost always made of metals such as aluminum and tin, which are recyclable!")
            } else if depends.contains("Cans🥫"){
                Text("Try again! This one is simpler than you think as it is almost always made of metal!")
            }
            
            if recycling.contains("Glass🫙🍾") {
                Text("Correct, glass is recyclable! It can be melted and reformed into new class infinitely without losing its quality!")
            } else if trash.contains("Glass🫙🍾") {
                Text("Try again! Glass is recyclable because it can be melted and formed into new glass!")
            } else if depends.contains("Glass🫙🍾"){
                Text("Almost there! Even though glass is usually sharp, it is a basic material that can be recycled.")
            }
            
            if recycling.contains("Used Tissues🧻") {
                Text("Good Try! Even though they are made of paper, tissues are actually made up of shorter and weaker fibers that make them unable to be re-processed into new products. Additionally, tissues have residue on them from during their use. This makes it best for them to be thrown away")
            } else if trash.contains("Used Tissues🧻") {
                Text("Correct! Tissues are made up of shorter and weaker fibers that make them unable to be re-processed into new products. In addition, when we use tissues, there is usually residue on them, preventing them from being able to be reprocessed.")
            } else if depends.contains("Used Tissues🧻"){
                Text("Try again! This one's a bit easier. When we use tissues, we usually leave behind residue on them, which makes them unable to be reprocessed.")
            }
            
            if recycling.contains("Juice pouches") {
                Text("Incorrect. Even though juice pouches are able to be recycled, their materials are often laminated together, which makes them difficult to separate. The next time you grab a CapriSun, make sure to throw it out instead of recycling it!")
            } else if trash.contains("Juice pouches") {
                Text("Correct! Juice pouches'' materials are often laminated together, which makes them difficult to separate. Just throwing them in the trash works best for them!")
            } else if depends.contains("Juice pouches") {
                Text("Another hard one! Unlike their juice BOX counterparts, juice pouches are actually made of laminated materials, which makes them difficult to recycle at all.")
            }
            
            if recycling.contains("Receipts 🧾") {
                Text("This is an extremely tricky one! Although receipts look like just another piece of paper that can be recycled, they are actually made with thermal paper, a material which contains toxic chemicals like BPA and BPS, which allows for ink to be printed on again. As a result, it is easier to throw them out to prevent contamination in the recycling system. Now you know!")
            } else if trash.contains("Receipts 🧾") {
                Text("Correct! Receipts are usually printed on thermal paper in order to allow ink to be printed on them. This material contains BPA and BPS, which are toxic chemicals, making receipts very hard to recycle and ultimately better for them to be thrown out to prevent contamination.")
            } else if depends.contains("Receipts 🧾") {
                Text("Oooh so close! Recepts are made of paper, but the paper they are made with is thermal paper to allow for cheap production, inkless printing and heat resistance! Try again!")
            }
            
            if recycling.contains("Tires 🛞") {
                Text("Close! It is much more environmentally friendly to recycle tires because if they were to be trashed, they are burnt, which results in pollution. However, it is important to note that tires cannot be recycled in curbside bins because they don't fit and have materials that need to be separated through special processes. Check with your city to see where there are specialized tire drop-off locations to properly dispose of them!")
            } else if trash.contains("Tires 🛞") {
                Text("Try one more time! As a matter of fact, tires can be recycled because they are not biodegradable and they are usually burned in landfills, which releases harmful chemicals into the air.")
            } else if depends.contains("Tires 🛞") {
                Text("Correct! Because tires are large, they don't really fit into most recycling bins and have materials that need to be separated through special processes, making this item a perfect fit for this category. Check with your city to see where there are specialized tire drop-off locations to properly dispose of them!")
            }
            
            if recycling.contains("Plastic bags") {
                Text("Another tricky one! Plastic bags can be recycled, but they need to be once again recycled in special places that collect plastics bags for recycling. Usually one of these locations is near you, like in your local Target or Walmart! When recycled, plastic bags are turned into plastic pellets that could be used to produce new plastic bags or other plastic materials.")
            } else if trash.contains("Plastic bags") {
                Text("Uh-oh! Although plastic bags can't be recycled normally, they still need to be recycled through special programs because if we were to put them in landfills, it would take thousands of years for them to degrade into the soil. Recycling here is your best bet, but make sure to check locally to see where such programs can take place. ")
            } else if depends.contains("Plastic bags") {
                Text("Right on! Plastic bags are recyclable, but they need to be recycled in special places that collect plastics bags for recycling. Usually one of these locations is near you, like in your local Target or Walmart! When recycled, plastic bags are turned into plastic pellets that could be used to produce new plastic bags or other plastic materials.")
            }
            
            if recycling.contains("Ziploc bags") {
                Text("Almost! Ziploc bags are recyclable because they are made of plain plastic. However, it would be safe to drop them off at separate locations like with plastic bags because they could cause problems with recycling machinery.")
            } else if trash.contains("Ziploc bags") {
                Text("Try again! Ziploc bags are made of plastic, which does make them recyclable!")
            } else if depends.contains("Ziploc bags") {
                Text("Yup! Because Ziploc bags are made of plain plastic, they can be recycled, but their plastic composition could give the recycling machinery a hard time processing them! So, it's best to drop them off at separate locations like with plastic bags!")
            }
            
            if recycling.contains("Chip Bags") {
                Text("Not quite! Chip bags often contain metal or other materials that can damage recycling machinery. Try to find a different location to drop them off!")
            } else if trash.contains("Chip Bags") {
                Text("Not quite! Chip bags are not degradable, so they need to be disposed of another way!")
            } else if depends.contains("Chip Bags") {
                Text("Yes! Because chip bags are made of mixed materials that are fused together, it makes it hard for them to get recycled, but through sepcial recycling locations, they can be recycled!")
            }
            
            if recycling.contains("Ice Cream containers") {
                Text("While they may seem to be recyclable, most ice cream containers have wax or plastic linings that prevent them from being able to be recycled regularly. Try Again!")
            } else if trash.contains("Ice Cream containers") {
                Text("Oops! Ice cream containers are recyclable due to the use of plastic and paper to make them.")
            } else if depends.contains("Ice Cream containers") {
                Text("Yes! Because ice cream containers are made of paper and plastic, they can be recycled! However, they are also usually coated with special chemical coatings in order to withstand freezing or leakages, which makes it hard for them to be recycled regularly, but instead through special recycling locations just for these types of materials.")
            }
            
            if recycling.contains("Medical waste 💉") {
                Text("Almost, but here's the catch: even though materials of medical waste are recyclable, they must be disposed of in special, designated locations due to their potential for contamination and possibly sharp edges, such as insulin syringes.")
            } else if trash.contains("Medical waste 💉") {
                Text("Try again! Medical waste is usually recyclable due to its recyclable materials, but sort this item again to find out how to properly recycle these materials.")
            } else if depends.contains("Medical waste 💉") {
                Text("Absolutely! although medical waste is recyclable, it is not curbside recyclable due to its potential for contamination and possibly sharp edges. Instead, check with locale to find out about designated areas to recycle this type of material in the safest way possible!")
            }
            
            if recycling.contains("Car parts") {
                Text("Correct, but due to their large size, we can't usually recycle these items in regular recycling bins where we might usually recycle small juice boxes. Try again to find out what exactly to do with these materials!")
            } else if trash.contains("Car parts") {
                Text("This is a tough one! Car parts can in fact be recycled because they are often composed of materials like steel, aluminum, and plastic, which can be repurposed for other car parts and materials.")
            } else if depends.contains("Car parts") {
                Text("Correct! Car parts aren't recyclable in curbside recycling bins, but instead in special areas because they are oversized. You can usually recycle these in scrap metal recycling centers, salvage yards, or at local auto parts stores like AutoZone if they accept them.")
            }
            
            if recycling.contains("Pizza Boxes🍕") {
                Text("This one's a bit of a curveball! Even though pizza boxes are usually made of cardboard, the food inside them usually leaves grease on the cardboard, making it hard for them to recycle.")
            } else if trash.contains("Pizza Boxes🍕") {
                Text("Yep! Because pizzas usually leave greasy residue on the cardboard box, it's hard for them to be recycled, so your best bet is to just throw it in the trash.")
            } else if depends.contains("Pizza Boxes🍕") {
                Text("Good try, pizza boxes are tricky because they are made of cardboard, but greasy food can make them hard to recycle. However, there is one more specific correct answer here.")
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
                    .frame(maxWidth: 250, maxHeight: .infinity)
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


