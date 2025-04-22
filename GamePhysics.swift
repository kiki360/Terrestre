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

class GamePhysics: SKScene, SKPhysicsContactDelegate {
    let Player = SKSpriteNode()
    let Platform = SKSpriteNode()
    
    override func sceneDidLoad() {
        physicsWorld.contactDelegate = self
        self.backgroundColor = .white
        
        Player.size = CGSize(width: 100, height: 150)
        Player.position = CGPoint(x: 100, y: 500)
        Player.color = .red
    }
    
    var playerOnGround = false
    
    override func didMove(to view: SKView) {
        physicsWorld.gravity = CGVector(dx: 0, dy: -10.1)
        
        Player.physicsBody = SKPhysicsBody()
        
        Player.physicsBody?.isDynamic = true
        Player.physicsBody?.affectedByGravity = true
        Player.physicsBody?.mass = 70
        Player.physicsBody?.friction = 100
        
        Player.physicsBody?.categoryBitMask = PhysicsCategory.Player
        Player.physicsBody?.contactTestBitMask = PhysicsCategory.Frame
        Player.physicsBody?.collisionBitMask = PhysicsCategory.Frame
        Player.physicsBody?.contactTestBitMask = PhysicsCategory.Platform
        Player.physicsBody?.collisionBitMask = PhysicsCategory.Platform
        
        
        Platform.physicsBody = SKPhysicsBody()
        
        Platform.physicsBody?.isDynamic = true
        Platform.physicsBody?.affectedByGravity = false
        
        Platform.physicsBody?.categoryBitMask = PhysicsCategory.Platform
        Platform.physicsBody?.contactTestBitMask = PhysicsCategory.Player
        Platform.physicsBody?.collisionBitMask = PhysicsCategory.Player
        
        
        let edgeFrame = SKPhysicsBody(edgeLoopFrom: self.frame)
        edgeFrame.node?.physicsBody?.categoryBitMask = PhysicsCategory.Frame
        edgeFrame.node?.physicsBody?.contactTestBitMask = PhysicsCategory.Player
        edgeFrame.node?.physicsBody?.collisionBitMask = PhysicsCategory.Player
        self.physicsBody = edgeFrame
        
        addChild(Player)
    }
    
    override func update(_ currentTime: TimeInterval) {
        if Player.position.y <= (self.position.y + self.size.height) / 2 + Player.size.height / 2 {
            Player.position.y = (self.position.y + self.size.height) / 2 + Player.size.height / 2
            Player.physicsBody?.velocity = CGVector(dx: 0, dy: 0)
            
            playerOnGround = true
            print("Player on ground is true")
        }
    }
    
    override func touchesBegan(_ touches: Set<UITouch>, with event: UIEvent?) {
        if playerOnGround {
            Player.physicsBody?.applyImpulse(CGVector(dx: 0, dy: 300))
            print("Player Jumped")
        }
    }
}
