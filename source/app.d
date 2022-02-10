import std.stdio;
import lib.v3;
import lib.ray;




bool hit_sphere(in v3 centre, in double radius, in ray r){
   //https://www.lighthouse3d.com/tutorials/maths/ray-sphere-intersection/
   // pc is the distance between the ray start and the centre of a possible sphere
	v3 pc = r.orig - centre;
	
	auto a = dot(r.dir,r.dir);
	auto b = 2.0 * dot(pc,r.dir);
	auto c = dot(pc,pc) - radius*radius;
	auto discriminant = b*b - 4*a*c;
	
	return discriminant > 0;
}


v3 ray_colour(in ray r){
    if(hit_sphere(v3(0,0,-1),.5,r)) { return colour(1,0,0); }
    
	v3 unit_dir = unit_vector(r.dir);
	auto t = .5*(unit_dir.a[1] + 1.);
	return (1.0-t)*colour(1.0,1.0,1.0) + t*colour(0.5,0.7,1.0);
}




void main()
{
   const auto aspect = 16.0 / 9.0;
   const int iw = 400;
   const int ih = cast(int)(iw / aspect);

   auto viewport_h = 2.0;
   auto viewport_w = aspect * viewport_h;
   auto focal_length = 1.0;

   auto origin = v3(0,0,0);
   auto horz = v3(viewport_w,0,0);
   auto vert = v3(0,viewport_h,0);
   auto low_left_corn = origin - horz/2 - vert/2 - v3(0,0,focal_length);

   write("P3\n",iw," ",ih,"\n255\n");


   for(int y = ih-1; y >= 0; y--){
   	for(int x = iw-1; x >= 0; x--){

   	    auto u = cast(double)(x) / (iw-1);
   	    auto v = cast(double)(y) / (ih-1);
   	    
        ray r = ray(origin,low_left_corn + u*horz + v*vert - origin);

        
   		colour rgb = ray_colour(r);

   		ppm(rgb);
   		
   	}
   }

   //writeln(low_left_corn);
   //writeln(horz);
}
