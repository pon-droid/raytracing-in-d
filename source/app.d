import std.stdio;
import lib.v3;

/*
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
}
*/


void main()
{
   const int iw = 256;
   const int ih = 256;

   v3 temp = v3(3,3,3);

   unit_vector(temp);

   write("P3\n",iw," ",ih,"\n255\n");

   for(int y = ih-1; y >= 0; y--){
   	for(int x = iw-1; x >= 0; x--){
   		auto r = cast(double)(y) / (ih-1);
   		auto g = cast(double)(x) / (iw-1);
   		auto b = cast(double)(.25);

   		int ir = cast(int)(r * 255.999);
   		int ig = cast(int)(g * 255.999);
   		int ib = cast(int)(b * 255.999);

   		write(ir," ",ig," ",ib,"\n");
   		
   	}
   }

   writeln(unit_vector(temp));
}
