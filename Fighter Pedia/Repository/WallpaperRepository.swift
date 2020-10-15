//
//  WallpaperRepository.swift
//  Fighter Pedia
//
//  Created by Ahsan Khalil🤕 on 08/10/2020.
//

import Foundation

class WallpaperRepository{
    static func getWallapaperList() -> [ImageDataContainer]{
        var wallapaperList = [ImageDataContainer]()
        let tempStr = "fighterPediaBg"
        for i in 1...25{
            wallapaperList.append(ImageDataContainer(img: "\(tempStr)\(i)"))
            wallapaperList.append(ImageDataContainer(img: "\(tempStr)\(i)"))
            wallapaperList.append(ImageDataContainer(img: "\(tempStr)\(i)"))
            wallapaperList.append(ImageDataContainer(img: "\(tempStr)\(i)"))
        }
        return wallapaperList
    }
    
    static func getOperatorsList() -> [ImageDataContainer] {
        var imgList = [ImageDataContainer]()
        
        imgList.append(ImageDataContainer(img: "germany"))
        imgList.append(ImageDataContainer(img: "hungary"))
        imgList.append(ImageDataContainer(img: "italy"))
        imgList.append(ImageDataContainer(img: "romania"))
        imgList.append(ImageDataContainer(img: "independent state of croatia"))
        imgList.append(ImageDataContainer(img: "soviet union"))
        return imgList
    }
}
