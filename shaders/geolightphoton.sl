class geolightphoton (float intensity = 1;
                color lightColor = 1;
                float constant_mode = 0.0, Ks=.5, Kd=.5, Ka=1, Kc=1, roughness=.1; color diffusecolor =0.75, specularcolor=0)
{
    public void prelighting (output color Ci, Oi)
    {
        color emission = intensity * lightColor * Cs;
        emit(emission);
    }

    public void surface(output color Ci, Oi) {
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
	        Ci = Os * ( Cs * diffusecolor * (Ka*ambient() + Kd*diffuse(Nf)) + specularcolor * Ks * specular(Nf,V,roughness) );
	        Ci += 1.2 * indirectdiffuse(P,Nf,100);
	        Ci += Kc * photonmap("spcaustic.ptc", P, N, "estimator", 480);
		}
    }
}