//
//  StatisticsPage.swift
//  ClimateChangeGroupApp
//
//  Created by Calliope Epstein-Pawlak on 4/17/25.
//

import SwiftUI

struct StatisticsPage: View {
    //let appleURL = URL(string: "https://www.apple.com")
    let firstURL = URL(string: "https:www.cnn.com/2023/03/16/world/plastic-water-bottles-un-report-climate/index.html")
    let secondURL = URL(string: "https://www.un.org/en/climatechange/science/climate-issues/biodiversity")
    let thirdURL = URL(string: "http://Climate.gov")
    let fourthURL = URL(string: "https://www.nature.org/en-us/what-we-do/our-priorities/tackle-climate-change/climate-change-stories/climate-change-frequently-asked-questions/#:~:text=The%20best%20science%20we%20have,agriculture,%20electricity,%20and%20industry.")
    let fifthURL = URL(string: "https://www.eia.gov/dnav/pet/hist/leafhandler.ashx?n=pet&s=mcrfpus2&f=m")
    let sixthURL = URL(string: "https://oceanconservancy.org/blog/2023/10/23/how-much-trash-is-in-the-ocean/")
    let seventhURL = URL(string: "https://www.epa.gov/facts-and-figures-about-materials-waste-and-recycling/national-overview-facts-and-figures-materials")
    var body: some View {
        //Link("Link View Example", destination: appleURL!)
        VStack{
            HStack{
                Image(systemName: "leaf.circle.fill")
                    .font(.largeTitle)
                Text("Statistics About Climate Change")
                    .font(.custom("Courier", size: 40))
                Image(systemName: "leaf.circle.fill")
                    .font(.largeTitle)
            }
            Text("''The bottled water industry generated roughly 600 billion plastic bottles and containers in 2021, according to the report. This resulted in around 25 million tons of plastic waste — most of which is not recycled and ends up in landfills.''")
                .font(.custom("Courier", size: 14))
                .padding()
            Link("Go To Article Source", destination: (firstURL!))
                .font(.caption)
            Text("''However, around 1 million plants and animals are currently under the threat of extinction, and climate change is a key driver, along with other forms of habitat destruction.''")
                .font(.custom("Courier", size: 14))
                .padding()
            Link("Go To Article Source", destination: (secondURL!))
                .font(.caption)
            Text("''While we cannot stop global warming overnight, we can slow the rate and limit the amount of global warming by reducing human emissions of heat-trapping gases and soot.''")
                .font(.custom("Courier", size: 14))
                .padding()
            Link("Go To Article Source", destination: (thirdURL!))
                .font(.caption)
            Text("''The world must make significant progress toward decarbonization (reducing carbon from the atmosphere and replacing fossil fuels in our economies) by 2030 and commit ourselves to reaching net zero carbon emissions by 2050.''")
                .font(.custom("Courier", size: 14))
                .padding()
            Link("Go To Article Source", destination: (fourthURL!))
                .font(.caption)
            Text("''As of 2024, over 13,000,000 barrels of oil have been produced each day in the world, an immense contributor to climate change.''")
                .font(.custom("Courier", size: 14))
                .padding()
            Link("Go To Article Source", destination: (fifthURL!))
                .font(.caption)
            Text("''While numerous scientific studies have attempted to model the amount of plastics that enter the ocean every year, the most comprehensive estimate to date predicts some 11 million metric tons of these plastics that should have gone to a landfill or other waste management center but end up in the ocean instead. That’s equivalent to more than a garbage truck’s worth of plastics entering the ocean each minute.''")
                .font(.custom("Courier", size: 14))
                .padding()
            Link("Go To Article Source", destination: (sixthURL!))
                .font(.caption)
            Text("''The total generation of municipal solid waste (MSW) in 2018 was 292.4 million tons (U.S. short tons, unless specified) or 4.9 pounds per person per day. Of the MSW generated, approximately 69 million tons were recycled and 25 million tons were composted.''")
                .font(.custom("Courier", size: 14))
                .padding()
            Link("Go To Article Source", destination: (seventhURL!))
                .font(.caption)
            
            //i did it.
        }
        .padding()
    }
}

#Preview {
    StatisticsPage()
}
