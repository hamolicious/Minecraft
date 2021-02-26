
PGraphics hudOverlay;
void generateHUD() {
	hudOverlay = createGraphics(width, height);
	hudOverlay.fill(255);
}

void showHUD() {
    generateHUD();

	hudOverlay.beginDraw();
	showFPS();
	hudOverlay.endDraw();

    loadPixels();
    hudOverlay.loadPixels();
	for (int y = 0; y < height; y++) {
	    for (int x = 0; x < width; x++) {
            color c = hudOverlay.pixels[y*width+x];

            if (int((red(c) + green(c) + blue(c))) != 0) {
                pixels[y*width+x] = c;
            }
	    }
	}
    updatePixels();
    hudOverlay.updatePixels();
}

void showFPS() {
	hudOverlay.text("Framerate : " + str(frameRate), 20, 20);
}
	
	
	
	
	
	
	
	