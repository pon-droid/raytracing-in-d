module lib.ray;

import lib.v3;

struct ray {
	v3 dir;
	v3 orig;

	this(v3 orig, v3 dir){
		this.dir = dir;
		this.orig = orig;
	}

	v3 at(in double t) inout{
		return dir*t + orig;
	}
}
