//
//  StatisticsPage.swift
//  ClimateChangeGroupApp
//
//  Created by Calliope Epstein-Pawlak on 4/17/25.
//

import SwiftUI

struct StatisticsPage: View {
    var body: some View {
        VStack{
            Image(systemName: "leaf.circle.fill")
                .font(.largeTitle)
                .padding()
            Text("Statistics About Climate Change")
                .font(.custom("Courier", size: 40))
                .padding()
            VStack{
                Text("''The bottled water industry generated roughly 600 billion plastic bottles and containers in 2021, according to the report. This resulted in around 25 million tons of plastic waste — most of which is not recycled and ends up in landfills.''")
                    .font(.custom("Courier", size: 15))
                    .padding()
                Text("''However, around 1 million plants and animals are currently under the threat of extinction, and climate change is a key driver, along with other forms of habitat destruction.''")
                    .font(.custom("Courier", size: 16))
                    .padding()
                Text("''While we cannot stop global warming overnight, we can slow the rate and limit the amount of global warming by reducing human emissions of heat-trapping gases and soot.''")
                    .font(.custom("Courier", size: 16))
                    .padding()
                Text("''The world must make significant progress toward decarbonization (reducing carbon from the atmosphere and replacing fossil fuels in our economies) by 2030 and commit ourselves to reaching net zero carbon emissions by 2050.''")
                    .font(.custom("Courier", size: 16))
                    .padding()
                Text("''As of 2024, over 13,000,000 barrels of oil have been produced each day in the world, an immense contributor to climate change.''")
                    .font(.custom("Courier", size: 16))
                    .padding()
                Text("''While numerous scientific studies have attempted to model the amount of plastics that enter the ocean every year, the most comprehensive estimate to date predicts some 11 million metric tons of these plastics that should have gone to a landfill or other waste management center but end up in the ocean instead. That’s equivalent to more than a garbage truck’s worth of plastics entering the ocean each minute.''")
                    .font(.custom("Courier", size: 16))
                    .padding()
                Text("''The total generation of municipal solid waste (MSW) in 2018 was 292.4 million tons (U.S. short tons, unless specified) or 4.9 pounds per person per day. Of the MSW generated, approximately 69 million tons were recycled and 25 million tons were composted.''")
                    .font(.custom("Courier", size: 16))
                
                //BIBI!!! add a button that redirects to the article urls. i lowkey forgot how to do it tho so i gotta remind myself rq.
            }
            .padding()
        }
    }
}

#Preview {
    StatisticsPage()
}
