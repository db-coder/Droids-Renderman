surface
plastic( float constant_mode = 0.0, Ks=.5, Kd=.5, Ka=1, roughness=.1; color diffusecolor =1, specularcolor=0.3 )
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
        Ci = ( Cs * diffusecolor * (Ka*ambient() + Kd*diffuse(Nf)) +
	 	    specularcolor * Ks * specular(Nf,V,roughness) );
        Ci += 0.25 * indirectdiffuse(P,Nf,1000);
	 }
}
