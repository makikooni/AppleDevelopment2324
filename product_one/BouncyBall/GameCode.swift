import Foundation

let ball = OvalShape(width: 40, height: 40)
var barriers: [Shape] = []
var targets: [Shape] = []
let funnelPoints = [
    Point(x: 0, y: 50),
    Point(x: 80, y: 50),
    Point(x: 60, y: 0),
    Point(x: 20, y: 0)]

let funnel = PolygonShape(points: funnelPoints)


fileprivate func setupBall() {
    ball.position = Point(x: 250, y:400)
    scene.add(ball)
    ball.hasPhysics = true
    ball.fillColor = .purple
    ball.isDraggable = false

    ball.onCollision = ballCollided(with:)
    
    ball.bounciness = 0.6
    
    scene.trackShape(ball)
    ball.onExitedScene = ballExitedScene
    ball.onTapped = resetGame
}

fileprivate func addBarrier(at position:
   Point, width: Double, height: Double,
   angle: Double) {
    let barrierPoints = [
        Point(x: 0, y: 0),
        Point(x: 0, y: height),
        Point(x: width, y: height),
        Point(x: width, y: 0)
    ]
    
    let barrier = PolygonShape(points:
       barrierPoints)
    
    barriers.append(barrier)
    
    barrier.position = position
    barrier.hasPhysics = true
    scene.add(barrier)

    barrier.isImmobile = true
    barrier.fillColor = .blue
    barrier.angle = angle
}

fileprivate func setupFunnel() {
    // Add a funnel to the scene.
    funnel.position = Point(x: 200, y: scene.height - 25)
    scene.add(funnel)
    funnel.onTapped = dropBall
    funnel.fillColor = .magenta
    funnel.isDraggable = false
}



func addTarget(at position: Point) {
    let targetPoints = [
        Point(x: 10, y: 0),
        Point(x: 0, y: 10),
        Point(x: 10, y: 20),
        Point(x: 20, y: 10)
    ]

    let target = PolygonShape(points: targetPoints)

    targets.append(target)
    
    target.position = position
    target.hasPhysics = true
    target.isImmobile = true
    target.isImpermeable = false
    target.fillColor = .orange
    target.name = "target"
    target.isDraggable = false
    
    scene.add(target)
}

func setup() {
    setupBall()
    
    // Adding multiple barriers to the scene
    addBarrier(at: Point(x: 200, y: 150), width: 80, height: 25, angle: 0.1)
    addBarrier(at: Point(x: 175, y: 100), width: 80, height: 25, angle: 0.1)
    addBarrier(at: Point(x: 100, y: 150), width: 30, height: 15, angle: -0.2)
    addBarrier(at: Point(x: 325, y: 150), width: 100, height: 25, angle: 03)
    
    // Adding funnel to the scene
    
    setupFunnel()
    
    // Adding multiple targets to the scene
    addTarget(at: Point(x: 194, y: 563))
    addTarget(at: Point(x: 240, y: 604))
    addTarget(at: Point(x: 322, y: 467))
    addTarget(at: Point(x: 248, y: 341))
    addTarget(at: Point(x: 160, y: 290))
    
    // Printing positions of shapes to the console
    scene.onShapeMoved = printPosition(of:)
    
    resetGame()
    
}


// Dropping the ball by moving it to the funnel's position.
func dropBall() {
    ball.position = funnel.position
    ball.stopAllMotion()
    
    for target in targets {
    target.fillColor = .orange
    }
    
    for barrier in barriers {
        barrier.isDraggable = false
    }
}

// Handling collisions between the ball and the targets, changing targets colour.
func ballCollided(with otherShape: Shape) {
    if otherShape.name != "target" { return }
    otherShape.fillColor = .green
}

func ballExitedScene() {
    
    // Unlocking the barriers movement
    for barrier in barriers {
        barrier.isDraggable = true
    }
    
    // Counting hitten targets
    var hitTargets = 0
    for target in targets {
        if target.fillColor == .green {
            hitTargets += 1
        }
    }
    
    // Showing winning message
    if hitTargets == targets.count {
        scene.presentAlert(text: "You won!",
        completion: alertDismissed)
    }
    
    
}

// Resetting the game when ball out of the scene.
func resetGame() {
    ball.position = Point(x: 0, y: -80)
}

func printPosition(of shape: Shape) {
    print(shape.position)
}


func alertDismissed() {
}
