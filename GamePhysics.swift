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
    let Frame = SKNode()
    
    override func sceneDidLoad() {
        physicsWorld.contactDelegate = self
        self.backgroundColor = .white
        self.physicsBody = SKPhysicsBody(edgeLoopFrom: frame)
        
        Player.size = CGSize(width: 100, height: 150)
        Player.position = CGPoint(x: 100, y: 700)
        Player.color = .red
        
        Platform.size = CGSize(width: 200, height: 25)
        Platform.position = CGPoint(x: 115, y: 300)
        Platform.color = .black
        
//        Platform.physicsBody = SKPhysicsBody(edgeLoopFrom: CGRect())
//        
//        Platform.physicsBody?.isDynamic = true
//        Platform.physicsBody?.affectedByGravity = false
//        
//        Platform.physicsBody?.categoryBitMask = PhysicsCategory.Platform
//        Platform.physicsBody?.contactTestBitMask = PhysicsCategory.Player
//        Platform.physicsBody?.collisionBitMask = PhysicsCategory.Player
    }
    
    var playerOnGround = false
    
    override func didMove(to view: SKView) {
        self.isUserInteractionEnabled = true
        
        physicsWorld.gravity = CGVector(dx: 0, dy: -9.8)
        
        Player.physicsBody = SKPhysicsBody()
        
        Player.physicsBody?.isDynamic = true
        Player.physicsBody?.affectedByGravity = true
        Player.physicsBody?.allowsRotation = true
        Player.physicsBody?.mass = 2
        Player.physicsBody?.friction = 10
        Player.physicsBody?.restitution = 100
        
        Player.physicsBody?.categoryBitMask = PhysicsCategory.Player
//        Player.physicsBody?.contactTestBitMask = PhysicsCategory.Frame
//        Player.physicsBody?.collisionBitMask = PhysicsCategory.Frame
        Player.physicsBody?.contactTestBitMask = PhysicsCategory.Platform
        Player.physicsBody?.collisionBitMask = PhysicsCategory.Platform
        
        
        Platform.physicsBody = SKPhysicsBody(rectangleOf: Platform.size)
        
        Platform.physicsBody?.isDynamic = true
        Platform.physicsBody?.affectedByGravity = false
        Platform.physicsBody?.mass = 100
        
        Platform.physicsBody?.categoryBitMask = PhysicsCategory.Platform
        Platform.physicsBody?.contactTestBitMask = PhysicsCategory.Player
        Platform.physicsBody?.collisionBitMask = PhysicsCategory.Player
        
        
//        let edgeFrame = SKPhysicsBody(edgeLoopFrom: self.frame)
//        edgeFrame.node?.physicsBody?.categoryBitMask = PhysicsCategory.Frame
//        edgeFrame.node?.physicsBody?.contactTestBitMask = PhysicsCategory.Player
//        edgeFrame.node?.physicsBody?.collisionBitMask = PhysicsCategory.Player
//        self.physicsBody = edgeFrame
        
        addChild(Player)
        addChild(Platform)
        addChild(Frame)
    }
    
    override func update(_ currentTime: TimeInterval) {
//        if Player.position.y <= Platform.position.y + (Platform.size.height / 2) + Player.size.height / 2 {
//            Player.position.y = Platform.position.y + (Platform.size.height / 2) + Player.size.height / 2
//            Player.physicsBody?.velocity = CGVector(dx: 0, dy: 0)
            
//            playerOnGround = true
//        }
    }
    
    func contactTestBitMask(_ bodyA: SKPhysicsBody, _ bodyB: SKPhysicsBody) -> UInt32 {
        if bodyA.categoryBitMask | bodyB.categoryBitMask == PhysicsCategory.Player | PhysicsCategory.Platform {
            Platform.physicsBody?.applyForce(CGVector(dx: 0, dy: 1000), at: Player.position)
        }
        return bodyA.categoryBitMask | bodyB.categoryBitMask
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
//        if playerOnGround {
//            playerOnGround = false
            Player.physicsBody?.applyImpulse(CGVector(dx: 0, dy: 1000))
            print("Player Jumped")
//        }
    }
    
//    override func touchesMoved(_ touches: Set<UITouch>, with event: UIEvent?) {
//        let touch = touches.first ?? UITouch()
//        
//        Player.position = touch.location(in: self)
//    }
}
