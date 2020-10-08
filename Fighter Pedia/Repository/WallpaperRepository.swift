//
//  WallpaperRepository.swift
//  Fighter Pedia
//
//  Created by Ahsan Khalil🤕 on 08/10/2020.
//

import Foundation

class WallpaperRepository{
    static func getWallapaperList() -> [Wallpaper]{
        var wallapaperList = [Wallpaper]()
        let tempStr = "fighterPediaBg"
        for i in 1...25{
            wallapaperList.append(Wallpaper(img: "\(tempStr)\(i)"))
            wallapaperList.append(Wallpaper(img: "\(tempStr)\(i)"))
            wallapaperList.append(Wallpaper(img: "\(tempStr)\(i)"))
            wallapaperList.append(Wallpaper(img: "\(tempStr)\(i)"))
        }
        return wallapaperList
    }
}
