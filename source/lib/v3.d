module lib.v3;

import std.math;

struct v3 {
	double[3] arr;

	this(double x, double y, double z){
		this.arr[0] = x;
		this.arr[1] = y;
		this.arr[2] = z;
	}

	v3 opBinary(string op : "+")(const ref v3 v) {
		return v3(arr[0] + v.arr[0], arr[1] + v.arr[1], arr[2] + v.arr[2]);
	}

	v3 opBinary(string op : "-")(const ref v3 v) {
		return v3(arr[0] - v.arr[0], arr[1] - v.arr[1], arr[2] - v.arr[2]);
	}

	v3 opBinary(string op : "*")(const ref v3 v){
		return v3(arr[0] * v.arr[0], arr[1] * v.arr[1], arr[2] * v.arr[2]);
	}

	v3 opBinary(string op : "*")(double t){
		return v3(t*arr[0], t*arr[1], t*arr[2]);
	}

	v3 opBinaryRight(string op : "*")(double t){
		return v3(t*arr[0], t*arr[1], t*arr[2]);
	}

	v3 opBinary(string op : "/")(double t){
		t /= 1.0;
		return v3(t*arr[0],t*arr[1],t*arr[2]);
	}

	v3 opBinaryRight(string op : "/")(double t){
		t /= 1.0;
		return v3(t*arr[0],t*arr[1],t*arr[2]);
	}


	
}

	double dot(const ref v3 v, const ref v3 t){
		return v.arr[0] * t.arr[0] + v.arr[1] * t.arr[1] + v.arr[2] * t.arr[2];
	}

	v3 cross(const ref v3 v, const ref v3 t){
		return v3(v.arr[1] * t.arr[2] - v.arr[2] * t.arr[1],
                  v.arr[2] * t.arr[0] - v.arr[0] * t.arr[2],
                  v.arr[0] * t.arr[1] - v.arr[1] * v.arr[0]
		);
	}

	v3 unit_vector(v3 v){
		return v / sqrt(v.arr[0] * v.arr[0] + v.arr[1] * v.arr[1] + v.arr[2] * v.arr[2]);
	}
