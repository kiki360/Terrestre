//
//  StatisticsPage.swift
//  ClimateChangeGroupApp
//
//  Created by Calliope Epstein-Pawlak on 4/17/25.
//

import SwiftUI

struct StatisticsPage: View {
    var body: some View {
        Text("Statistics About Climate Change")
            .font(.custom("Courier", size: 40))
        HStack{
            Text("''The bottled water industry generated roughly 600 billion plastic bottles and containers in 2021, according to the report. This resulted in around 25 million tons of plastic waste — most of which is not recycled and ends up in landfills.''")
                .font(.custom("Courier", size: 20))
            //BIBI!!! add a button that redirects to the articles. i lowkey forgot how to do it tho so i gotta remind myself rq.
        }
    }
}

#Preview {
    StatisticsPage()
}
