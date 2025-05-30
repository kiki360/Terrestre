//
//  GamePhysics.swift
//  Terrestre
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
    static let animal: UInt32 = 0x1 << 3
}

class OilSpillGameScene: SKScene, SKPhysicsContactDelegate, ObservableObject {
    let cameraNode = SKCameraNode()
    
    let atlas = SKTextureAtlas(named: "player")
    let moving = SKTextureAtlas(named: "walk1")
    //let walking = atlas.textureNamed("walk2")
    //let playerWalkSprites = [idle, walking]
    
    //    var backgroundImage = ""
    var animalImage = ""
    
    @State var Player = SKSpriteNode(imageNamed: "PlayerCharacter")
    var Animal1 = SKSpriteNode(imageNamed: "Duck")
    var Animal2 = SKSpriteNode(imageNamed: "Duck")
    var Animal3 = SKSpriteNode(imageNamed: "Duck")
    var Animal4 = SKSpriteNode(imageNamed: "Duck")
    var Animal5 = SKSpriteNode(imageNamed: "Duck")
    var Animal6 = SKSpriteNode(imageNamed: "Duck")
    var Animal7 = SKSpriteNode(imageNamed: "Duck")
    var Animal8 = SKSpriteNode(imageNamed: "Duck")
    var Animal9 = SKSpriteNode(imageNamed: "Duck")
    var Animal10 = SKSpriteNode(imageNamed: "Duck")
    
    var startingPlatform = SKSpriteNode()
    
    var up = false
    var left = false
    var right = false
    var grabbing = false
    
    let upArrow = SKSpriteNode(imageNamed: "upArrow")
    let leftArrow = SKSpriteNode(imageNamed: "leftArrow")
    let rightArrow = SKSpriteNode(imageNamed: "rightArrow")
    let actionButton = SKShapeNode(ellipseOf: CGSize(width: 100, height: 100))
    
    @AppStorage("animals_saved") var animalsSaved = 0
    var animalCounter = SKLabelNode()
    
    var spritePositionX: [Int] = []
    var spritePositionY: [Int] = []
    
    
    
    override func sceneDidLoad() {
        animalsSaved = 0
        
        // MARK: Background
        let Background = SKSpriteNode(imageNamed: "OilSpillBg")
        Background.size = self.size
        Background.position = CGPoint(x: 0, y: 0)
        Background.zPosition = -1
        
        physicsWorld.contactDelegate = self
        self.physicsBody = SKPhysicsBody()
        self.anchorPoint = CGPoint(x: 0, y: 0)
        
        // MARK: Player and Platform starting code
        Player.size = CGSize(width: 144, height: 192)
        Player.position = CGPoint(x: 100, y: 700)
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
        
        // MARK: Platforms and animal sprites added
        for i in 1...100 {
            if i == 1 {
                let otherPlatform = SKSpriteNode(color: .black, size: startingPlatform.size)
                
                let y = Int.random(in: 250...600)
                let x = (Int(i) * 200) + 200
                
                otherPlatform.position = CGPoint(x: x, y: y)
                otherPlatform.physicsBody = SKPhysicsBody(rectangleOf: startingPlatform.size)
                otherPlatform.physicsBody?.isDynamic = false
                addChild(otherPlatform)
                
                spritePositionX.append(x)
                spritePositionY.append((y + 60))
            } else {
                let otherPlatform = SKSpriteNode(color: .black, size: startingPlatform.size)
                
                let y = Int.random(in: 250...600)
                let x = (Int(i) * 200) + 350
                
                otherPlatform.position = CGPoint(x: x, y: y)
                otherPlatform.physicsBody = SKPhysicsBody(rectangleOf: startingPlatform.size)
                otherPlatform.physicsBody?.isDynamic = false
                addChild(otherPlatform)
                
                spritePositionX.append(x)
                spritePositionY.append((y + 60))
            }
        }
        
        // MARK: Animal1
        Animal1.name = "animal1"
        Animal1.position = CGPoint(x: spritePositionX[0], y: spritePositionY[0])
        Animal1.color = .red
        Animal1.size = CGSize(width: 100, height: 100)
        Animal1.physicsBody = SKPhysicsBody(rectangleOf: CGSize(width: 10, height: 10))
        Animal1.physicsBody?.categoryBitMask = PhysicsCategory.animal
        Animal1.physicsBody?.collisionBitMask = PhysicsCategory.Player
        Animal1.physicsBody?.contactTestBitMask = PhysicsCategory.Player
        Animal1.physicsBody?.affectedByGravity = false
        Animal1.physicsBody?.isDynamic = false
        
        // MARK: Animal2
        Animal2.name = "animal2"
        Animal2.position = CGPoint(x: spritePositionX[2], y: spritePositionY[2])
        Animal2.color = .red
        Animal2.size = CGSize(width: 100, height: 100)
        Animal2.physicsBody = SKPhysicsBody(rectangleOf: CGSize(width: 10, height: 10))
        Animal2.physicsBody?.categoryBitMask = PhysicsCategory.animal
        Animal2.physicsBody?.collisionBitMask = PhysicsCategory.Player
        Animal2.physicsBody?.contactTestBitMask = PhysicsCategory.Player
        Animal2.physicsBody?.affectedByGravity = false
        
        // MARK: Animal3
        Animal3.name = "animal3"
        Animal3.position = CGPoint(x: spritePositionX[6], y: spritePositionY[6])
        Animal3.color = .red
        Animal3.size = CGSize(width: 100, height: 100)
        Animal3.physicsBody = SKPhysicsBody(rectangleOf: CGSize(width: 10, height: 10))
        Animal3.physicsBody?.categoryBitMask = PhysicsCategory.animal
        Animal3.physicsBody?.collisionBitMask = PhysicsCategory.Player
        Animal3.physicsBody?.contactTestBitMask = PhysicsCategory.Player
        Animal3.physicsBody?.affectedByGravity = false
        
        // MARK: Animal4
        Animal4.name = "animal4"
        Animal4.position = CGPoint(x: spritePositionX[18], y: spritePositionY[18])
        Animal4.color = .red
        Animal4.size = CGSize(width: 100, height: 100)
        Animal4.physicsBody = SKPhysicsBody(rectangleOf: CGSize(width: 10, height: 10))
        Animal4.physicsBody?.categoryBitMask = PhysicsCategory.animal
        Animal4.physicsBody?.collisionBitMask = PhysicsCategory.Player
        Animal4.physicsBody?.contactTestBitMask = PhysicsCategory.Player
        Animal4.physicsBody?.affectedByGravity = false
        
        // MARK: Animal5
        Animal5.name = "animal5"
        Animal5.position = CGPoint(x: spritePositionX[20], y: spritePositionY[20])
        Animal5.color = .red
        Animal5.size = CGSize(width: 100, height: 100)
        Animal5.physicsBody = SKPhysicsBody(rectangleOf: CGSize(width: 10, height: 10))
        Animal5.physicsBody?.categoryBitMask = PhysicsCategory.animal
        Animal5.physicsBody?.collisionBitMask = PhysicsCategory.Player
        Animal5.physicsBody?.contactTestBitMask = PhysicsCategory.Player
        Animal5.physicsBody?.affectedByGravity = false
        
        // MARK: Animal6
        Animal6.name = "animal6"
        Animal6.position = CGPoint(x: spritePositionX[30], y: spritePositionY[30])
        Animal6.color = .red
        Animal6.size = CGSize(width: 100, height: 100)
        Animal6.physicsBody = SKPhysicsBody(rectangleOf: CGSize(width: 10, height: 10))
        Animal6.physicsBody?.categoryBitMask = PhysicsCategory.animal
        Animal6.physicsBody?.collisionBitMask = PhysicsCategory.Player
        Animal6.physicsBody?.contactTestBitMask = PhysicsCategory.Player
        Animal6.physicsBody?.affectedByGravity = false
        
        // MARK: Animal7
        Animal7.name = "animal7"
        Animal7.position = CGPoint(x: spritePositionX[44], y: spritePositionY[44])
        Animal7.color = .red
        Animal7.size = CGSize(width: 100, height: 100)
        Animal7.physicsBody = SKPhysicsBody(rectangleOf: CGSize(width: 10, height: 10))
        Animal7.physicsBody?.categoryBitMask = PhysicsCategory.animal
        Animal7.physicsBody?.collisionBitMask = PhysicsCategory.Player
        Animal7.physicsBody?.contactTestBitMask = PhysicsCategory.Player
        Animal7.physicsBody?.affectedByGravity = false
        
        // MARK: Animal8
        Animal8.name = "animal8"
        Animal8.position = CGPoint(x: spritePositionX[60], y: spritePositionY[60])
        Animal8.color = .red
        Animal8.size = CGSize(width: 100, height: 100)
        Animal8.physicsBody = SKPhysicsBody(rectangleOf: CGSize(width: 10, height: 10))
        Animal8.physicsBody?.categoryBitMask = PhysicsCategory.animal
        Animal8.physicsBody?.collisionBitMask = PhysicsCategory.Player
        Animal8.physicsBody?.contactTestBitMask = PhysicsCategory.Player
        Animal8.physicsBody?.affectedByGravity = false
        
        // MARK: Animal9
        Animal9.name = "animal9"
        Animal9.position = CGPoint(x: spritePositionX[72], y: spritePositionY[72])
        Animal9.color = .red
        Animal9.size = CGSize(width: 100, height: 100)
        Animal9.physicsBody = SKPhysicsBody(rectangleOf: CGSize(width: 10, height: 10))
        Animal9.physicsBody?.affectedByGravity = false
        
        // MARK: Animal10
        Animal10.name = "animal10"
        Animal10.position = CGPoint(x: spritePositionX[80], y: spritePositionY[80])
        Animal10.color = .red
        Animal10.size = CGSize(width: 100, height: 100)
        Animal10.physicsBody = SKPhysicsBody(rectangleOf: CGSize(width: 10, height: 10))
        Animal10.physicsBody?.categoryBitMask = PhysicsCategory.animal
        Animal10.physicsBody?.collisionBitMask = PhysicsCategory.Player
        Animal10.physicsBody?.contactTestBitMask = PhysicsCategory.Player
        Animal10.physicsBody?.affectedByGravity = false
        
        
        // MARK: Arrow keys and action buttons added
        upArrow.position = UserDefaults.standard.getCGPoint(forKey: "upButtonPlacement") ?? CGPoint(x: 450, y: -200)
        upArrow.name = "uparrow"
        
        leftArrow.position = UserDefaults.standard.getCGPoint(forKey: "leftButtonPlacement") ?? CGPoint(x: 400, y: -300)
        leftArrow.name = "leftarrow"
        
        rightArrow.position = UserDefaults.standard.getCGPoint(forKey: "rightButtonPlacement") ?? CGPoint(x: 500, y: -300)
        rightArrow.name = "rightarrow"
        
        actionButton.fillColor = .clear
        actionButton.strokeColor = .black
        actionButton.position = UserDefaults.standard.getCGPoint(forKey: "actionButtonPlacement") ?? CGPoint(x: -520, y: -300)
        actionButton.name = "actionbutton"
        
        animalCounter.position = CGPoint(x: -200, y: 325)
        animalCounter.fontColor = .white
        animalCounter.fontSize = 50
        animalCounter.fontName = "Courier New Bold"
        
        addChild(startingPlatform)
        addChild(Animal1)
        addChild(Animal2)
        addChild(Animal3)
        addChild(Animal4)
        addChild(Animal5)
        addChild(Animal6)
        addChild(Animal7)
        addChild(Animal8)
        addChild(Animal9)
        addChild(Animal10)
        addChild(Player)
        cameraNode.addChild(upArrow)
        cameraNode.addChild(leftArrow)
        cameraNode.addChild(rightArrow)
        print("added arrows at \(upArrow.position)")
        //        cameraNode.addChild(actionButton)
        cameraNode.addChild(animalCounter)
        cameraNode.addChild(Background)
    }
    
    var playerOnGround = false
    
    // MARK: didMove (Player physics body and cameraNode)
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
        //        Player.physicsBody?.contactTestBitMask = PhysicsCategory.Frame
        //        Player.physicsBody?.collisionBitMask = PhysicsCategory.Frame
        Player.physicsBody?.contactTestBitMask = PhysicsCategory.Platform | PhysicsCategory.animal
        Player.physicsBody?.collisionBitMask = PhysicsCategory.Platform | PhysicsCategory.animal
        
        
        cameraNode.position.x = Player.position.x + 500
        cameraNode.position.y = size.height / 2
        self.camera = cameraNode
        addChild(cameraNode)
    }
    
    // MARK: update (Player movement and actions)
    override func update(_ currentTime: TimeInterval) {
        if up == true {
//            while up == true {
//                Player = SKSpriteNode(imageNamed: "walk1")
//            }
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
        
        if Player.position.y <= 0 {
            Player.position = CGPoint(x: 100, y: 700)
            cameraNode.position.x = Player.position.x + 500
        }
        
        animalCounter.text = "\(animalsSaved) out of 10 animals saved"
    }
    
    // MARK: Touches Began
    override func touchesBegan(_ touches: Set<UITouch>, with event: UIEvent?) {
        for touch in touches {
            let position = touch.location(in: self)
            print(position)
            if nodes(at: position).first != nil {
                switch nodes(at: position).first?.name?.lowercased() {
                case "uparrow":
                    print("upArrow here")
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
        grabbing = false
    }
    
    // MARK: didBegin
    nonisolated func didBegin(_ contact: SKPhysicsContact) {
        //       let contactA = contact.bodyA.node
        //       let contactB = contact.bodyB.node
        
        let selectedPoint = contact.contactPoint
        
        Task {
            
            if await Animal1.contains(selectedPoint) {
                DispatchQueue.main.async {
                    self.Animal1.removeFromParent()
                    if self.Animal1.isHidden == false {
                        self.animalsSaved += 1
                        self.Animal1.isHidden = true
                    } else {
                        self.animalsSaved += 0
                    }
                }
            }
            
            if await Animal2.contains(selectedPoint) {
                DispatchQueue.main.async {
                    self.Animal2.removeFromParent()
                    if self.Animal2.isHidden == false {
                        self.animalsSaved += 1
                        self.Animal2.isHidden = true
                    } else {
                        self.animalsSaved += 0
                    }
                }
            }
            
            if await Animal3.contains(selectedPoint) {
                DispatchQueue.main.async {
                    self.Animal3.removeFromParent()
                    if self.Animal3.isHidden == false {
                        self.animalsSaved += 1
                        self.Animal3.isHidden = true
                    } else {
                        self.animalsSaved += 0
                    }
                }
            }
            
            if await Animal4.contains(selectedPoint) {
                DispatchQueue.main.async {
                    self.Animal4.removeFromParent()
                    if self.Animal4.isHidden == false {
                        self.animalsSaved += 1
                        self.Animal4.isHidden = true
                    } else {
                        self.animalsSaved += 0
                    }
                }
            }
            
            if await Animal5.contains(selectedPoint) {
                DispatchQueue.main.async {
                    self.Animal5.removeFromParent()
                    if self.Animal5.isHidden == false {
                        self.animalsSaved += 1
                        self.Animal5.isHidden = true
                    } else {
                        self.animalsSaved += 0
                    }
                }
            }
            
            if await Animal6.contains(selectedPoint) {
                DispatchQueue.main.async {
                    self.Animal6.removeFromParent()
                    if self.Animal6.isHidden == false {
                        self.animalsSaved += 1
                        self.Animal6.isHidden = true
                    } else {
                        self.animalsSaved += 0
                    }
                }
            }
            
            if await Animal7.contains(selectedPoint) {
                DispatchQueue.main.async {
                    self.Animal7.removeFromParent()
                    if self.Animal7.isHidden == false {
                        self.animalsSaved += 1
                        self.Animal7.isHidden = true
                    } else {
                        self.animalsSaved += 0
                    }
                }
            }
            
            if await Animal8.contains(selectedPoint) {
                DispatchQueue.main.async {
                    self.Animal8.removeFromParent()
                    if self.Animal8.isHidden == false {
                        self.animalsSaved += 1
                        self.Animal8.isHidden = true
                    } else {
                        self.animalsSaved += 0
                    }
                }
            }
            
            if await Animal9.contains(selectedPoint) {
                DispatchQueue.main.async {
                    self.Animal9.removeFromParent()
                    if self.Animal9.isHidden == false {
                        self.animalsSaved += 1
                        self.Animal9.isHidden = true
                    } else {
                        self.animalsSaved += 0
                    }
                }
            }
            
            if await Animal10.contains(selectedPoint) {
                DispatchQueue.main.async {
                    self.Animal10.removeFromParent()
                    if self.Animal10.isHidden == false {
                        self.animalsSaved += 1
                        self.Animal10.isHidden = true
                    } else {
                        self.animalsSaved += 0
                    }
                }
            }
        }
    }
    
    // MARK: didEnd
    nonisolated func didEnd(_ contact: SKPhysicsContact) {
        
    }
    
//    func reset() {
//        self.removeAllChildren()
//        
//        let Background = SKSpriteNode(imageNamed: "OilSpillBg")
//        Background.size = self.size
//        Background.position = CGPoint(x: 0, y: 0)
//        Background.zPosition = -1
//        
//        Player.size = CGSize(width: 144, height: 192)
//        Player.position = CGPoint(x: 100, y: 700)
//        
//        startingPlatform.size = CGSize(width: 200, height: 25)
//        startingPlatform.position = CGPoint(x: 115, y: 300)
//        startingPlatform.color = .black
//        
//        for i in 1...100 {
//            if i == 1 {
//                let otherPlatform = SKSpriteNode(color: .black, size: startingPlatform.size)
//                
//                let y = Int.random(in: 250...600)
//                let x = (Int(i) * 200) + 200
//                
//                otherPlatform.position = CGPoint(x: x, y: y)
//                otherPlatform.physicsBody = SKPhysicsBody(rectangleOf: startingPlatform.size)
//                otherPlatform.physicsBody?.isDynamic = false
//                addChild(otherPlatform)
//                
//                spritePositionX.append(x)
//                spritePositionY.append((y + 60))
//            } else {
//                let otherPlatform = SKSpriteNode(color: .black, size: startingPlatform.size)
//                
//                let y = Int.random(in: 250...600)
//                let x = (Int(i) * 200) + 350
//                
//                otherPlatform.position = CGPoint(x: x, y: y)
//                otherPlatform.physicsBody = SKPhysicsBody(rectangleOf: startingPlatform.size)
//                otherPlatform.physicsBody?.isDynamic = false
//                addChild(otherPlatform)
//                
//                spritePositionX.append(x)
//                spritePositionY.append((y + 60))
//            }
//        }
//        
//        Animal1.position = CGPoint(x: spritePositionX[0], y: spritePositionY[0])
//        
//        Animal2.position = CGPoint(x: spritePositionX[2], y: spritePositionY[2])
//        
//        Animal3.position = CGPoint(x: spritePositionX[6], y: spritePositionY[6])
//        
//        Animal4.position = CGPoint(x: spritePositionX[18], y: spritePositionY[18])
//        
//        Animal5.position = CGPoint(x: spritePositionX[20], y: spritePositionY[20])
//        
//        Animal6.position = CGPoint(x: spritePositionX[30], y: spritePositionY[30])
//        
//        Animal7.position = CGPoint(x: spritePositionX[44], y: spritePositionY[44])
//        
//        Animal8.position = CGPoint(x: spritePositionX[60], y: spritePositionY[60])
//        
//        Animal9.position = CGPoint(x: spritePositionX[72], y: spritePositionY[72])
//        
//        Animal10.position = CGPoint(x: spritePositionX[90], y: spritePositionY[90])
//        
//        upArrow.position = UserDefaults.standard.getCGPoint(forKey: "upButtonPlacement") ?? CGPoint(x: 450, y: -200)
//        
//        leftArrow.position = UserDefaults.standard.getCGPoint(forKey: "leftButtonPlacement") ?? CGPoint(x: 400, y: -300)
//        
//        rightArrow.position = UserDefaults.standard.getCGPoint(forKey: "rightButtonPlacement") ?? CGPoint(x: 500, y: -300)
//        
//        animalsSaved = 0
//        
//        animalCounter.position = CGPoint(x: -200, y: 325)
//        animalCounter.text = "\(animalsSaved) out of 10 animals saved"
//        
//        addChild(startingPlatform)
//        addChild(Animal1)
//        addChild(Animal2)
//        addChild(Animal3)
//        addChild(Animal4)
//        addChild(Animal5)
//        addChild(Animal6)
//        addChild(Animal7)
//        addChild(Animal8)
//        addChild(Animal9)
//        addChild(Animal10)
//        addChild(Player)
//        cameraNode.addChild(upArrow)
//        cameraNode.addChild(leftArrow)
//        cameraNode.addChild(rightArrow)
//        print("added arrows at \(upArrow.position)")
//        //        cameraNode.addChild(actionButton)
//        cameraNode.addChild(animalCounter)
//        cameraNode.addChild(Background)
//    }
    
//    override init(size: CGSize) {
//        super.init(size: size)
//        self.scaleMode = .aspectFit
//    }
//    
//    required init?(coder aDecoder: NSCoder) {
//        fatalError("init(coder:) has not been implemented")
//    }
}
