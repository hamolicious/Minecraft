
Block[] GenerateWorld(int w, int d, int h) {
	Block[] blocks = new Block[w * d * h];
	float xOff = 0;
	float yOff = 0;
	float deltaOff = 0.01;
	
	for (int x = 0; x < w; x++) {
		for (int z = 0; z < d; z++) {
			int index = int(z * w + x);
			
			float px = x * 50;
			float py = 100 + (int((50 * noise(xOff, yOff)) % 50) * 50);
			float pz = z * 50;
			
			blocks[index] = new Grass(px, py, pz);
			
			for (int y = 0; y < h; y++) {
				// index = int(x + w * (y + d * z));
				index = z*w*h + y*w + x;
				blocks[index] = new Dirt(px, py + (50 * (y+1)), pz);
			}
			
			xOff += deltaOff;
		}
		xOff = 0;
		yOff += deltaOff;
	}
	
	
	for (int j = 0; j < w * d; j++) {
		blocks[j].n[0] = null;
		blocks[j].n[1] = null;
		blocks[j].n[2] = null;
		blocks[j].n[3] = null;
		blocks[j].n[4] = null;
		blocks[j].n[5] = null;
	}
	
	return blocks;
}
