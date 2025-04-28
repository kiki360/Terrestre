//
//  GamePhysics.swift
//  ClimateChangeGroupApp
//
//  Created by Calliope Epstein-Pawlak on 4/17/25.
//

// I learned most of this code from ChatGPT, not the Sprites/Physics Learning in Schoology. The notes I took while using ChatGPT are in a different XCode project and I reused most of it for this file.

import SwiftUI
import SpriteKit

struct PhysicsCategory {
    static let Player: UInt32 = 0x1 << 0
    static let Platform: UInt32 = 0x1 << 1
    static let Frame: UInt32 = 0x1 << 2
}

class GamePhysics: SKScene, @preconcurrency SKPhysicsContactDelegate {
    let Player = SKSpriteNode()
    let Platform = SKSpriteNode()
    let Frame = SKNode()
    
    override func sceneDidLoad() {
        physicsWorld.contactDelegate = self
        self.backgroundColor = .white
        
        Player.size = CGSize(width: 100, height: 150)
        Player.position = CGPoint(x: 100, y: 600)
        Player.color = .red
        
        Platform.size = CGSize(width: 200, height: 25)
        Platform.position = CGPoint(x: 115, y: 300)
        Platform.color = .black
        Platform.physicsBody = SKPhysicsBody()
        
        Platform.physicsBody?.isDynamic = true
        Platform.physicsBody?.affectedByGravity = false
        
        Platform.physicsBody?.categoryBitMask = PhysicsCategory.Platform
        Platform.physicsBody?.contactTestBitMask = PhysicsCategory.Player
        Platform.physicsBody?.collisionBitMask = PhysicsCategory.Player
    }
    
    var playerOnGround = false
    
    override func didMove(to view: SKView) {
        self.isUserInteractionEnabled = true
        
        physicsWorld.gravity = CGVector(dx: 0, dy: -9.8)
        
        Player.physicsBody = SKPhysicsBody()
        
        Player.physicsBody?.isDynamic = true
        Player.physicsBody?.affectedByGravity = true
        Player.physicsBody?.mass = 2
        Player.physicsBody?.friction = 100
        
        Player.physicsBody?.categoryBitMask = PhysicsCategory.Player
        Player.physicsBody?.contactTestBitMask = PhysicsCategory.Platform | PhysicsCategory.Frame
        Player.physicsBody?.collisionBitMask = PhysicsCategory.Platform | PhysicsCategory.Frame
        
        Frame.position = CGPoint(x: 0, y: 0)
        Frame.physicsBody = SKPhysicsBody(edgeFrom: CGPoint(x: 0, y: 0), to: CGPoint(x: 1000, y: 0))
        Frame.physicsBody?.categoryBitMask = PhysicsCategory.Frame
        Frame.physicsBody?.contactTestBitMask = PhysicsCategory.Player
        Frame.physicsBody?.collisionBitMask = PhysicsCategory.Player
        
        addChild(Player)
        addChild(Platform)
        addChild(Frame)
    }
    
    override func update(_ currentTime: TimeInterval) {
        if playerOnGround == true {
            Player.position.y = Platform.position.y + Platform.size.height / 2 + Player.size.height / 2
        }
    }
    
    func didBegin(_ contact: SKPhysicsContact) {
        let contact = contact.bodyA.categoryBitMask | contact.bodyB.categoryBitMask
        
        if contact == PhysicsCategory.Player | PhysicsCategory.Platform {
            playerOnGround = true
        }/* else if contact == (PhysicsCategory.Player | PhysicsCategory.Frame) {
            
            playerOnGround = true
            
        } */
    }
//    
//    func didEnd(_ contact: SKPhysicsContact) {
//        let contact = contact.bodyA.categoryBitMask | contact.bodyB.categoryBitMask
//        
//        if contact == (PhysicsCategory.Player | PhysicsCategory.Platform) {
//            playerOnGround = false
//        } /*else if contact == (PhysicsCategory.Player | PhysicsCategory.Frame) {
//            playerOnGround = false
//        } */
//    }
    
    override func touchesBegan(_ touches: Set<UITouch>, with event: UIEvent?) {
        if playerOnGround {
            playerOnGround = false
            Player.physicsBody?.applyImpulse(CGVector(dx: 300, dy: 0))
            print("Player Jumped")
        }
    }
}
