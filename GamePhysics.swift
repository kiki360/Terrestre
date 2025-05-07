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
    let cameraNode = SKCameraNode()
    
    var backgroundImage = ""
    var Player = SKSpriteNode(imageNamed: "PlayerCharacter")
    
    var startingPlatform = SKSpriteNode()
    
    var up = false
    var left = false
    var right = false
    var grabbing = false
    
    let upArrow = SKSpriteNode(imageNamed: "upArrow")
    let leftArrow = SKSpriteNode(imageNamed: "leftArrow")
    let rightArrow = SKSpriteNode(imageNamed: "rightArrow")
    let actionButton = SKShapeNode(ellipseOf: CGSize(width: 100, height: 100))
    
    var level = ""
    
    // Animal Sprites in the OilSpill level
    
    
    
    override func sceneDidLoad() {
        switch level {
        case "OilSpill":
            backgroundImage = "OilSpillBackground"
        case "Arctic":
            backgroundImage = "ArcticBackground"
        case "Fracking":
            backgroundImage = "FrackingBackground"
        default:
            break
        }
        
        let Background = SKSpriteNode(imageNamed: backgroundImage)
        Background.size = self.size
        Background.position = CGPoint(x: size.width / 2, y: size.height / 2)
        Background.zPosition = -1
        
        physicsWorld.contactDelegate = self
        self.physicsBody = SKPhysicsBody(edgeChainFrom: CGPath(rect: CGRect(x: 0, y: 0, width: self.size.width, height: 0), transform: nil))
        self.anchorPoint = CGPoint(x: 0, y: 0)
        
        Player.size = CGSize(width: 100, height: 150)
        Player.position = CGPoint(x: 100, y: 700)
        Player.color = .red
        Player.name = "player"
        
        startingPlatform.size = CGSize(width: 200, height: 25)
        startingPlatform.position = CGPoint(x: 115, y: 300)
        startingPlatform.color = .black
        
        startingPlatform.physicsBody = SKPhysicsBody(rectangleOf: startingPlatform.size)
        
        startingPlatform.physicsBody?.isDynamic = false
        startingPlatform.physicsBody?.affectedByGravity = false
        
        startingPlatform.physicsBody?.categoryBitMask = PhysicsCategory.Platform
        startingPlatform.physicsBody?.contactTestBitMask = PhysicsCategory.Player
        startingPlatform.physicsBody?.collisionBitMask = PhysicsCategory.Player
        
        for i in 1...10 {
            let otherPlatform = SKSpriteNode(color: .black, size: startingPlatform.size)
            
            let x = Int.random(in: 10...1000)
            let y = Int.random(in: 10...1000)
            
            otherPlatform.position = CGPoint(x: x, y: y)
            otherPlatform.physicsBody = SKPhysicsBody(rectangleOf: startingPlatform.size)
            otherPlatform.physicsBody?.isDynamic = false
            addChild(otherPlatform)
        }
        
        //        upArrow.position = UserDefaults.standard.getCGPoint(forKey: "upButtonPlacement") ?? CGPoint(x: 450, y: -200)
        upArrow.position = CGPoint(x: 450, y: -200)
        upArrow.name = "uparrow"
        
        //        leftArrow.position = UserDefaults.standard.getCGPoint(forKey: "leftButtonPlacement") ?? CGPoint(x: 400, y: -300)
        leftArrow.position = CGPoint(x: 400, y: -300)
        leftArrow.name = "leftarrow"
        
        //        rightArrow.position = UserDefaults.standard.getCGPoint(forKey: "rightButtonPlacement") ?? CGPoint(x: 500, y: -300)
        rightArrow.position = CGPoint(x: 500, y: -300)
        rightArrow.name = "rightarrow"
        
        actionButton.fillColor = .clear
        actionButton.strokeColor = .black
        //        actionButton.position = UserDefaults.standard.getCGPoint(forKey: "actionButtonPlacement") ?? CGPoint(x: -520, y: -300)
        actionButton.position = CGPoint(x: -520, y: -300)
        actionButton.name = "actionbutton"
        
        
        addChild(Player)
        addChild(startingPlatform)
        cameraNode.addChild(upArrow)
        cameraNode.addChild(leftArrow)
        cameraNode.addChild(rightArrow)
        cameraNode.addChild(actionButton)
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
        
        
        cameraNode.position.x = Player.position.x + 500
        cameraNode.position.y = size.height / 2
        self.camera = cameraNode
        addChild(cameraNode)
    }
    
    override func update(_ currentTime: TimeInterval) {
        if up == true {
            withAnimation {
                Player.position.y += 20
            }
        }
        
        if left == true {
            withAnimation {
                Player.position.x -= 10
            }
            
            let lastPosition = cameraNode.position
            camera?.position = CGPoint(x: lastPosition.x - 10, y: size.height / 2)
            
            if cameraNode.position.x < Player.position.x - 500 {
                cameraNode.position.x = Player.position.x - 500
            }
            
        } else if right == true {
            withAnimation {
                Player.position.x += 10
            }
            
            let lastPosition = cameraNode.position
            
                camera?.position = CGPoint(x: lastPosition.x + 10, y: size.height / 2)

            if cameraNode.position.x > Player.position.x + 500 {
                cameraNode.position.x = Player.position.x + 500
            }
        }
        
        if grabbing == true {
            
        }
        
        if Player.position.y <= 0 {
            Player.position = CGPoint(x: 100, y: 700)
        }
    }
    
    override func touchesBegan(_ touches: Set<UITouch>, with event: UIEvent?) {
        for touch in touches {
            let position = touch.location(in: self)
            if nodes(at: position).first != nil {
                switch nodes(at: position).first?.name?.lowercased() {
                case "uparrow":
                    up = true
                case "leftarrow":
                    left = true
                case "rightarrow":
                    right = true
                case "actionbutton":
                    grabbing = true
                default:
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
