import queasycam.*;

Block[] world;

void setup() {
	// creates a full screen window
	fullScreen(P3D);
	// enables a depth test to render the closest things last
	hint(ENABLE_DEPTH_TEST);
	// limits FPS to 60 frames per second
	frameRate(60);
	// hides the cursor
	noCursor();
	// setup texture settings
	textureWrap(CLAMP);
	textureMode(NORMAL);

	loadFiles();
	loadCamera();
	generateHUD();

  world = GenerateWorld(10, 10, 5);
}

void draw() {
	perspective(radians(90), width/height, 0.01, 5000);
	background(200, 200, 255);

	for (Block b : world) {
        b.display(cam.getForward());
	}

	showHUD();
}

void keyPressed() {
    if (key == 'l'){
        saveFrame("screenshot-####.png");
    }

	if (key == 'p'){
		setup();
	}
}
