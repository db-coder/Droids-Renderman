surface
plastic( float constant_mode = 0.0, Ks=.5, Kd=.5, Ka=1, roughness=.1; color diffusecolor =1, specularcolor=1 )
{
    if (constant_mode == 1)
    {
        Ci = Cs * diffusecolor;
    }
    else
    {
        normal Nf;
        vector V;

        Nf = faceforward( normalize(N), I );
        V = -normalize(I);

        Oi = Os;
        Ci = Os * ( Cs * diffusecolor * (Ka*ambient() + Kd*diffuse(Nf)) +
	 	    specularcolor * Ks * specular(Nf,V,roughness) );
	 }
}
