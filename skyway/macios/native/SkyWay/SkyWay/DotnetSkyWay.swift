//
//  DotnetSkyWay.swift
//  SkyWay
//
//  Created by .NET MAUI team on 6/18/24.
//

import Foundation

@objc(DotnetSkyWay)
public class DotnetSkyWay : NSObject
{

    @objc
    public static func getString(myString: String) -> String {
        return myString  + " from swift!"
    }

}
