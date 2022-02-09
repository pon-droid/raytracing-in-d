module lib.v3;

import std.stdio;
import std.math;

alias colour = v3;

struct v3 {
	double[3] a;

	this(double x, double y, double z){
		this.a[0] = x;
		this.a[1] = y;
		this.a[2] = z;
	}

	v3 opBinary(string op)(in v3 rhs)inout{
	    mixin("return " ~ "v3(this.a[0]" ~op~ "rhs.a[0],this.a[1]" ~op~ "rhs.a[1]," ~ "this.a[2]" ~op~ "rhs.a[2]);");
		//return v3(a[0] * rhs.a[0],a[1] * rhs.a[1], a[2] * rhs.a[2]);
	}

	v3 opBinary(string op : "*")(in double r)inout{
		return v3(this.a[0] * r, this.a[1] * r, this.a[2] * r);
	}

	v3 opBinaryRight(string op : "*")(in double l)inout{
	    return v3(this.a[0]* l, this.a[1] * l, this.a[2] * l);
	}

	v3 opBinary(string op : "/")(in double r)inout{
	    immutable rhs = 1.0 / r;
	    return this * rhs;
	    //mixin("return " ~ "v3(this.a[0]" ~op~ "rhs,this.a[1]" ~op~ "rhs," ~ "this.a[2]" ~op~ "rhs);");
		//return v3(this.a[0] * rhs,a[1] * rhs.a[1], a[2] * rhs.a[2]);
	}

	v3 times(in v3 n)inout{
		return this * n;
	}
	
}


//Utils

	double dot(in v3 v, in v3 t) {
		return v.a[0] * t.a[0] + v.a[1] * t.a[1] + v.a[2] * t.a[2];
	}

	v3 cross(in v3 v, in v3 t) {
		return v3(v.a[1] * t.a[2] - v.a[2] * t.a[1],
                  v.a[2] * t.a[0] - v.a[0] * t.a[2],
                  v.a[0] * t.a[1] - v.a[1] * v.a[0]
		);
	}

	v3 unit_vector(in v3 v) {
		return v / sqrt(v.a[0] * v.a[0] + v.a[1] * v.a[1] + v.a[2] * v.a[2]);
	}

//Colour

    void ppm(in colour rgb){
    	int r = cast(int)(rgb.a[0] * 255.999);
   		int g = cast(int)(rgb.a[1] * 255.999);
   		int b = cast(int)(rgb.a[2] * 255.999);

   		write(r," ",g," ",b,"\n");
    }
