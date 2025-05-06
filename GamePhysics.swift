//
//  GamePhysics.swift
//  ClimateChangeGroupApp
//
//  Created by Calliope Epstein-Pawlak on 4/17/25.
//

// I learned most of this code from ChatGPT and YouTube, not the Sprites/Physics Learning in Schoology. The notes I took while using ChatGPT are in a different XCode project and I reused most of it for this file.

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
    var grabbing = false
    
    let upArrow = SKSpriteNode(imageNamed: "upArrow")
    let leftArrow = SKSpriteNode(imageNamed: "leftArrow")
    let rightArrow = SKSpriteNode(imageNamed: "rightArrow")
    let actionButton = SKShapeNode(ellipseOf: CGSize(width: 100, height: 100))
    
    
    
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
        
        upArrow.position = UserDefaults.standard.getCGPoint(forKey: "upButtonPlacement") ?? CGPoint(x: 125, y: 140)
        upArrow.name = "uparrow"
        
        leftArrow.position = UserDefaults.standard.getCGPoint(forKey: "leftButtonPlacement") ?? CGPoint(x: 80, y: 50)
        leftArrow.name = "leftarrow"
        
        rightArrow.position = UserDefaults.standard.getCGPoint(forKey: "rightButtonPlacement") ?? CGPoint(x: 175, y: 50)
        rightArrow.name = "rightarrow"
        
        actionButton.fillColor = .clear
        actionButton.strokeColor = .black
        actionButton.position = UserDefaults.standard.getCGPoint(forKey: "actionButtonPlacement") ?? CGPoint(x: 1100, y: 75)
        actionButton.name = "actionbutton"
        
        addChild(Player)
        addChild(Platform)
        addChild(upArrow)
        addChild(leftArrow)
        addChild(rightArrow)
        addChild(actionButton)
        //        print("added Platform")
    }
    
    var playerOnGround = false
    
    override func didMove(to view: SKView) {
        self.isUserInteractionEnabled = true
        
        physicsWorld.gravity = CGVector(dx: 0, dy: -9.8)
        
        Player.physicsBody = SKPhysicsBody(rectangleOf: Player.size)
        
        Player.physicsBody?.isDynamic = true
        Player.physicsBody?.affectedByGravity = true
        Player.physicsBody?.allowsRotation = false
        Player.physicsBody?.mass = 3
        Player.physicsBody?.friction = 10
        Player.physicsBody?.restitution = 0.2
        
        Player.physicsBody?.categoryBitMask = PhysicsCategory.Player
        Player.physicsBody?.contactTestBitMask = PhysicsCategory.Frame
        Player.physicsBody?.collisionBitMask = PhysicsCategory.Frame
        Player.physicsBody?.contactTestBitMask = PhysicsCategory.Platform | PhysicsCategory.Frame
        Player.physicsBody?.collisionBitMask = PhysicsCategory.Platform | PhysicsCategory.Frame
        
        
        //        addChild(Frame)
    }
    
    override func update(_ currentTime: TimeInterval) {
        if up == true {
            withAnimation {
                Player.position.y += 20
            }
            //            print("player moving up")
        }
        
        if left == true {
            withAnimation {
                Player.position.x -= 10
            }
            //            print("player moving left")
        } else if right == true {
            withAnimation {
                Player.position.x += 10
            }
            //            print("player moving right")
        }
        
        if grabbing == true {
            
        }
        
        //        if let upPosition = UserDefaults.standard.value(forKey: "upButtonPlacement") as? CGPoint {
        //            return upArrow.position = upPosition
        //        }
        //
        //        if let leftPosition = UserDefaults.standard.value(forKey: "leftButtonPosition") as? CGPoint {
        //            return leftArrow.position = leftPosition
        //        }
        //
        //        if let rightPosition = UserDefaults.standard.value(forKey: "rightButtonPosition") as? CGPoint {
        //            return leftArrow.position = rightPosition
        //        }
        //
        //        if let actionButtonPosition = UserDefaults.standard.value(forKey: "actionButtonPosition") as? CGPoint {
        //            return leftArrow.position = actionButtonPosition
        //        }
    }
    
    override func touchesBegan(_ touches: Set<UITouch>, with event: UIEvent?) {
        //        print("Player Jumped")
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
                case "actionbutton":
                    grabbing = true
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
    
}
