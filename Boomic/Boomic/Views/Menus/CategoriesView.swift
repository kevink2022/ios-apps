//
//  CategoriesaView.swift
//  Boomic
//
//  Created by Kevin Kelly on 11/10/22.
//

import SwiftUI

struct CategoriesView: View
{
    @EnvironmentObject var manager : BoomicManager
    
    var body: some View
    {
        NavigationStack
        {
            VStack(alignment: .leading)
            {
                Text("Boomic Music")
                .font(.system(.largeTitle, design: .default, weight: .heavy))
                .padding()
                
                GridMenu
                {
                    NavigationLink
                    {

                    }
                    label:
                    {
                        CategoryView(category: .playlists)
                    }

                    NavigationLink
                    {
                        SongListView()
                    }
                    label:
                    {
                        CategoryView(category: .songs)
                    }

                    NavigationLink
                    {

                    }
                    label:
                    {
                        CategoryView(category: .albums)
                    }

                    NavigationLink
                    {

                    }
                    label:
                    {
                        CategoryView(category: .artists)
                    }
                }
            }
            
            
//            GeometryReader
//            {
//                geo in
//
//                VStack(alignment: .leading)
//                {
//                    Text("Boomic Music")
//                        .font(.system(.largeTitle, design: .default, weight: .heavy))
//                        .padding()
//
//                    ScrollView
//                    {
//                        LazyVGrid(columns: [GridItem(.adaptive(minimum: geo.size.width/3), spacing: 15)])
//                        {
////                            ForEach(Categories.allCases)
////                            {
////                                cat in let category = manager.categoryInfo(cat)
////
////                                NavigationLink
////                                {
////
////                                }
////                                label:
////                                {
////                                    CategoryButton(image: category.image, label: category.label)
////                                }
////                            }
//
//                            NavigationLink
//                            {
//
//                            }
//                            label:
//                            {
//                                CategoryView(category: .songs)
//                            }
//
//                            NavigationLink
//                            {
//                                SongListView()
//                            }
//                            label:
//                            {
//                                CategoryView(category: .songs)
//                            }
//
//                            NavigationLink
//                            {
//
//                            }
//                            label:
//                            {
//                                CategoryView(category: .albums)
//                            }
//
//                            NavigationLink
//                            {
//
//                            }
//                            label:
//                            {
//                                CategoryView(category: .artists)
//                            }
//                        }
//                        .padding()
//                    }
//                }
//            }
        }
    }
}

struct CategoriesView_Previews: PreviewProvider {
    static var previews: some View {
        CategoriesView()
            .environmentObject(BoomicManager())
    }
}
