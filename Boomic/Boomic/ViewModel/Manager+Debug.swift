//
//  Manager+Debug.swift
//  Boomic
//
//  Created by Kevin Kelly on 11/3/22.
//

import Foundation

extension BoomicManager
{
    /// Debug printing for development
    func bPrint(_ string: String)
    {
        if BoomicManager.DEBUG
        {
            print(string)
        }
    }
}
