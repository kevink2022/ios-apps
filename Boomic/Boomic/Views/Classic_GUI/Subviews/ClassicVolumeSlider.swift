//
//  ClassicVolumeSlider.swift
//  Boomic
//
//  Created by Kevin Kelly on 11/2/22.
//

import SwiftUI
import MediaPlayer
import UIKit

struct ClassicVolumeSlider: UIViewRepresentable
{
    func makeUIView(context: Context) -> MPVolumeView
    {
        MPVolumeView(frame: .zero)
    }

    func updateUIView(_ view: MPVolumeView, context: Context) { }
}
