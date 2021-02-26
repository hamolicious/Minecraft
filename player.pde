QueasyCam cam;

void loadCamera() { // Loads player camera and assigns the parameters
    cam = new QueasyCam(this);
    cam.speed = 5;
    cam.sensitivity = 0.5;
}
