//
//  MainView.swift
//  Boomic
//
//  Created by Kevin Kelly on 11/1/22.
//

import SwiftUI

struct MainView: View {
    var body: some View {
        //SongListView()
        
        GeometryReader
        {
            geo in BoomicSlider(geometry: geo)
        }
    }
}

struct MainView_Previews: PreviewProvider {
    static var previews: some View {
        MainView()
    }
}
