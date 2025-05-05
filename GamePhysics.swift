//
//  GamePhysics.swift
//  ClimateChangeGroupApp
//
//  Created by Calliope Epstein-Pawlak on 4/17/25.
//

// I learned most of this code from ChatGPT, not the Sprites/Physics Learning in Schoology. The notes I took while using ChatGPT are in a different XCode project and I reused most of it for this file.

import SwiftUI
import SpriteKit
import UIKit

struct PhysicsCategory {
    static let Player: UInt32 = 0x1 << 0
    static let Platform: UInt32 = 0x1 << 1
    static let Frame: UInt32 = 0x1 << 2
}

class GamePhysics: SKScene, SKPhysicsContactDelegate, ObservableObject {
    var Player = SKSpriteNode(imageNamed: "PlayerCharacter")
    var Platform = SKSpriteNode()
//    let Frame = SKNode()
    
    var up = false
    var left = false
    var right = false
    
    let upArrow = SKShapeNode(rectOf: CGSize(width: 75, height: 75))
    let leftArrow = SKShapeNode(rectOf: CGSize(width: 75, height: 75))
    let rightArrow = SKShapeNode(rectOf: CGSize(width: 75, height: 75))
    
    
    
    override func sceneDidLoad() {
//        print("Scene loaded")
        physicsWorld.contactDelegate = self
        self.backgroundColor = .white
        self.physicsBody = SKPhysicsBody(edgeLoopFrom: frame)
        
        Player.size = CGSize(width: 100, height: 150)
        Player.position = CGPoint(x: 100, y: 700)
        Player.color = .red
        
        Platform.size = CGSize(width: 200, height: 25)
        Platform.position = CGPoint(x: 115, y: 300)
        Platform.color = .black
        
        Platform.physicsBody = SKPhysicsBody(rectangleOf: Platform.size)
        
        Platform.physicsBody?.isDynamic = false
        Platform.physicsBody?.affectedByGravity = false
        
        Platform.physicsBody?.categoryBitMask = PhysicsCategory.Platform
        Platform.physicsBody?.contactTestBitMask = PhysicsCategory.Player
        Platform.physicsBody?.collisionBitMask = PhysicsCategory.Player
        
        upArrow.fillColor = .red
        upArrow.position = CGPoint(x: 650, y: 690)
//        upArrow.addChild(SKNode())
//        upArrow.childNode(withName: "uparrow")?.position = upArrow.position
        upArrow.name = "uparrow"
        
        leftArrow.position = CGPoint(x: 600, y: 600)
        leftArrow.fillColor = .red
//        leftArrow.childNode(withName: "leftarrow")?.position = leftArrow.position
        leftArrow.name = "leftarrow"
        
        rightArrow.position = CGPoint(x: 700, y: 600)
        rightArrow.fillColor = .red
//        rightArrow.childNode(withName: "rightarrow")?.position = rightArrow.position
        rightArrow.name = "rightarrow"
        
        addChild(Platform)
        addChild(upArrow)
        addChild(leftArrow)
        addChild(rightArrow)
//        print("added Platform")
    }
    
    var playerOnGround = false
    
    override func didMove(to view: SKView) {
        self.isUserInteractionEnabled = true
        
        physicsWorld.gravity = CGVector(dx: 0, dy: -9.8)
        
        Player.physicsBody = SKPhysicsBody(rectangleOf: Player.size)
        
        Player.physicsBody?.isDynamic = true
        Player.physicsBody?.affectedByGravity = true
        Player.physicsBody?.allowsRotation = true
        Player.physicsBody?.mass = 2
        Player.physicsBody?.friction = 10
        Player.physicsBody?.restitution = 0.2
        
        Player.physicsBody?.categoryBitMask = PhysicsCategory.Player
        Player.physicsBody?.contactTestBitMask = PhysicsCategory.Frame
        Player.physicsBody?.collisionBitMask = PhysicsCategory.Frame
        Player.physicsBody?.contactTestBitMask = PhysicsCategory.Platform | PhysicsCategory.Frame
        Player.physicsBody?.collisionBitMask = PhysicsCategory.Platform | PhysicsCategory.Frame
        
        addChild(Player)
//        addChild(Frame)
    }
    
    override func update(_ currentTime: TimeInterval) {
        if up == true {
            Player.physicsBody?.applyImpulse(CGVector(dx: 0, dy: 1000))
//            print("player moving up")
        }
        
        if left == true {
            Player.position.x -= 10
//            print("player moving left")
        } else if right == true {
            Player.position.x += 10
//            print("player moving right")
        }
    }
    
    override func touchesBegan(_ touches: Set<UITouch>, with event: UIEvent?) {
//        Player.physicsBody?.applyImpulse(CGVector(dx: 0, dy: 2000))
//        print("Player Jumped")
//        print("touchesBegan working")
        for touch in touches {
            let position = touch.location(in: self)
            if nodes(at: position).first != nil {
//                print("there is a node here")
                switch nodes(at: position).first?.name?.lowercased() {
                case "uparrow":
//                    print("upArrow")
                    up = true
                    case "leftarrow":
//                    print("leftArrow")
                    left = true
                case "rightarrow":
//                    print("rightArrow")
                    right = true
                default:
//                    print("no nodes")
                    break
                }
            }
        }
        
    }
    
    override func touchesEnded(_ touches: Set<UITouch>, with event: UIEvent?) {
        up = false
        left = false
        right = false
    }
    
    override func touchesMoved(_ touches: Set<UITouch>, with event: UIEvent?) {
        
    }
    
    
    //    func playerMovedRight(by vector: CGVector) {
    //        let movePlayerRight = SKAction.move(by: vector, duration: 1)
    //        Player.run(movePlayerRight)
    //        print("Player position = \(Player.position)")
    //    }
    //
    //    func playerMovedUp(by vector: CGVector) {
    //        let movePlayerUp = SKAction.move(by: vector, duration: 1)
    //        Player.run(movePlayerUp)
    //        print("Player position = \(Player.position)")
    //    }
    //
    //    func playerMovedLeft(by vector: CGVector) {
    //        let movePlayerLeft = SKAction.move(by: vector, duration: 1)
    //        Player.run(movePlayerLeft)
    //        print("Player position = \(Player.position)")
    //    }
}

//struct GamePad: View {
//    @EnvironmentObject var gamePhysics: GamePhysics
//    var body: some View {
//        HStack {
//            Button {
//                print("Left Button pressed")
//                gamePhysics.playerMovedLeft(by: CGVector(dx: -150, dy: 0))
//            } label: {
//                Image(systemName: "arrow.left")
//                    .font(.largeTitle)
//                    .bold()
//            }
//
//            Button {
//                print("Up Button pressed")
//                gamePhysics.playerMovedRight(by: CGVector(dx: 0, dy: 2000))
//            } label: {
//                Image(systemName: "arrow.up")
//                    .font(.largeTitle)
//                    .bold()
//            }
//
//            Button {
//                print("Right Button pressed")
//                gamePhysics.playerMovedRight(by: CGVector(dx: 150, dy: 0))
//            } label: {
//                Image(systemName: "arrow.right")
//                    .font(.largeTitle)
//                    .bold()
//            }
//
//        }
//        .onAppear() {
//            print("Game Pad Loaded")
//        }
//    }
//}
