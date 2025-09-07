//
//  EncyclopediaViewModel.swift
//  TH40
//
//  Created by IGOR on 07/09/2025.
//

import SwiftUI

final class EncyclopediaViewModel: ObservableObject {
    
    @Published var isDetail: Bool = false
    @Published var isDelete: Bool = false
    @Published var isSettings: Bool = false
    
    @Published var selectedGuide: EncyclopediaModel?
    
    @Published var guides: [EncyclopediaModel] = [
        
        EncyclopediaModel(cname: "Eastern Coral Snake", image: "1", lname: "Micrurus fulvius", des: "A venomous species of snake known for its red, yellow, and black banding.", hab: "Found in the southeastern United States, especially in sandy soils.", feed: "Primarily feeds on small reptiles and amphibians. Eggs laid underground.", stat: "Not listed"),
        EncyclopediaModel(cname: "Bearded Dragon", image: "2", lname: "Pogona vitticeps", des: "A popular pet lizard known for its 'beard' that puffs out when threatened.", hab: "Native to arid, desert regions of central Australia.", feed: "Omnivorous, eats insects, small vertebrates, and vegetation. Lays eggs in burrows.", stat: "Not listed"),
        EncyclopediaModel(cname: "Red-eyed Tree Frog", image: "3", lname: "Agalychnis callidryas", des: "A small amphibian with vibrant green body and striking red eyes.", hab: "Found in tropical rainforests of Central America.", feed: "Carnivorous, feeding on insects. Lays eggs on leaves overhanging water.", stat: "Least concern"),
        EncyclopediaModel(cname: "Ball Python", image: "4", lname: "Python regius", des: "A non-venomous snake that is often kept as a pet due to its docile nature.", hab: "Native to sub-Saharan Africa, often found in savannas and grasslands.", feed: "Feeds on small mammals and birds. Lays eggs in burrows.", stat: "Not listed"),
        EncyclopediaModel(cname: "King Cobra", image: "5", lname: "Ophiophagus hannah", des: "The world's longest venomous snake, known for its hooded display.", hab: "Found in forests and grasslands throughout Southeast Asia.", feed: "Feeds primarily on other snakes. Lays eggs in a burrow or sheltered area.", stat: "Vulnerable"),
        EncyclopediaModel(cname: "Gila Monster", image: "6", lname: "Heloderma suspectum", des: "One of the few venomous lizards, known for its colorful, bumpy skin.", hab: "Native to the deserts of the southwestern United States and northern Mexico.", feed: "Carnivorous, eating small mammals, birds, and eggs. Lays eggs in burrows.", stat: "Near threatened"),
        EncyclopediaModel(cname: "Green Sea Turtle", image: "7", lname: "Chelonia mydas", des: "A large sea turtle known for its greenish-colored fat and its gentle nature.", hab: "Found in tropical and subtropical oceans around the world.", feed: "Herbivorous, feeding mainly on seagrasses. Lays eggs on sandy beaches.", stat: "Endangered"),
        EncyclopediaModel(cname: "Leopard Gecko", image: "8", lname: "Eublepharis macularius", des: "A small, nocturnal lizard with distinct yellow and black spots.", hab: "Native to the deserts of Asia and the Middle East.", feed: "Insectivorous, feeds on insects like crickets and mealworms. Lays eggs in burrows.", stat: "Not listed"),
        EncyclopediaModel(cname: "Amazon Milk Frog", image: "9", lname: "Trachycephalus resinifictrix", des: "A colorful, arboreal frog with striking blue markings.", hab: "Native to the Amazon rainforest in Brazil.", feed: "Insectivorous, feeds on ants, beetles, and crickets. Lays eggs on tree leaves.", stat: "Least concern"),
        EncyclopediaModel(cname: "Texas Horned Lizard", image: "10", lname: "Phrynosoma cornutum.", des: "Known for its horn-like projections on the head and flattened body.", hab: "Found in dry, sandy, and rocky regions of the southwestern United States.", feed: "Feeds on ants and other small insects. Lays eggs in burrows.", stat: "Phrynosoma cornutum"),




    ]
}
