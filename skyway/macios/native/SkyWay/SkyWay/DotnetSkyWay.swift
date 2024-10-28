//
//  DotnetSkyWay.swift
//  SkyWay
//
//  Created by .NET MAUI team on 6/18/24.
//

import Foundation
import SkyWayRoom

@objc(DotnetSkyWay)
public class DotnetSkyWay : NSObject
{
    private static var myRoom: Room?
    private static var myMember: LocalRoomMember?
    
    private static func log(text: String) -> Void {
        print("[SkyWay] \(text)")
    }
    private static func logSeperator() -> Void {
        log(text: "------------------------------------------")
    }

    @objc
    public static func join(token: String, roomId: String, userId: String) async -> Void {
        logSeperator()
        log(text: "start connecting.")
        let contextOptions = SkyWayCore.ContextOptions()
        contextOptions.logLevel = .debug
        do {
            try await Context.setup(
                withToken: token,
                options: contextOptions
            )
        } catch {
            log(text: "connecting failed: \(error.localizedDescription).")
            return
        }
        log(text: "end connecting.")
        log(text: "start checking same user.")
        let roomInit = Room.InitOptions()
        roomInit.name = roomId
        guard let room = try? await P2PRoom.findOrCreate(with: roomInit) else {
            return
        }
        if let sameUser = room.members
            .first(where: { $0.name == userId }) {
            log(text: "start kick existing same user.")
            try? await room.leave(sameUser)
            log(text: "end kick existing same user.")
        }
        log(text: "end checking same user.")
        log(text: "start joining room.")
        let memberInit = Room.MemberInitOptions()
        memberInit.name = userId
        memberInit.keepaliveIntervalSec = 30
        guard let member = try? await room.join(with: memberInit) else {
            log(text: "error joining room.")
            return
        }
        
        myRoom = room
        myMember = member
        log(text: "end joining room.")
        logSeperator()
    }
    
    @objc
    public static func leave() async -> Void {
        logSeperator()
        log(text: "start leaving room.")
        guard let member = myMember else {
            log(text: "no member, skip leaving.")
            return;
        }
        try? await member.leave()
        log(text: "end leaving room.")
        logSeperator()
    }

}
