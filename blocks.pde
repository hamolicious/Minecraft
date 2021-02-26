
class Face {
	PVector[] verticies;
	boolean active = true;
	PImage faceTextureImg;
	String name;
	PVector[] uv;

	Face(String name_, PImage texture_, PVector top_left, PVector top_right, PVector bottom_left, PVector bottom_right) {
		verticies = new PVector[4];
		verticies[0] = top_left;
		verticies[1] = top_right;
		verticies[2] = bottom_left;
		verticies[3] = bottom_right;

		uv = new PVector[4];
		uv[0] = new PVector(0, 0);
		uv[1] = new PVector(1, 0);
		uv[2] = new PVector(1, 1);
		uv[3] = new PVector(0, 1);

		name = name_;
		faceTextureImg = texture_;
	}

	void display(PVector playerCameraForwardVector) {
		if (!active || !isLookedAt(playerCameraForwardVector))
			return;

		beginShape();

    texture(faceTextureImg);
		for (int i = 0; i < 4; i++) {
			vertex(verticies[i].x, verticies[i].y, verticies[i].z, uv[i].x, uv[i].y);
		}

		endShape();
	}

	boolean isLookedAt(PVector playerCameraForwardVector) {
		PVector delta_r = PVector.sub(verticies[3], verticies[0]);
		PVector delta_s = PVector.sub(verticies[1], verticies[0]);

		PVector normal = new PVector(delta_r.x * delta_s.x, delta_r.y * delta_s.y, delta_r.z * delta_s.z);
		float cross = normal.x * (playerCameraForwardVector.x) + normal.y * (playerCameraForwardVector.y) + normal.z * (playerCameraForwardVector.z);

		return !(cross < 0);
	}
}

class Block {
	PVector pos;
	color base_colour;
	Block[] n;

	float size = 50;

	Face[] faces = new Face[6];

	Block(float x, float y, float z) {
		pos = new PVector(x, y, z);
		n = new Block[6];
	}

	void display(PVector playerCameraForwardVector) {
		fill(base_colour);
		noStroke();

		pushMatrix();
		translate(pos.x, pos.y, pos.z);
		for (Face f : faces) {
			f.display(playerCameraForwardVector);
		}
		popMatrix();
	}
}

class Grass extends Block {
	Grass(float x, float y, float z) {
		super(x, y, z);
		faces[0] = new Face("FRONT", t_grassSide, new PVector(0,    0,    0), new PVector(size,    0,    0), new PVector(size, size,    0), new PVector(0,    size,    0));
		faces[1] = new Face("BACK",  t_grassSide, new PVector(0,    0, size), new PVector(size,    0, size), new PVector(size, size, size), new PVector(0,    size, size));
		faces[2] = new Face("LEFT",  t_grassSide, new PVector(0,    0, size), new PVector(0,       0,    0), new PVector(0,    size,    0), new PVector(0,    size, size));
		faces[3] = new Face("RIGHT", t_grassSide, new PVector(size, 0, size), new PVector(size,    0,    0), new PVector(size, size,    0), new PVector(size, size, size));
		faces[4] = new Face("TOP",    t_grassTop, new PVector(0,    0, size), new PVector(size,    0, size), new PVector(size,    0,    0), new PVector(0,       0,    0));
		faces[5] = new Face("BOTTOM",     t_dirt, new PVector(0, size, size), new PVector(size, size, size), new PVector(size, size,    0), new PVector(0,    size,    0));
	}
}

class Dirt extends Block {
	Dirt(float x, float y, float z) {
		super(x, y, z);
		faces[0] = new Face("FRONT",  t_dirt, new PVector(0,    0,    0), new PVector(size,    0,    0), new PVector(size, size,    0), new PVector(0,    size,    0));
		faces[1] = new Face("BACK",   t_dirt, new PVector(0,    0, size), new PVector(size,    0, size), new PVector(size, size, size), new PVector(0,    size, size));
		faces[2] = new Face("LEFT",   t_dirt, new PVector(0,    0, size), new PVector(0,       0,    0), new PVector(0,    size,    0), new PVector(0,    size, size));
		faces[3] = new Face("RIGHT",  t_dirt, new PVector(size, 0, size), new PVector(size,    0,    0), new PVector(size, size,    0), new PVector(size, size, size));
		faces[4] = new Face("TOP",    t_dirt, new PVector(0,    0, size), new PVector(size,    0, size), new PVector(size,    0,    0), new PVector(0,       0,    0));
		faces[5] = new Face("BOTTOM", t_dirt, new PVector(0, size, size), new PVector(size, size, size), new PVector(size, size,    0), new PVector(0,    size,    0));
	}
}
